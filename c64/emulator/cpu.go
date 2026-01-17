package emulator

import (
	"fmt"
)

type CPU struct {
	A, X, Y byte
	SP      byte
	PC      uint16
	P       byte
	Memory  *Memory
	Kernal  *Kernal
}

const (
	flagCarry     byte = 1 << 0
	flagZero      byte = 1 << 1
	flagInterrupt byte = 1 << 2
	flagDecimal   byte = 1 << 3
	flagBreak     byte = 1 << 4
	flagUnused    byte = 1 << 5
	flagOverflow  byte = 1 << 6
	flagNegative  byte = 1 << 7
)

func NewCPU(mem *Memory, kernal *Kernal) *CPU {
	return &CPU{
		SP:     0xFD,
		P:      flagInterrupt | flagUnused,
		Memory: mem,
		Kernal: kernal,
	}
}

func (c *CPU) Reset(vector uint16) {
	c.PC = vector
	c.SP = 0xFD
	c.P = flagInterrupt | flagUnused
}

func (c *CPU) SetCarry() {
	c.P |= flagCarry
}

func (c *CPU) ClearCarry() {
	c.P &^= flagCarry
}

func (c *CPU) SetZeroNeg(value byte) {
	if value == 0 {
		c.P |= flagZero
	} else {
		c.P &^= flagZero
	}
	if value&0x80 != 0 {
		c.P |= flagNegative
	} else {
		c.P &^= flagNegative
	}
}

func (c *CPU) push(value byte) {
	c.Memory.Write(0x0100|uint16(c.SP), value)
	c.SP--
}

func (c *CPU) pop() byte {
	c.SP++
	return c.Memory.Read(0x0100 | uint16(c.SP))
}

