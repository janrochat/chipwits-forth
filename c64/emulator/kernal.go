package emulator

import (
	"bufio"
	"bytes"
	"fmt"
	"io"
	"strings"
)

const (
	kernalSETLFS = 0xFFBA
	kernalSETNAM = 0xFFBD
	kernalOPEN   = 0xFFC0
	kernalCLOSE  = 0xFFC3
	kernalCHKIN  = 0xFFC6
	kernalCHKOUT = 0xFFC9
	kernalCLRCHN = 0xFFCC
	kernalCHRIN  = 0xFFCF
	kernalCHROUT = 0xFFD2
	kernalLOAD   = 0xFFD5
	kernalSAVE   = 0xFFD8
	kernalGETIN  = 0xFFE4
)

type Kernal struct {
	mem    *Memory
	Drives map[byte]*DiskDrive
	stdin  *bufio.Reader
	stdout io.Writer

	lfs struct {
		logical   byte
		device    byte
		secondary byte
	}
	name struct {
		value string
	}
	openFiles  map[byte]*OpenFile
	currentIn  byte
	currentOut byte
}

type OpenFile struct {
	Device        byte
	Secondary     byte
	Channel       byte
	Type          string
	CommandBuffer bytes.Buffer
}

func NewKernal(mem *Memory, drives map[byte]*DiskDrive, stdin io.Reader, stdout io.Writer) *Kernal {
	return &Kernal{
		mem:       mem,
		Drives:    drives,
		stdin:     bufio.NewReader(stdin),
		stdout:    stdout,
		openFiles: make(map[byte]*OpenFile),
	}
}

func (k *Kernal) HandleJSR(cpu *CPU, addr uint16) bool {
	switch addr {
	case kernalSETLFS:
		k.SetLFS(cpu)
		return true
	case kernalSETNAM:
		k.SetNam(cpu)
		return true
	case kernalOPEN:
		k.Open(cpu)
		return true
	case kernalCLOSE:
		k.Close(cpu)
		return true
	case kernalCHKIN:
		k.ChkIn(cpu)
		return true
	case kernalCHKOUT:
		k.ChkOut(cpu)
		return true
	case kernalCLRCHN:
		k.ClrChn(cpu)
		return true
	case kernalCHRIN:
		k.ChrIn(cpu)
		return true
	case kernalCHROUT:
		k.ChrOut(cpu)
		return true
	case kernalLOAD:
		k.Load(cpu)
		return true
	case kernalSAVE:
		k.Save(cpu)
		return true
	case kernalGETIN:
		k.GetIn(cpu)
		return true
	default:
		return false
	}
}

func (k *Kernal) SetLFS(cpu *CPU) {
	k.lfs.logical = cpu.A
	k.lfs.device = cpu.X
	k.lfs.secondary = cpu.Y
	cpu.ClearCarry()
}

func (k *Kernal) SetNam(cpu *CPU) {
	length := int(cpu.A)
	addr := uint16(cpu.X) | (uint16(cpu.Y) << 8)
	buf := make([]byte, length)
	for i := 0; i < length; i++ {
		buf[i] = k.mem.Read(addr + uint16(i))
	}
	k.name.value = strings.TrimSpace(string(buf))
	cpu.ClearCarry()
}

func (k *Kernal) Open(cpu *CPU) {
	logical := k.lfs.logical
	k.openFiles[logical] = &OpenFile{
		Device:    k.lfs.device,
		Secondary: k.lfs.secondary,
		Channel:   logical,
		Type:      "seq",
	}
	cpu.ClearCarry()
}

func (k *Kernal) Close(cpu *CPU) {
	logical := cpu.A
	if file, ok := k.openFiles[logical]; ok {
		if file.Device >= 8 {
			if drive, ok := k.Drives[file.Device]; ok {
				if file.Secondary == 15 {
					command := strings.TrimSpace(file.CommandBuffer.String())
					if command != "" {
						_ = drive.ExecuteCommand(command)
					}
				}
				drive.CloseChannel(logical)
				_ = drive.Image.Save()
			}
		}
		delete(k.openFiles, logical)
	}
	cpu.ClearCarry()
}

