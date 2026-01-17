package main

import (
	"log"

	"github.com/spf13/pflag"

	"github.com/chipwits/chipwits-forth/c64/emulator"
)

func main() {
	var srcPath string
	var dstPath string
	var filename string
	pflag.StringVar(&srcPath, "src", "", "path to source d64 image")
	pflag.StringVar(&dstPath, "dst", "", "path to destination d64 image")
	pflag.StringVar(&filename, "file", "", "filename to copy")
	pflag.Parse()

	if srcPath == "" || dstPath == "" || filename == "" {
		log.Fatal("usage: copy-d64 --src <path> --dst <path> --file <name>")
	}

	src, err := emulator.LoadD64(srcPath)
	if err != nil {
		log.Fatalf("load source d64: %v", err)
	}
	dst, err := emulator.LoadD64(dstPath)
	if err != nil {
		log.Fatalf("load destination d64: %v", err)
	}
	data, err := src.LoadFile(filename)
	if err != nil {
		log.Fatalf("load file %q: %v", filename, err)
	}
	if err := dst.SaveFile(filename, data); err != nil {
		log.Fatalf("save file %q: %v", filename, err)
	}
	if err := dst.Save(); err != nil {
		log.Fatalf("save d64: %v", err)
	}
}
