package main

import (
	"errors"
	"fmt"
	"io"
	"os"
	"sort"
	"strings"

	"github.com/spf13/pflag"
)

type entry struct {
	Name     string
	NFA      uint16
	LFA      uint16
	CFAAddr  uint16
	CFAValue uint16
	PFA      uint16
	Flags    byte
}

type dictionary struct {
	Entries map[uint16]*entry
	Ordered []*entry
	ByName  map[string]*entry
	ByCode  map[uint16]*entry
}

type prg struct {
	LoadAddr uint16
	Payload  []byte
}

func main() {
	var prgPath string
	var words []string
	var showInfo bool
	var doDecompile bool
	var listWords bool
	var listColon bool

	pflag.StringVar(&prgPath, "prg", "", "path to CWMIN PRG")
	pflag.StringSliceVarP(&words, "word", "w", nil, "FORTH word(s) to inspect or decompile")
	pflag.BoolVar(&showInfo, "info", false, "print dictionary entry info for word(s)")
	pflag.BoolVar(&doDecompile, "decompile", false, "decompile colon definitions for word(s)")
	pflag.BoolVar(&listWords, "list", false, "list discovered dictionary words")
	pflag.BoolVar(&listColon, "list-colon", false, "list colon definitions (CFA code matches ':')")
	pflag.Parse()

	if prgPath == "" {
		fmt.Fprintln(os.Stderr, "--prg is required")
		os.Exit(2)
	}

	if !showInfo && !doDecompile && !listWords && !listColon {
		showInfo = true
	}

	program, err := readPRG(prgPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "failed to read PRG: %v\n", err)
		os.Exit(1)
	}

	dict, err := parseDictionary(program)
	if err != nil {
		fmt.Fprintf(os.Stderr, "failed to parse dictionary: %v\n", err)
		os.Exit(1)
	}

	if listWords {
		for _, entry := range dict.Ordered {
			fmt.Println(entry.Name)
		}
		return
	}
	if listColon {
		colon := dict.ByName[":"]
		if colon == nil {
			fmt.Fprintln(os.Stderr, "colon definition ':' not found")
			os.Exit(1)
		}
		for _, entry := range dict.Ordered {
			if entry.CFAValue == colon.CFAValue {
				fmt.Println(entry.Name)
			}
		}
		return
	}

	if len(words) == 0 {
		fmt.Fprintln(os.Stderr, "--word is required unless --list is used")
		os.Exit(2)
	}

	for _, word := range words {
		entry := dict.ByName[strings.ToUpper(word)]
		if entry == nil {
			fmt.Fprintf(os.Stderr, "word not found: %s\n", word)
			continue
		}
		if showInfo {
			printEntryInfo(os.Stdout, entry)
		}
		if doDecompile {
			if err := decompileWord(os.Stdout, program, dict, entry); err != nil {
				fmt.Fprintf(os.Stderr, "decompile failed for %s: %v\n", entry.Name, err)
			}
		}
	}
}

func readPRG(path string) (*prg, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	if len(data) < 3 {
		return nil, errors.New("PRG too small")
	}
	loadAddr := uint16(data[0]) | uint16(data[1])<<8
	return &prg{LoadAddr: loadAddr, Payload: data[2:]}, nil
}

