package emulator

import (
	"bytes"
	"errors"
	"fmt"
	"os"
	"strings"
)

const (
	d64Tracks = 35
	d64Size   = 174848
)

type D64Image struct {
	Path  string
	Data  []byte
	Dirty bool
}

func LoadD64(path string) (*D64Image, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	if len(data) != d64Size {
		return nil, fmt.Errorf("unexpected d64 size %d", len(data))
	}
	return &D64Image{Path: path, Data: data}, nil
}

func (d *D64Image) Save() error {
	if !d.Dirty {
		return nil
	}
	if err := os.WriteFile(d.Path, d.Data, 0o644); err != nil {
		return err
	}
	d.Dirty = false
	return nil
}

func (d *D64Image) ReadSector(track, sector int) ([]byte, error) {
	offset, err := d.sectorOffset(track, sector)
	if err != nil {
		return nil, err
	}
	buf := make([]byte, 256)
	copy(buf, d.Data[offset:offset+256])
	return buf, nil
}

func (d *D64Image) WriteSector(track, sector int, data []byte) error {
	if len(data) != 256 {
		return fmt.Errorf("sector write requires 256 bytes")
	}
	offset, err := d.sectorOffset(track, sector)
	if err != nil {
		return err
	}
	copy(d.Data[offset:offset+256], data)
	d.Dirty = true
	return nil
}

func (d *D64Image) sectorOffset(track, sector int) (int, error) {
	if track < 1 || track > d64Tracks {
		return 0, fmt.Errorf("invalid track %d", track)
	}
	maxSector := sectorsPerTrack(track)
	if sector < 0 || sector >= maxSector {
		return 0, fmt.Errorf("invalid sector %d for track %d", sector, track)
	}
	offset := 0
	for t := 1; t < track; t++ {
		offset += sectorsPerTrack(t) * 256
	}
	offset += sector * 256
	return offset, nil
}

func sectorsPerTrack(track int) int {
	switch {
	case track >= 1 && track <= 17:
		return 21
	case track >= 18 && track <= 24:
		return 19
	case track >= 25 && track <= 30:
		return 18
	case track >= 31 && track <= 35:
		return 17
	default:
		return 0
	}
}

func (d *D64Image) LoadFile(name string) ([]byte, error) {
	entry, err := d.findDirEntry(name)
	if err != nil {
		return nil, err
	}
	track := int(entry[1])
	sector := int(entry[2])
	return d.readFileChain(track, sector)
}

func (d *D64Image) SaveFile(name string, data []byte) error {
	if len(data) < 2 {
		return errors.New("data must include load address")
	}
	if err := d.deleteFile(name); err != nil {
		return err
	}
	blocks := (len(data) + 253) / 254
	sectors, err := d.allocateSectors(blocks)
	if err != nil {
		return err
	}
	remaining := data
	for i, ts := range sectors {
		buffer := make([]byte, 256)
		if i == len(sectors)-1 {
			buffer[0] = 0
			buffer[1] = byte(len(remaining))
			copy(buffer[2:], remaining)
		} else {
			buffer[0] = byte(sectors[i+1].Track)
			buffer[1] = byte(sectors[i+1].Sector)
			copy(buffer[2:], remaining[:254])
			remaining = remaining[254:]
		}
		if err := d.WriteSector(ts.Track, ts.Sector, buffer); err != nil {
			return err
		}
	}
	if err := d.writeDirEntry(name, sectors[0].Track, sectors[0].Sector); err != nil {
		return err
	}
	return nil
}

type trackSector struct {
	Track  int
	Sector int
}

func (d *D64Image) readFileChain(track, sector int) ([]byte, error) {
	var out []byte
	for track != 0 {
		buf, err := d.ReadSector(track, sector)
		if err != nil {
			return nil, err
		}
		nextTrack := int(buf[0])
		nextSector := int(buf[1])
		if nextTrack == 0 {
			out = append(out, buf[2:2+nextSector]...)
			break
		}
		out = append(out, buf[2:]...)
		track = nextTrack
		sector = nextSector
	}
	return out, nil
}

func (d *D64Image) findDirEntry(name string) ([]byte, error) {
	upper := normalizeName(name)
	track := 18
	sector := 1
	for track != 0 {
		buf, err := d.ReadSector(track, sector)
		if err != nil {
			return nil, err
		}
		nextTrack := int(buf[0])
		nextSector := int(buf[1])
		for i := 0; i < 8; i++ {
			entryOffset := 2 + i*32
			if entryOffset >= len(buf) {
				break
			}
			entryEnd := entryOffset + 32
			entry := make([]byte, 32)
			if entryEnd > len(buf) {
				copy(entry, buf[entryOffset:])
			} else {
				copy(entry, buf[entryOffset:entryEnd])
			}
			if entry[0] == 0x00 {
				continue
			}
			entryName := strings.TrimRight(string(bytes.Trim(entry[3:19], "\x00")), "\xa0")
			if normalizeName(entryName) == upper {
				copyEntry := make([]byte, 32)
				copy(copyEntry, entry)
				return copyEntry, nil
			}
		}
		track = nextTrack
		sector = nextSector
	}
	return nil, fmt.Errorf("file not found: %s", name)
}

