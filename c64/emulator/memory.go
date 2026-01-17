package emulator

type Memory struct {
	Data [65536]byte
}

func (m *Memory) Read(addr uint16) byte {
	return m.Data[addr]
}

func (m *Memory) Write(addr uint16, value byte) {
	m.Data[addr] = value
}

func (m *Memory) Read16(addr uint16) uint16 {
	lo := uint16(m.Read(addr))
	hi := uint16(m.Read(addr + 1))
	return lo | (hi << 8)
}

func (m *Memory) Read16Bug(addr uint16) uint16 {
	lo := uint16(m.Read(addr))
	hiAddr := (addr & 0xFF00) | uint16(byte(addr+1))
	hi := uint16(m.Read(hiAddr))
	return lo | (hi << 8)
}

func (m *Memory) Write16(addr uint16, value uint16) {
	m.Write(addr, byte(value&0xFF))
	m.Write(addr+1, byte(value>>8))
}
