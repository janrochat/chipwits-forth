package emulator

import "testing"

func TestSectorOffset(t *testing.T) {
	image := &D64Image{Data: make([]byte, d64Size)}
	offset, err := image.sectorOffset(1, 0)
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if offset != 0 {
		t.Fatalf("expected offset 0, got %d", offset)
	}
	offset, err = image.sectorOffset(18, 0)
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if offset != 0x16500 {
		t.Fatalf("expected offset 0x16500, got 0x%X", offset)
	}
}

func TestReadWriteSector(t *testing.T) {
	image := &D64Image{Data: make([]byte, d64Size)}
	data := make([]byte, 256)
	data[0] = 0x42
	if err := image.WriteSector(1, 0, data); err != nil {
		t.Fatalf("write sector: %v", err)
	}
	read, err := image.ReadSector(1, 0)
	if err != nil {
		t.Fatalf("read sector: %v", err)
	}
	if read[0] != 0x42 {
		t.Fatalf("expected 0x42, got 0x%X", read[0])
	}
}
