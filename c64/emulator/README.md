# ChipWits C64 Emulator (Build Tools)

This console emulator focuses on the minimal Commodore 64 behavior needed to run the ChipWits build tools:

- 6502 CPU emulation.
- Basic KERNAL I/O for disk access plus stdin/stdout.
- D64 disk image support for file load/save and raw sector commands.

## Usage

Build the emulator:

```bash
cd c64/emulator

go build ./cmd/chipwits-emulator
```

Run a PRG directly:

```bash
./chipwits-emulator --prg path/to/CWMIN.PRG --drive8 c64/buildtools/buildtools.d64
```

Load a file by name from a D64 image:

```bash
./chipwits-emulator --drive8 c64/buildtools/buildtools.d64 --load CWMIN
```

## Disk behavior

- `LOAD` and `SAVE` use the standard D64 directory entry format (PRG type).
- `U1`/`U2` commands on the command channel are supported for sector-level access.
- `CHRIN`/`CHROUT` map to stdin/stdout when the current device is the keyboard/screen.

