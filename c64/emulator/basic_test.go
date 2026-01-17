package emulator

import "testing"

func TestBasicSysEntryPlain(t *testing.T) {
	data := basicProgram([]byte{0x9e, ' ', '2', '0', '6', '4'})
	addr, ok := BasicSysEntry(data)
	if !ok {
		t.Fatalf("expected SYS address to be found")
	}
	if addr != 2064 {
		t.Fatalf("expected SYS address 2064, got %d", addr)
	}
}

func TestBasicSysEntryParens(t *testing.T) {
	data := basicProgram([]byte{0x9e, '(', '2', '0', '6', '4', ')'})
	addr, ok := BasicSysEntry(data)
	if !ok {
		t.Fatalf("expected SYS address to be found")
	}
	if addr != 2064 {
		t.Fatalf("expected SYS address 2064, got %d", addr)
	}
}

func basicProgram(line []byte) []byte {
	loadAddr := []byte{0x01, 0x08}
	nextLine := []byte{0x0b, 0x08}
	lineNumber := []byte{0x0a, 0x00}
	return append(loadAddr, append(append(append(nextLine, lineNumber...), append(line, 0x00)...), 0x00, 0x00)...)
}
