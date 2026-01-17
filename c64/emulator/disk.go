package emulator

import (
	"bytes"
	"fmt"
	"strings"
)

type DiskDrive struct {
	Image    *D64Image
	Channels map[byte]*DiskChannel
}

type DiskChannel struct {
	Number      byte
	Type        string
	Data        []byte
	ReadPos     int
	WriteBuffer bytes.Buffer
}

func NewDiskDrive(image *D64Image) *DiskDrive {
	return &DiskDrive{Image: image, Channels: make(map[byte]*DiskChannel)}
}

func (d *DiskDrive) OpenChannel(number byte, mode string) *DiskChannel {
	ch := &DiskChannel{Number: number, Type: mode}
	d.Channels[number] = ch
	return ch
}

func (d *DiskDrive) CloseChannel(number byte) {
	delete(d.Channels, number)
}

func (d *DiskDrive) Channel(number byte) (*DiskChannel, bool) {
	ch, ok := d.Channels[number]
	return ch, ok
}

func (d *DiskDrive) ExecuteCommand(command string) error {
	parts := strings.Fields(command)
	if len(parts) == 0 {
		return nil
	}
	switch strings.ToUpper(parts[0]) {
	case "U1":
		if len(parts) < 5 {
			return fmt.Errorf("U1 requires channel, drive, track, sector")
		}
		channel := parseInt(parts[1])
		track := parseInt(parts[3])
		sector := parseInt(parts[4])
		buf, err := d.Image.ReadSector(track, sector)
		if err != nil {
			return err
		}
		ch := d.OpenChannel(byte(channel), "data")
		ch.Data = buf
		ch.ReadPos = 0
		return nil
	case "U2":
		if len(parts) < 5 {
			return fmt.Errorf("U2 requires channel, drive, track, sector")
		}
		channel := parseInt(parts[1])
		track := parseInt(parts[3])
		sector := parseInt(parts[4])
		ch, ok := d.Channel(byte(channel))
		if !ok {
			return fmt.Errorf("channel %d not open", channel)
		}
		data := ch.WriteBuffer.Bytes()
		if len(data) > 256 {
			return fmt.Errorf("too much data for sector")
		}
		sectorData := make([]byte, 256)
		copy(sectorData, data)
		return d.Image.WriteSector(track, sector, sectorData)
	default:
		return fmt.Errorf("unsupported command: %s", command)
	}
}

func parseInt(value string) int {
	var out int
	fmt.Sscanf(value, "%d", &out)
	return out
}
