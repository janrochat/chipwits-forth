package emulator

import "unicode"

func BasicSysEntry(data []byte) (uint16, bool) {
	if len(data) < 4 {
		return 0, false
	}
	loadAddr := uint16(data[0]) | (uint16(data[1]) << 8)
	offset := 2
	for {
		if offset+4 > len(data) {
			return 0, false
		}
		nextPtr := uint16(data[offset]) | (uint16(data[offset+1]) << 8)
		if nextPtr == 0 {
			return 0, false
		}
		lineStart := offset + 4
		lineEnd := lineStart
		for lineEnd < len(data) && data[lineEnd] != 0 {
			lineEnd++
		}
		if lineEnd > len(data) {
			return 0, false
		}
		for i := lineStart; i < lineEnd; i++ {
			if data[i] != 0x9e {
				continue
			}
			j := i + 1
			for j < lineEnd && unicode.IsSpace(rune(data[j])) {
				j++
			}
			if j < lineEnd && data[j] == '(' {
				j++
				for j < lineEnd && unicode.IsSpace(rune(data[j])) {
					j++
				}
			}
			var addr uint16
			var found bool
			for j < lineEnd && data[j] >= '0' && data[j] <= '9' {
				found = true
				addr = addr*10 + uint16(data[j]-'0')
				j++
			}
			if found {
				return addr, true
			}
		}
		if nextPtr <= loadAddr {
			return 0, false
		}
		offset = int(nextPtr-loadAddr) + 2
	}
}