func (d *D64Image) writeDirEntry(name string, startTrack, startSector int) error {
	track := 18
	sector := 1
	for track != 0 {
		buf, err := d.ReadSector(track, sector)
		if err != nil {
			return err
		}
		for i := 0; i < 8; i++ {
			entryOffset := 2 + i*32
			if entryOffset+32 > len(buf) {
				continue
			}
			if buf[entryOffset] == 0x00 {
				buf[entryOffset] = 0x82
				buf[entryOffset+1] = byte(startTrack)
				buf[entryOffset+2] = byte(startSector)
				nameBytes := make([]byte, 16)
				for i := range nameBytes {
					nameBytes[i] = 0xa0
				}
				copy(nameBytes, []byte(strings.ToUpper(name)))
				copy(buf[entryOffset+3:entryOffset+19], nameBytes)
				return d.WriteSector(track, sector, buf)
			}
		}
		nextTrack := int(buf[0])
		nextSector := int(buf[1])
		if nextTrack == 0 {
			return errors.New("no free directory entries")
		}
		track = nextTrack
		sector = nextSector
	}
	return errors.New("no free directory entries")
}

func normalizeName(name string) string {
	return strings.ToUpper(strings.TrimSpace(name))
}

func (d *D64Image) deleteFile(name string) error {
	upper := normalizeName(name)
	track := 18
	sector := 1
	for track != 0 {
		buf, err := d.ReadSector(track, sector)
		if err != nil {
			return err
		}
		changed := false
		for i := 0; i < 8; i++ {
			entryOffset := 2 + i*32
			if entryOffset >= len(buf) {
				break
			}
			entryEnd := entryOffset + 32
			entry := make([]byte, 32)
			if entryEnd > len(buf) {
				copy(entry, buf[entryOffset:])
			} else {
				copy(entry, buf[entryOffset:entryEnd])
			}
			if entry[0] == 0x00 {
				continue
			}
			entryName := strings.TrimRight(string(bytes.Trim(entry[3:19], "\x00")), "\xa0")
			if normalizeName(entryName) == upper {
				startTrack := int(entry[1])
				startSector := int(entry[2])
				if err := d.freeFileChain(startTrack, startSector); err != nil {
					return err
				}
				buf[entryOffset] = 0x00
				changed = true
			}
		}
		if changed {
			return d.WriteSector(track, sector, buf)
		}
		track = int(buf[0])
		sector = int(buf[1])
	}
	return nil
}

func (d *D64Image) freeFileChain(track, sector int) error {
	for track != 0 {
		buf, err := d.ReadSector(track, sector)
		if err != nil {
			return err
		}
		nextTrack := int(buf[0])
		nextSector := int(buf[1])
		d.markFree(track, sector)
		track = nextTrack
		sector = nextSector
	}
	return nil
}

func (d *D64Image) allocateSectors(count int) ([]trackSector, error) {
	var out []trackSector
	for track := 1; track <= d64Tracks && len(out) < count; track++ {
		for sector := 0; sector < sectorsPerTrack(track); sector++ {
			if d.isFree(track, sector) {
				d.markUsed(track, sector)
				out = append(out, trackSector{Track: track, Sector: sector})
				if len(out) == count {
					return out, nil
				}
			}
		}
	}
	return nil, errors.New("not enough free sectors")
}

func (d *D64Image) isFree(track, sector int) bool {
	offset := bamOffset(track)
	bitmap := d.Data[offset+1 : offset+4]
	byteIndex := sector / 8
	bit := sector % 8
	return (bitmap[byteIndex] & (1 << uint(bit))) != 0
}

func (d *D64Image) markUsed(track, sector int) {
	offset := bamOffset(track)
	bitmap := d.Data[offset+1 : offset+4]
	byteIndex := sector / 8
	bit := sector % 8
	if bitmap[byteIndex]&(1<<uint(bit)) != 0 {
		bitmap[byteIndex] &^= (1 << uint(bit))
		d.Data[offset]--
		d.Dirty = true
	}
}

func (d *D64Image) markFree(track, sector int) {
	offset := bamOffset(track)
	bitmap := d.Data[offset+1 : offset+4]
	byteIndex := sector / 8
	bit := sector % 8
	if bitmap[byteIndex]&(1<<uint(bit)) == 0 {
		bitmap[byteIndex] |= (1 << uint(bit))
		d.Data[offset]++
		d.Dirty = true
	}
}

func bamOffset(track int) int {
	return 0x16500 + (track-1)*4
}
