package main

import (
	"flag"
	"fmt"
	"os"

	"github.com/chipwits/chipwits-forth/c64/emulator"
)

func main() {
	srcPath := flag.String("src", "", "path to source D64 image")
	fileName := flag.String("file", "", "PRG file name to extract")
	outPath := flag.String("out", "", "output path for extracted PRG")
	flag.Parse()

	if *srcPath == "" || *fileName == "" || *outPath == "" {
		fmt.Fprintln(os.Stderr, "usage: extract-d64 --src <image.d64> --file <name> --out <file.prg>")
		flag.PrintDefaults()
		os.Exit(2)
	}

	image, err := emulator.LoadD64(*srcPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "load d64: %v\n", err)
		os.Exit(1)
	}

	data, err := image.LoadFile(*fileName)
	if err != nil {
		fmt.Fprintf(os.Stderr, "load file: %v\n", err)
		os.Exit(1)
	}

	if err := os.WriteFile(*outPath, data, 0o644); err != nil {
		fmt.Fprintf(os.Stderr, "write output: %v\n", err)
		os.Exit(1)
	}
}