func (c *CPU) Step() error {
	opcode := c.Memory.Read(c.PC)
	c.PC++
	switch opcode {
	case 0x00: // BRK
		c.PC++
		c.push(byte(c.PC >> 8))
		c.push(byte(c.PC & 0xFF))
		c.push(c.P | flagBreak | flagUnused)
		c.P |= flagInterrupt
		c.PC = c.Memory.Read16(0xFFFE)
	case 0x01: // ORA (indirect,X)
		addr := c.indirectX()
		c.A |= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x05: // ORA zp
		addr := c.zeroPage()
		c.A |= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x06: // ASL zp
		addr := c.zeroPage()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val <<= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x08: // PHP
		c.push(c.P | flagBreak | flagUnused)
	case 0x09: // ORA #
		c.A |= c.immediate()
		c.SetZeroNeg(c.A)
	case 0x0A: // ASL A
		c.P = (c.P &^ flagCarry) | (c.A>>7)&1
		c.A <<= 1
		c.SetZeroNeg(c.A)
	case 0x0D: // ORA abs
		addr := c.absolute()
		c.A |= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x0E: // ASL abs
		addr := c.absolute()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val <<= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x10: // BPL
		c.branch(c.P&flagNegative == 0)
	case 0x11: // ORA (indirect),Y
		addr := c.indirectY()
		c.A |= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x15: // ORA zp,X
		addr := c.zeroPageX()
		c.A |= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x16: // ASL zp,X
		addr := c.zeroPageX()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val <<= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x18: // CLC
		c.ClearCarry()
	case 0x19: // ORA abs,Y
		addr := c.absoluteY()
		c.A |= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x1D: // ORA abs,X
		addr := c.absoluteX()
		c.A |= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x1E: // ASL abs,X
		addr := c.absoluteX()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val <<= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x20: // JSR
		addr := c.absolute()
		returnAddr := c.PC - 1
		c.push(byte(returnAddr >> 8))
		c.push(byte(returnAddr & 0xFF))
		if c.Kernal != nil && c.Kernal.HandleJSR(c, addr) {
			low := c.pop()
			high := c.pop()
			c.PC = uint16(low) | (uint16(high) << 8)
			c.PC++
			break
		}
		c.PC = addr
	case 0x21: // AND (indirect,X)
		addr := c.indirectX()
		c.A &= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x24: // BIT zp
		addr := c.zeroPage()
		c.bit(c.Memory.Read(addr))
	case 0x25: // AND zp
		addr := c.zeroPage()
		c.A &= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x26: // ROL zp
		addr := c.zeroPage()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val = (val << 1) | carry
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x28: // PLP
		c.P = (c.pop() | flagUnused) &^ flagBreak
	case 0x29: // AND #
		c.A &= c.immediate()
		c.SetZeroNeg(c.A)
	case 0x2A: // ROL A
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (c.A>>7)&1
		c.A = (c.A << 1) | carry
		c.SetZeroNeg(c.A)
	case 0x2C: // BIT abs
		addr := c.absolute()
		c.bit(c.Memory.Read(addr))
	case 0x2D: // AND abs
		addr := c.absolute()
		c.A &= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x2E: // ROL abs
		addr := c.absolute()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val = (val << 1) | carry
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x30: // BMI
		c.branch(c.P&flagNegative != 0)
	case 0x31: // AND (indirect),Y
		addr := c.indirectY()
		c.A &= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x35: // AND zp,X
		addr := c.zeroPageX()
		c.A &= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x36: // ROL zp,X
		addr := c.zeroPageX()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val = (val << 1) | carry
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x38: // SEC
		c.SetCarry()
	case 0x39: // AND abs,Y
		addr := c.absoluteY()
		c.A &= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x3D: // AND abs,X
		addr := c.absoluteX()
		c.A &= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x3E: // ROL abs,X
		addr := c.absoluteX()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val>>7)&1
		val = (val << 1) | carry
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x40: // RTI
		c.P = (c.pop() | flagUnused) &^ flagBreak
		low := uint16(c.pop())
		high := uint16(c.pop())
		c.PC = low | (high << 8)
	case 0x41: // EOR (indirect,X)
		addr := c.indirectX()
		c.A ^= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x45: // EOR zp
		addr := c.zeroPage()
		c.A ^= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x46: // LSR zp
		addr := c.zeroPage()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val & 1)
		val >>= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x48: // PHA
		c.push(c.A)
	case 0x49: // EOR #
		c.A ^= c.immediate()
		c.SetZeroNeg(c.A)
	case 0x4A: // LSR A
		c.P = (c.P &^ flagCarry) | (c.A & 1)
		c.A >>= 1
		c.SetZeroNeg(c.A)
	case 0x4C: // JMP abs
		c.PC = c.absolute()
	case 0x4D: // EOR abs
		addr := c.absolute()
		c.A ^= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x4E: // LSR abs
		addr := c.absolute()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val & 1)
		val >>= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x50: // BVC
		c.branch(c.P&flagOverflow == 0)
	case 0x51: // EOR (indirect),Y
		addr := c.indirectY()
		c.A ^= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x55: // EOR zp,X
		addr := c.zeroPageX()
		c.A ^= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x56: // LSR zp,X
		addr := c.zeroPageX()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val & 1)
		val >>= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x58: // CLI
		c.P &^= flagInterrupt
	case 0x59: // EOR abs,Y
		addr := c.absoluteY()
		c.A ^= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x5D: // EOR abs,X
		addr := c.absoluteX()
		c.A ^= c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0x5E: // LSR abs,X
		addr := c.absoluteX()
		val := c.Memory.Read(addr)
		c.P = (c.P &^ flagCarry) | (val & 1)
		val >>= 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x60: // RTS
		low := uint16(c.pop())
		high := uint16(c.pop())
		c.PC = (high << 8) | low
		c.PC++
	case 0x61: // ADC (indirect,X)
		addr := c.indirectX()
		c.adc(c.Memory.Read(addr))
	case 0x65: // ADC zp
		addr := c.zeroPage()
		c.adc(c.Memory.Read(addr))
	case 0x66: // ROR zp
		addr := c.zeroPage()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val & 1)
		val = (val >> 1) | (carry << 7)
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x68: // PLA
		c.A = c.pop()
		c.SetZeroNeg(c.A)
	case 0x69: // ADC #
		c.adc(c.immediate())
	case 0x6A: // ROR A
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (c.A & 1)
		c.A = (c.A >> 1) | (carry << 7)
		c.SetZeroNeg(c.A)
	case 0x6C: // JMP (indirect)
		addr := c.absolute()
		c.PC = c.Memory.Read16Bug(addr)
	case 0x6D: // ADC abs
		addr := c.absolute()
		c.adc(c.Memory.Read(addr))
	case 0x6E: // ROR abs
		addr := c.absolute()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val & 1)
		val = (val >> 1) | (carry << 7)
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x70: // BVS
		c.branch(c.P&flagOverflow != 0)
	case 0x71: // ADC (indirect),Y
		addr := c.indirectY()
		c.adc(c.Memory.Read(addr))
	case 0x75: // ADC zp,X
		addr := c.zeroPageX()
		c.adc(c.Memory.Read(addr))
	case 0x76: // ROR zp,X
		addr := c.zeroPageX()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val & 1)
		val = (val >> 1) | (carry << 7)
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x78: // SEI
		c.P |= flagInterrupt
	case 0x79: // ADC abs,Y
		addr := c.absoluteY()
		c.adc(c.Memory.Read(addr))
	case 0x7D: // ADC abs,X
		addr := c.absoluteX()
		c.adc(c.Memory.Read(addr))
	case 0x7E: // ROR abs,X
		addr := c.absoluteX()
		val := c.Memory.Read(addr)
		carry := c.P & flagCarry
		c.P = (c.P &^ flagCarry) | (val & 1)
		val = (val >> 1) | (carry << 7)
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0x81: // STA (indirect,X)
		addr := c.indirectX()
		c.Memory.Write(addr, c.A)
	case 0x84: // STY zp
		addr := c.zeroPage()
		c.Memory.Write(addr, c.Y)
	case 0x85: // STA zp
		addr := c.zeroPage()
		c.Memory.Write(addr, c.A)
	case 0x86: // STX zp
		addr := c.zeroPage()
		c.Memory.Write(addr, c.X)
	case 0x88: // DEY
		c.Y--
		c.SetZeroNeg(c.Y)
	case 0x8A: // TXA
		c.A = c.X
		c.SetZeroNeg(c.A)
	case 0x8C: // STY abs
		addr := c.absolute()
		c.Memory.Write(addr, c.Y)
	case 0x8D: // STA abs
		addr := c.absolute()
		c.Memory.Write(addr, c.A)
	case 0x8E: // STX abs
		addr := c.absolute()
		c.Memory.Write(addr, c.X)
	case 0x90: // BCC
		c.branch(c.P&flagCarry == 0)
	case 0x91: // STA (indirect),Y
		addr := c.indirectY()
		c.Memory.Write(addr, c.A)
	case 0x94: // STY zp,X
		addr := c.zeroPageX()
		c.Memory.Write(addr, c.Y)
	case 0x95: // STA zp,X
		addr := c.zeroPageX()
		c.Memory.Write(addr, c.A)
	case 0x96: // STX zp,Y
		addr := c.zeroPageY()
		c.Memory.Write(addr, c.X)
	case 0x98: // TYA
		c.A = c.Y
		c.SetZeroNeg(c.A)
	case 0x99: // STA abs,Y
		addr := c.absoluteY()
		c.Memory.Write(addr, c.A)
	case 0x9A: // TXS
		c.SP = c.X
	case 0x9D: // STA abs,X
		addr := c.absoluteX()
		c.Memory.Write(addr, c.A)
	case 0xA0: // LDY #
		c.Y = c.immediate()
		c.SetZeroNeg(c.Y)
	case 0xA1: // LDA (indirect,X)
		addr := c.indirectX()
		c.A = c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0xA2: // LDX #
		c.X = c.immediate()
		c.SetZeroNeg(c.X)
	case 0xA4: // LDY zp
		addr := c.zeroPage()
		c.Y = c.Memory.Read(addr)
		c.SetZeroNeg(c.Y)
	case 0xA5: // LDA zp
		addr := c.zeroPage()
		c.A = c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0xA6: // LDX zp
		addr := c.zeroPage()
		c.X = c.Memory.Read(addr)
		c.SetZeroNeg(c.X)
	case 0xA8: // TAY
		c.Y = c.A
		c.SetZeroNeg(c.Y)
	case 0xA9: // LDA #
		c.A = c.immediate()
		c.SetZeroNeg(c.A)
	case 0xAA: // TAX
		c.X = c.A
		c.SetZeroNeg(c.X)
	case 0xAC: // LDY abs
		addr := c.absolute()
		c.Y = c.Memory.Read(addr)
		c.SetZeroNeg(c.Y)
	case 0xAD: // LDA abs
		addr := c.absolute()
		c.A = c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0xAE: // LDX abs
		addr := c.absolute()
		c.X = c.Memory.Read(addr)
		c.SetZeroNeg(c.X)
	case 0xB0: // BCS
		c.branch(c.P&flagCarry != 0)
	case 0xB1: // LDA (indirect),Y
		addr := c.indirectY()
		c.A = c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0xB4: // LDY zp,X
		addr := c.zeroPageX()
		c.Y = c.Memory.Read(addr)
		c.SetZeroNeg(c.Y)
	case 0xB5: // LDA zp,X
		addr := c.zeroPageX()
		c.A = c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0xB6: // LDX zp,Y
		addr := c.zeroPageY()
		c.X = c.Memory.Read(addr)
		c.SetZeroNeg(c.X)
	case 0xB8: // CLV
		c.P &^= flagOverflow
	case 0xB9: // LDA abs,Y
		addr := c.absoluteY()
		c.A = c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0xBA: // TSX
		c.X = c.SP
		c.SetZeroNeg(c.X)
	case 0xBC: // LDY abs,X
		addr := c.absoluteX()
		c.Y = c.Memory.Read(addr)
		c.SetZeroNeg(c.Y)
	case 0xBD: // LDA abs,X
		addr := c.absoluteX()
		c.A = c.Memory.Read(addr)
		c.SetZeroNeg(c.A)
	case 0xBE: // LDX abs,Y
		addr := c.absoluteY()
		c.X = c.Memory.Read(addr)
		c.SetZeroNeg(c.X)
	case 0xC0: // CPY #
		c.compare(c.Y, c.immediate())
	case 0xC1: // CMP (indirect,X)
		addr := c.indirectX()
		c.compare(c.A, c.Memory.Read(addr))
	case 0xC4: // CPY zp
		addr := c.zeroPage()
		c.compare(c.Y, c.Memory.Read(addr))
	case 0xC5: // CMP zp
		addr := c.zeroPage()
		c.compare(c.A, c.Memory.Read(addr))
	case 0xC6: // DEC zp
		addr := c.zeroPage()
		val := c.Memory.Read(addr) - 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0xC8: // INY
		c.Y++
		c.SetZeroNeg(c.Y)
	case 0xC9: // CMP #
		c.compare(c.A, c.immediate())
	case 0xCA: // DEX
		c.X--
		c.SetZeroNeg(c.X)
	case 0xCC: // CPY abs
		addr := c.absolute()
		c.compare(c.Y, c.Memory.Read(addr))
	case 0xCD: // CMP abs
		addr := c.absolute()
		c.compare(c.A, c.Memory.Read(addr))
	case 0xCE: // DEC abs
		addr := c.absolute()
		val := c.Memory.Read(addr) - 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0xD0: // BNE
		c.branch(c.P&flagZero == 0)
	case 0xD1: // CMP (indirect),Y
		addr := c.indirectY()
		c.compare(c.A, c.Memory.Read(addr))
	case 0xD5: // CMP zp,X
		addr := c.zeroPageX()
		c.compare(c.A, c.Memory.Read(addr))
	case 0xD6: // DEC zp,X
		addr := c.zeroPageX()
		val := c.Memory.Read(addr) - 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0xD8: // CLD
		c.P &^= flagDecimal
	case 0xD9: // CMP abs,Y
		addr := c.absoluteY()
		c.compare(c.A, c.Memory.Read(addr))
	case 0xDD: // CMP abs,X
		addr := c.absoluteX()
		c.compare(c.A, c.Memory.Read(addr))
	case 0xDE: // DEC abs,X
		addr := c.absoluteX()
		val := c.Memory.Read(addr) - 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0xE0: // CPX #
		c.compare(c.X, c.immediate())
	case 0xE1: // SBC (indirect,X)
		addr := c.indirectX()
		c.sbc(c.Memory.Read(addr))
	case 0xE4: // CPX zp
		addr := c.zeroPage()
		c.compare(c.X, c.Memory.Read(addr))
	case 0xE5: // SBC zp
		addr := c.zeroPage()
		c.sbc(c.Memory.Read(addr))
	case 0xE6: // INC zp
		addr := c.zeroPage()
		val := c.Memory.Read(addr) + 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0xE8: // INX
		c.X++
		c.SetZeroNeg(c.X)
	case 0xE9: // SBC #
		c.sbc(c.immediate())
	case 0xEA: // NOP
	case 0xEC: // CPX abs
		addr := c.absolute()
		c.compare(c.X, c.Memory.Read(addr))
	case 0xED: // SBC abs
		addr := c.absolute()
		c.sbc(c.Memory.Read(addr))
	case 0xEE: // INC abs
		addr := c.absolute()
		val := c.Memory.Read(addr) + 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0xF0: // BEQ
		c.branch(c.P&flagZero != 0)
	case 0xF1: // SBC (indirect),Y
		addr := c.indirectY()
		c.sbc(c.Memory.Read(addr))
	case 0xF5: // SBC zp,X
		addr := c.zeroPageX()
		c.sbc(c.Memory.Read(addr))
	case 0xF6: // INC zp,X
		addr := c.zeroPageX()
		val := c.Memory.Read(addr) + 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	case 0xF8: // SED
		c.P |= flagDecimal
	case 0xF9: // SBC abs,Y
		addr := c.absoluteY()
		c.sbc(c.Memory.Read(addr))
	case 0xFD: // SBC abs,X
		addr := c.absoluteX()
		c.sbc(c.Memory.Read(addr))
	case 0xFE: // INC abs,X
		addr := c.absoluteX()
		val := c.Memory.Read(addr) + 1
		c.Memory.Write(addr, val)
		c.SetZeroNeg(val)
	default:
		return fmt.Errorf("unsupported opcode %02X at %04X", opcode, c.PC-1)
	}
	return nil
}

