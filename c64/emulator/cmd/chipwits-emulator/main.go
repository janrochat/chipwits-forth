package main

import (
	"fmt"
	"log"
	"os"

	"github.com/spf13/pflag"

	"github.com/chipwits/chipwits-forth/c64/emulator"
)

func main() {
	var drive8Path string
	var drive9Path string
	var prgPath string
	var loadName string
	var device uint
	var maxInstructions uint64
	pflag.StringVar(&drive8Path, "drive8", "", "path to drive 8 .d64 image")
	pflag.StringVar(&drive9Path, "drive9", "", "path to drive 9 .d64 image")
	pflag.StringVar(&prgPath, "prg", "", "path to PRG to load directly")
	pflag.StringVar(&loadName, "load", "", "filename to load from disk image")
	pflag.UintVar(&device, "device", 8, "device number for load/save operations")
	pflag.Uint64Var(&maxInstructions, "max-instructions", 5_000_000, "maximum instructions before stopping")
	pflag.Parse()

	mem := &emulator.Memory{}
	drives := make(map[byte]*emulator.DiskDrive)
	if drive8Path != "" {
		image, err := emulator.LoadD64(drive8Path)
		if err != nil {
			log.Fatalf("load drive8: %v", err)
		}
		drives[8] = emulator.NewDiskDrive(image)
	}
	if drive9Path != "" {
		image, err := emulator.LoadD64(drive9Path)
		if err != nil {
			log.Fatalf("load drive9: %v", err)
		}
		drives[9] = emulator.NewDiskDrive(image)
	}

	kernal := emulator.NewKernal(mem, drives, os.Stdin, os.Stdout)
	cpu := emulator.NewCPU(mem, kernal)

	entryPoint := uint16(0)
	if prgPath != "" {
		data, err := os.ReadFile(prgPath)
		if err != nil {
			log.Fatalf("read prg: %v", err)
		}
		if len(data) < 2 {
			log.Fatalf("prg file too small")
		}
		entryPoint = uint16(data[0]) | (uint16(data[1]) << 8)
		copy(mem.Data[entryPoint:], data[2:])
	} else if loadName != "" {
		loadPtr := uint16(0x0200)
		copy(mem.Data[loadPtr:], []byte(loadName))
		cpu.A = 0
		cpu.X = byte(device)
		cpu.Y = 0
		kernal.SetLFS(cpu)
		cpu.A = byte(len(loadName))
		cpu.X = byte(loadPtr & 0xFF)
		cpu.Y = byte(loadPtr >> 8)
		kernal.SetNam(cpu)
		kernal.Load(cpu)
		if drive, ok := drives[byte(device)]; ok {
			data, err := drive.Image.LoadFile(loadName)
			if err != nil {
				log.Fatalf("load file: %v", err)
			}
			entryPoint = uint16(data[0]) | (uint16(data[1]) << 8)
		}
	}

	if entryPoint == 0 {
		fmt.Println("No entry point specified. Use --prg or --load with --drive8/--drive9.")
		return
	}

	cpu.Reset(entryPoint)
	for i := uint64(0); i < maxInstructions; i++ {
		if err := cpu.Step(); err != nil {
			log.Fatalf("cpu error: %v", err)
		}
	}
	log.Printf("stopped after %d instructions", maxInstructions)
}