func (k *Kernal) ChkIn(cpu *CPU) {
	logical := cpu.X
	k.currentIn = logical
	cpu.ClearCarry()
}

func (k *Kernal) ChkOut(cpu *CPU) {
	logical := cpu.X
	k.currentOut = logical
	cpu.ClearCarry()
}

func (k *Kernal) ClrChn(cpu *CPU) {
	k.currentIn = 0
	k.currentOut = 0
	cpu.ClearCarry()
}

func (k *Kernal) ChrIn(cpu *CPU) {
	file, ok := k.openFiles[k.currentIn]
	if !ok || file.Device == 0 {
		b, err := k.stdin.ReadByte()
		if err != nil {
			cpu.A = 0
			cpu.SetCarry()
			return
		}
		cpu.A = b
		cpu.ClearCarry()
		return
	}
	if file.Device >= 8 {
		drive := k.Drives[file.Device]
		ch, ok := drive.Channel(file.Channel)
		if !ok || ch.ReadPos >= len(ch.Data) {
			cpu.A = 0
			cpu.SetCarry()
			return
		}
		cpu.A = ch.Data[ch.ReadPos]
		ch.ReadPos++
		cpu.ClearCarry()
		return
	}
	cpu.A = 0
	cpu.SetCarry()
}

func (k *Kernal) ChrOut(cpu *CPU) {
	b := cpu.A
	file, ok := k.openFiles[k.currentOut]
	if !ok || file.Device == 3 || file.Device == 0 {
		_, _ = k.stdout.Write([]byte{b})
		cpu.ClearCarry()
		return
	}
	if file.Device >= 8 {
		drive := k.Drives[file.Device]
		if file.Secondary == 15 {
			file.CommandBuffer.WriteByte(b)
			if b == '\r' || b == 13 {
				command := strings.TrimSpace(file.CommandBuffer.String())
				file.CommandBuffer.Reset()
				if command != "" {
					_ = drive.ExecuteCommand(command)
				}
			}
			cpu.ClearCarry()
			return
		}
		ch := drive.OpenChannel(file.Channel, "data")
		ch.WriteBuffer.WriteByte(b)
		cpu.ClearCarry()
		return
	}
	cpu.SetCarry()
}

func (k *Kernal) GetIn(cpu *CPU) {
	b, err := k.stdin.ReadByte()
	if err != nil {
		cpu.A = 0
		cpu.SetCarry()
		return
	}
	cpu.A = b
	cpu.ClearCarry()
}

func (k *Kernal) Load(cpu *CPU) {
	name := k.name.value
	device := k.lfs.device
	drive, ok := k.Drives[device]
	if !ok {
		cpu.SetCarry()
		return
	}
	data, err := drive.Image.LoadFile(name)
	if err != nil {
		cpu.SetCarry()
		return
	}
	if len(data) < 2 {
		cpu.SetCarry()
		return
	}
	addr := uint16(data[0]) | (uint16(data[1]) << 8)
	copy(k.mem.Data[addr:], data[2:])
	cpu.X = byte((addr + uint16(len(data)-2)) & 0xFF)
	cpu.Y = byte(((addr + uint16(len(data)-2)) >> 8) & 0xFF)
	cpu.ClearCarry()
}

func (k *Kernal) Save(cpu *CPU) {
	name := k.name.value
	device := k.lfs.device
	drive, ok := k.Drives[device]
	if !ok {
		cpu.SetCarry()
		return
	}
	start := uint16(cpu.A) | (uint16(cpu.X) << 8)
	end := uint16(cpu.Y) | (uint16(cpu.Memory.Read(0xAE)) << 8)
	if end < start {
		cpu.SetCarry()
		return
	}
	length := end - start
	data := make([]byte, length+2)
	data[0] = byte(start & 0xFF)
	data[1] = byte(start >> 8)
	copy(data[2:], k.mem.Data[start:end])
	if err := drive.Image.SaveFile(name, data); err != nil {
		cpu.SetCarry()
		return
	}
	_ = drive.Image.Save()
	cpu.ClearCarry()
}

func (k *Kernal) DebugState() string {
	return fmt.Sprintf("LFS=%d/%d/%d NAME=%q", k.lfs.logical, k.lfs.device, k.lfs.secondary, k.name.value)
}