func (c *CPU) immediate() byte {
	val := c.Memory.Read(c.PC)
	c.PC++
	return val
}

func (c *CPU) zeroPage() uint16 {
	addr := uint16(c.Memory.Read(c.PC))
	c.PC++
	return addr
}

func (c *CPU) zeroPageX() uint16 {
	addr := uint16(c.Memory.Read(c.PC)+c.X) & 0xFF
	c.PC++
	return addr
}

func (c *CPU) zeroPageY() uint16 {
	addr := uint16(c.Memory.Read(c.PC)+c.Y) & 0xFF
	c.PC++
	return addr
}

func (c *CPU) absolute() uint16 {
	addr := c.Memory.Read16(c.PC)
	c.PC += 2
	return addr
}

func (c *CPU) absoluteX() uint16 {
	addr := c.absolute()
	return addr + uint16(c.X)
}

func (c *CPU) absoluteY() uint16 {
	addr := c.absolute()
	return addr + uint16(c.Y)
}

func (c *CPU) indirectX() uint16 {
	ptr := uint16(c.Memory.Read(c.PC)+c.X) & 0xFF
	c.PC++
	lo := uint16(c.Memory.Read(ptr))
	hi := uint16(c.Memory.Read((ptr + 1) & 0xFF))
	return lo | (hi << 8)
}

