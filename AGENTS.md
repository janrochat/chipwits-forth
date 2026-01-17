# Agent Notes for ChipWits-FORTH

## Repository overview
- This repo archives original ChipWits FORTH source disks and related documentation.
- Primary directories:
  - `c64/`: Commodore 64 disk images, docs, and readable FORTH extracts.
  - `mac/`: Macintosh disk images, docs, and readable FORTH extracts.
  - `appleii/`: Apple II disk images (source not yet recovered).
  - `docs/`: Scanned manuals and box art.
  - `scripts/`: Automation for building/checking the C64 build.
  - `web/`: Web content/assets (if you touch this, consider whether a screenshot is needed).

## Documentation to read first
- Repo-level overview and context: `README.md`.
- C64 build process and emulator steps: `c64/README.md` and `c64/buildtools/README.md`.
- Mac disk context: `mac/README.md`.

## Build & test guidance
- There is no standard unit test suite.
- The only reproducible build flow is for the C64 version:
  - Manual emulator instructions: `c64/buildtools/README.md`.
  - Automated scripts from repo root:
    - `./scripts/build-chipwits-c64.sh`
    - `./scripts/check-game-prg.sh`
  - The automated build uses a console emulator in `c64/emulator/` (Go-based) and streams FORTH commands over stdin.

## C64 buildtools & emulator notes
- `c64/emulator/` contains a minimal C64 console emulator used by scripts to build the game.
  - It can load a PRG directly (`--prg`) or load a named file from a D64 image (`--load`).
  - It supports `@HOST` commands on stdin for swapping drive images and halting.
- `scripts/build-chipwits-c64.sh` compiles the emulator, boots from the CW Boot disk, swaps to `buildtools.d64`, and loads FORTH screens from the three master source disks via drive 9 swaps.

## CWMIN PRG notes
- `CWMIN` is a PRG file listed on the `CW Boot.d64` disk; the automated build script loads `CWMIN` to start the Super-Forth environment.
- The emulator README shows examples of loading `CWMIN` either directly as a PRG or by name from a D64 image.
- Extracted `CWMIN` from `CW Boot.d64` via the emulator `LoadFile` logic:
  - PRG load address is `$0801` (BASIC start), and the first BASIC line performs `SYS 2064`, then jumps into machine code.
  - File size is 11,163 bytes (11,161-byte payload).
  - Embedded strings identify `SUPER-FORTH 64 V 2.1`, a `COPYRIGHT 1984 BY ELLIOT B. SCHNEIDER` banner, and a `V2.0.0:MARCH 11, 1984` version tag.
  - Another embedded label reads `CWMINUFORTH 64`, suggesting a ChipWits-specific Super Forth build.
  - Extraction steps (from repo root):
    - `cd c64/emulator`
    - `go run ./cmd/copy-d64 --src ../disks/CW\ Boot/CW\ Boot.d64 --dst /tmp/cwmin.d64 --file CWMIN` (copies PRG into a scratch image)
    - `go run ./cmd/chipwits-emulator --drive8 /tmp/cwmin.d64 --load CWMIN` (sanity check load)
    - For raw extraction, run a small Go helper using `emulator.LoadD64(...).LoadFile("CWMIN")` to write the PRG to disk.
  - Disassembling the PRG is useful because it reveals the exact boot sequence, memory layout, and hardware/KERNAL calls used by this custom Super-Forth build, which helps validate emulator behavior and track down build/runtime differences.

## Working with artifacts
- Disk images (`*.d64`, `*.dc42`) and scanned PDFs are large binaries; avoid modifying them unless explicitly required.
- Readable FORTH extracts live under `*/forth/` directories and are suitable for text edits.

## Contribution tips
- Prefer documenting changes in Markdown files.
- If you modify anything in `web/` or other UI assets, include a screenshot per repo guidelines.
