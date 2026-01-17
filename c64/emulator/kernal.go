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
	kernalACPTR  = 0xFFA5
	kernalCIOUT  = 0xFFA8
	kernalUNTLK  = 0xFFAB
	kernalREADST = 0xFFB7
	kernalUNLSN  = 0xFFAE
	kernalPLOT   = 0xFFF0
	kernalIOINIT = 0xFF20
	kernalLISTEN = 0xFFB1
	kernalTALK   = 0xFFB4
	kernalSECOND = 0xFF93
	kernalTKSA   = 0xFF96
	kernalSCNKEY = 0xFF9F
)

type Kernal struct {
	mem       *Memory
	Drives    map[byte]*DiskDrive
	stdin     *bufio.Reader
	stdout    io.Writer
	inputChan chan byte

	lfs struct {
		logical   byte
		device    byte
		secondary byte
	}
	name struct {
		value string
	}
	openFiles     map[byte]*OpenFile
	currentIn     byte
	currentOut    byte
	haltAfterSave string
	stopRequested bool
}

type OpenFile struct {
	Device        byte
	Secondary     byte
	Channel       byte
	Type          string
	CommandBuffer bytes.Buffer
}

func NewKernal(mem *Memory, drives map[byte]*DiskDrive, stdin io.Reader, stdout io.Writer) *Kernal {
	k := &Kernal{
		mem:       mem,
		Drives:    drives,
		stdin:     bufio.NewReader(stdin),
		stdout:    stdout,
		openFiles: make(map[byte]*OpenFile),
		inputChan: make(chan byte, 4096),
	}
	k.startInputReader()
	return k
}

func (k *Kernal) SetHaltAfterSave(name string) {
	k.haltAfterSave = strings.TrimSpace(name)
}

func (k *Kernal) StopRequested() bool {
	return k.stopRequested
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
	case kernalACPTR:
		k.AccPtr(cpu)
		return true
	case kernalCIOUT:
		k.CiOut(cpu)
		return true
	case kernalUNTLK:
		k.UnTalk(cpu)
		return true
	case kernalREADST:
		k.ReadST(cpu)
		return true
	case kernalUNLSN:
		k.Unlisten(cpu)
		return true
	case kernalPLOT:
		k.Plot(cpu)
		return true
	case kernalIOINIT:
		k.Noop(cpu)
		return true
	case kernalLISTEN:
		k.Listen(cpu)
		return true
	case kernalTALK:
		k.Talk(cpu)
		return true
	case kernalSECOND:
		k.Second(cpu)
		return true
	case kernalTKSA:
		k.Tksa(cpu)
		return true
	case kernalSCNKEY:
		k.ScanKey(cpu)
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
		b, err := k.readInputByte()
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
	b, ok, err := k.tryReadInputByte()
	if err != nil {
		cpu.A = 0
		cpu.SetCarry()
		return
	}
	if !ok {
		cpu.A = 0
		cpu.ClearCarry()
		return
	}
	cpu.A = b
	cpu.ClearCarry()
}

func (k *Kernal) ReadST(cpu *CPU) {
	cpu.A = 0
	cpu.ClearCarry()
}

func (k *Kernal) Unlisten(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) Plot(cpu *CPU) {
	cpu.X = 0
	cpu.Y = 0
	cpu.ClearCarry()
}

func (k *Kernal) Noop(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) AccPtr(cpu *CPU) {
	cpu.A = 0
	cpu.ClearCarry()
}

func (k *Kernal) CiOut(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) UnTalk(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) Listen(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) Talk(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) Second(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) Tksa(cpu *CPU) {
	cpu.ClearCarry()
}

func (k *Kernal) ScanKey(cpu *CPU) {
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
	if k.haltAfterSave != "" && strings.EqualFold(strings.TrimSpace(name), k.haltAfterSave) {
		k.stopRequested = true
	}
	cpu.ClearCarry()
}

func (k *Kernal) DebugState() string {
	return fmt.Sprintf("LFS=%d/%d/%d NAME=%q", k.lfs.logical, k.lfs.device, k.lfs.secondary, k.name.value)
}

func (k *Kernal) readInputByte() (byte, error) {
	b, ok := <-k.inputChan
	if !ok {
		return 0, io.EOF
	}
	if b == '\n' {
		return '\r', nil
	}
	return b, nil
}

func (k *Kernal) tryReadInputByte() (byte, bool, error) {
	select {
	case b, ok := <-k.inputChan:
		if !ok {
			return 0, false, io.EOF
		}
		if b == '\n' {
			return '\r', true, nil
		}
		return b, true, nil
	default:
		return 0, false, nil
	}
}

func (k *Kernal) startInputReader() {
	go func() {
		for {
			b, err := k.stdin.ReadByte()
			if err != nil {
				close(k.inputChan)
				return
			}
			if b != '@' {
				k.inputChan <- b
				continue
			}
			line, err := k.stdin.ReadString('\n')
			if err != nil && err != io.EOF {
				close(k.inputChan)
				return
			}
			full := strings.TrimRight("@"+line, "\r\n")
			if strings.HasPrefix(strings.ToUpper(full), "@HOST ") {
				k.handleHostCommand(strings.TrimSpace(full[len("@HOST "):]))
				if err == io.EOF {
					close(k.inputChan)
					return
				}
				continue
			}
			k.enqueueInput([]byte("@" + line))
			if err == io.EOF {
				close(k.inputChan)
				return
			}
		}
	}()
}

func (k *Kernal) handleHostCommand(command string) {
	fields := strings.Fields(command)
	if len(fields) == 0 {
		return
	}
	upper := strings.ToUpper(fields[0])
	switch {
	case upper == "HALT":
		k.stopRequested = true
		return
	case upper == "SWAP":
		if len(fields) < 3 {
			return
		}
		device := parseInt(fields[1])
		path := strings.Join(fields[2:], " ")
		k.swapDrive(byte(device), path)
		return
	case strings.HasPrefix(upper, "SWAP"):
		deviceStr := strings.TrimPrefix(upper, "SWAP")
		if deviceStr == "" || len(fields) < 2 {
			return
		}
		device := parseInt(deviceStr)
		path := strings.Join(fields[1:], " ")
		k.swapDrive(byte(device), path)
		return
	}
}

func (k *Kernal) swapDrive(device byte, path string) {
	if path == "" {
		return
	}
	image, err := LoadD64(path)
	if err != nil {
		return
	}
	drive, ok := k.Drives[device]
	if !ok {
		k.Drives[device] = NewDiskDrive(image)
		return
	}
	drive.SwapImage(image)
}

func (k *Kernal) enqueueInput(data []byte) {
	for _, b := range data {
		k.inputChan <- b
	}
}