func (c *CPU) indirectY() uint16 {
	ptr := uint16(c.Memory.Read(c.PC))
	c.PC++
	lo := uint16(c.Memory.Read(ptr))
	hi := uint16(c.Memory.Read((ptr + 1) & 0xFF))
	return (lo | (hi << 8)) + uint16(c.Y)
}

func (c *CPU) branch(condition bool) {
	offset := int8(c.Memory.Read(c.PC))
	c.PC++
	if condition {
		c.PC = uint16(int32(c.PC) + int32(offset))
	}
}

func (c *CPU) adc(value byte) {
	carry := byte(0)
	if c.P&flagCarry != 0 {
		carry = 1
	}
	if c.P&flagDecimal != 0 {
		c.adcDecimal(value, carry)
		return
	}
	sum := uint16(c.A) + uint16(value) + uint16(carry)
	result := byte(sum)
	if sum > 0xFF {
		c.P |= flagCarry
	} else {
		c.P &^= flagCarry
	}
	if (^uint16(c.A^value) & uint16(c.A^result) & 0x80) != 0 {
		c.P |= flagOverflow
	} else {
		c.P &^= flagOverflow
	}
	c.A = result
	c.SetZeroNeg(c.A)
}

func (c *CPU) adcDecimal(value, carry byte) {
	lo := (c.A & 0x0F) + (value & 0x0F) + carry
	hi := (c.A >> 4) + (value >> 4)
	if lo > 9 {
		lo += 6
		hi++
	}
	if hi > 9 {
		hi += 6
		c.P |= flagCarry
	} else {
		c.P &^= flagCarry
	}
	result := (hi << 4) | (lo & 0x0F)
	c.A = result
	c.SetZeroNeg(c.A)
}