func parseDictionary(program *prg) (*dictionary, error) {
	payload := program.Payload
	base := program.LoadAddr
	length := len(payload)

	entries := make(map[uint16]*entry)

	for addr := base + 2; addr < base+uint16(length); addr++ {
		idx := int(addr - base)
		count := payload[idx]
		if count&0x80 == 0 {
			continue
		}
		nameLen := int(count & 0x1F)
		if nameLen == 0 || nameLen > 31 {
			continue
		}
		if idx+1+nameLen > length {
			continue
		}
		nameBytes := payload[idx+1 : idx+1+nameLen]
		if !isNameBytes(nameBytes) {
			continue
		}
		name := normalizeNameBytes(nameBytes)
		afterName := addr + 1 + uint16(nameLen)
		if afterName%2 == 1 {
			afterName++
		}
		if !inRange(afterName, base, length) || !inRange(afterName+1, base, length) {
			continue
		}
		lfa := uint16(0)
		lfaAddr := addr - 2
		if inRange(lfaAddr, base, length) {
			lfa = read16(payload, base, lfaAddr)
			if lfa != 0 && !inRange(lfa, base, length) {
				lfa = 0
			}
		}
		cfaValue := read16(payload, base, afterName)
		if cfaValue == 0 {
			continue
		}
		entries[addr] = &entry{
			Name:     name,
			NFA:      addr,
			LFA:      lfa,
			CFAAddr:  afterName,
			CFAValue: cfaValue,
			PFA:      afterName + 2,
			Flags:    count,
		}
	}

	if len(entries) == 0 {
		return nil, errors.New("no dictionary entries found")
	}

	ordered := orderEntries(entries)
	byName := make(map[string]*entry)
	byCode := make(map[uint16]*entry)
	for _, entry := range ordered {
		nameKey := strings.ToUpper(entry.Name)
		if _, exists := byName[nameKey]; !exists {
			byName[nameKey] = entry
		}
		if _, exists := byCode[entry.CFAValue]; !exists {
			byCode[entry.CFAValue] = entry
		}
	}

	return &dictionary{
		Entries: entries,
		Ordered: ordered,
		ByName:  byName,
		ByCode:  byCode,
	}, nil
}

func isNameBytes(name []byte) bool {
	for _, b := range name {
		trimmed := b & 0x7F
		if trimmed < 0x20 || trimmed > 0x7E {
			return false
		}
	}
	return true
}

func normalizeNameBytes(name []byte) string {
	trimmed := make([]byte, len(name))
	for i, b := range name {
		trimmed[i] = b & 0x7F
	}
	return string(trimmed)
}

func orderEntries(entries map[uint16]*entry) []*entry {
	ordered := make([]*entry, 0, len(entries))
	for _, entry := range entries {
		ordered = append(ordered, entry)
	}
	sort.Slice(ordered, func(i, j int) bool {
		return ordered[i].NFA > ordered[j].NFA
	})
	return ordered
}

func inRange(addr uint16, base uint16, length int) bool {
	idx := int(addr - base)
	return idx >= 0 && idx < length
}

func read16(payload []byte, base uint16, addr uint16) uint16 {
	idx := int(addr - base)
	return uint16(payload[idx]) | uint16(payload[idx+1])<<8
}

func printEntryInfo(out io.Writer, entry *entry) {
	fmt.Fprintf(out, "Word: %s\n", entry.Name)
	fmt.Fprintf(out, "  NFA: $%04X\n", entry.NFA)
	fmt.Fprintf(out, "  LFA: $%04X\n", entry.LFA)
	fmt.Fprintf(out, "  CFA addr: $%04X\n", entry.CFAAddr)
	fmt.Fprintf(out, "  CFA code: $%04X\n", entry.CFAValue)
	fmt.Fprintf(out, "  PFA: $%04X\n", entry.PFA)
	fmt.Fprintf(out, "  Flags: $%02X (len=%d flags=$%02X)\n", entry.Flags, entry.Flags&0x1F, entry.Flags&0xE0)
}

