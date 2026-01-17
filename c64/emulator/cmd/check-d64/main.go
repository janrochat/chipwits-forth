package main

import (
	"log"

	"github.com/spf13/pflag"

	"github.com/chipwits/chipwits-forth/c64/emulator"
)

func main() {
	var d64Path string
	var filename string
	pflag.StringVar(&d64Path, "d64", "", "path to d64 image")
	pflag.StringVar(&filename, "file", "", "filename to check for")
	pflag.Parse()

	if d64Path == "" || filename == "" {
		log.Fatal("usage: check-d64 --d64 <path> --file <name>")
	}

	image, err := emulator.LoadD64(d64Path)
	if err != nil {
		log.Fatalf("load d64: %v", err)
	}
	if _, err := image.LoadFile(filename); err != nil {
		log.Fatalf("missing file %q: %v", filename, err)
	}
}