func (c *CPU) sbc(value byte) {
	carry := byte(0)
	if c.P&flagCarry != 0 {
		carry = 1
	}
	if c.P&flagDecimal != 0 {
		c.sbcDecimal(value, carry)
		return
	}
	value ^= 0xFF
	sum := uint16(c.A) + uint16(value) + uint16(carry)
	result := byte(sum)
	if sum > 0xFF {
		c.P |= flagCarry
	} else {
		c.P &^= flagCarry
	}
	if (^uint16(c.A^value) & uint16(c.A^result) & 0x80) != 0 {
		c.P |= flagOverflow
	} else {
		c.P &^= flagOverflow
	}
	c.A = result
	c.SetZeroNeg(c.A)
}

func (c *CPU) sbcDecimal(value, carry byte) {
	lo := (c.A & 0x0F) - (value & 0x0F) - (1 - carry)
	hi := (c.A >> 4) - (value >> 4)
	if int8(lo) < 0 {
		lo -= 6
		hi--
	}
	if int8(hi) < 0 {
		hi -= 6
		c.P &^= flagCarry
	} else {
		c.P |= flagCarry
	}
	result := (hi << 4) | (lo & 0x0F)
	c.A = result
	c.SetZeroNeg(c.A)
}

func (c *CPU) compare(reg, value byte) {
	result := reg - value
	if reg >= value {
		c.P |= flagCarry
	} else {
		c.P &^= flagCarry
	}
	c.SetZeroNeg(result)
}

func (c *CPU) bit(value byte) {
	if c.A&value == 0 {
		c.P |= flagZero
	} else {
		c.P &^= flagZero
	}
	if value&0x80 != 0 {
		c.P |= flagNegative
	} else {
		c.P &^= flagNegative
	}
	if value&0x40 != 0 {
		c.P |= flagOverflow
	} else {
		c.P &^= flagOverflow
	}
}