func decompileWord(out io.Writer, program *prg, dict *dictionary, entry *entry) error {
	colon := dict.ByName[":"]
	if colon == nil {
		return errors.New("colon definition ':' not found")
	}

	if entry.CFAValue != colon.CFAValue {
		fmt.Fprintf(out, "\n%s is not a colon definition (CFA code $%04X).\n", entry.Name, entry.CFAValue)
		return nil
	}

	exit := dict.ByName["EXIT"]
	semicolon := dict.ByName["<;CODE>"]
	compile := dict.ByName["COMPILE"]
	lit := dict.ByName["<LIT>"]
	branch := dict.ByName["BRANCH"]
	zeroBranch := dict.ByName["0BRANCH"]
	loop := dict.ByName["<LOOP>"]
	loopEnd := dict.ByName["</LOOP>"]
	plusLoop := dict.ByName["<+LOOP>"]
	dotQuote := dict.ByName["<.\">"]
	abortQuote := dict.ByName["<ABORT\">"]

	fmt.Fprintf(out, "\nDecompile %s (PFA $%04X)\n", entry.Name, entry.PFA)

	pos := entry.PFA
	maxSteps := 10000
	for step := 0; step < maxSteps; step++ {
		if !inRange(pos, program.LoadAddr, len(program.Payload)) || !inRange(pos+1, program.LoadAddr, len(program.Payload)) {
			return fmt.Errorf("PFA out of range at $%04X", pos)
		}
		xt := read16(program.Payload, program.LoadAddr, pos)
		if exit != nil && xt == exit.CFAValue {
			fmt.Fprintf(out, "  %s\n", exit.Name)
			break
		}
		if semicolon != nil && xt == semicolon.CFAValue {
			fmt.Fprintf(out, "  %s\n", semicolon.Name)
			break
		}

		if compile != nil && xt == compile.CFAValue {
			next := read16(program.Payload, program.LoadAddr, pos+2)
			name := resolveName(dict, next)
			fmt.Fprintf(out, "  COMPILE %s\n", name)
			pos += 4
			continue
		}

		if lit != nil && xt == lit.CFAValue {
			value := int16(read16(program.Payload, program.LoadAddr, pos+2))
			fmt.Fprintf(out, "  %s %d\n", lit.Name, value)
			pos += 4
			continue
		}

		if branch != nil && xt == branch.CFAValue {
			value := int16(read16(program.Payload, program.LoadAddr, pos+2))
			fmt.Fprintf(out, "  %s %d\n", branch.Name, value)
			pos += 4
			continue
		}

		if zeroBranch != nil && xt == zeroBranch.CFAValue {
			value := int16(read16(program.Payload, program.LoadAddr, pos+2))
			fmt.Fprintf(out, "  %s %d\n", zeroBranch.Name, value)
			pos += 4
			continue
		}

		if loop != nil && xt == loop.CFAValue {
			value := int16(read16(program.Payload, program.LoadAddr, pos+2))
			fmt.Fprintf(out, "  %s %d\n", loop.Name, value)
			pos += 4
			continue
		}

		if loopEnd != nil && xt == loopEnd.CFAValue {
			value := int16(read16(program.Payload, program.LoadAddr, pos+2))
			fmt.Fprintf(out, "  %s %d\n", loopEnd.Name, value)
			pos += 4
			continue
		}

		if plusLoop != nil && xt == plusLoop.CFAValue {
			value := int16(read16(program.Payload, program.LoadAddr, pos+2))
			fmt.Fprintf(out, "  %s %d\n", plusLoop.Name, value)
			pos += 4
			continue
		}

		if dotQuote != nil && xt == dotQuote.CFAValue {
			next := pos + 2
			if !inRange(next, program.LoadAddr, len(program.Payload)) {
				return fmt.Errorf("string out of range at $%04X", next)
			}
			count := program.Payload[int(next-program.LoadAddr)]
			textStart := next + 1
			textEnd := textStart + uint16(count)
			if !inRange(textEnd-1, program.LoadAddr, len(program.Payload)) {
				return fmt.Errorf("string out of range at $%04X", textStart)
			}
			text := string(program.Payload[int(textStart-program.LoadAddr):int(textEnd-program.LoadAddr)])
			fmt.Fprintf(out, "  %s %q\n", dotQuote.Name, text)
			pos = textEnd
			continue
		}

		if abortQuote != nil && xt == abortQuote.CFAValue {
			next := pos + 2
			if !inRange(next, program.LoadAddr, len(program.Payload)) {
				return fmt.Errorf("string out of range at $%04X", next)
			}
			count := program.Payload[int(next-program.LoadAddr)]
			textStart := next + 1
			textEnd := textStart + uint16(count)
			if !inRange(textEnd-1, program.LoadAddr, len(program.Payload)) {
				return fmt.Errorf("string out of range at $%04X", textStart)
			}
			text := string(program.Payload[int(textStart-program.LoadAddr):int(textEnd-program.LoadAddr)])
			fmt.Fprintf(out, "  %s %q\n", abortQuote.Name, text)
			pos = textEnd
			continue
		}

		name := resolveName(dict, xt)
		fmt.Fprintf(out, "  %s\n", name)
		pos += 2
	}

	return nil
}

func resolveName(dict *dictionary, codePtr uint16) string {
	if entry := dict.ByCode[codePtr]; entry != nil {
		return entry.Name
	}
	return fmt.Sprintf("$%04X", codePtr)
}
