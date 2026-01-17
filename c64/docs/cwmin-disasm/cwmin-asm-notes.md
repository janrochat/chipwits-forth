# CWMIN.ASM notes from Super-Forth source screens

This document records information in the FORTH source screens that clarifies the CWMIN
machine-code disassembly, plus a reproducible way to re-derive the mapping.

## Findings that inform CWMIN.ASM

The Super-Forth source screens include the 6510 assembler and decompiler used in this
build of Super-Forth. The assembler screens explicitly name zero-page register
assignments and nucleus entry points that show up as machine-code routines in
`cwmin.asm`.

### Zero-page register assignments

The assembler screens define the register assignments used by the FORTH nucleus:

- `W` = `$81`
- `IP` = `$FB`
- `N` = `$87`
- `XSAVE` = `$83`

These match the register usage in the disassembly and are now documented in the
header comments of `cwmin.asm`.

### Nucleus entry points

The same screens define entry points for the threaded-code engine and stack helpers:

- `SETUPN` = `$0871`
- `POPTWO` = `$0882`
- `POP` = `$0884`
- `PUSH` = `$0889`
- `PUT` = `$088B`
- `NEXT` = `$0890`

These addresses align with the first executable routines in `cwmin.asm`, so alias labels
were added at those locations to make the disassembly more durable and readable.

### Assembler provenance

The source screens identify the assembler as William F. Ragsdale’s 6510 FORTH assembler,
originally published in *FORTH Dimensions* (Vol. III #5). This is useful context for
understanding the instruction encoding tables and addressing-mode logic embedded in
`CWMIN`.

### Dictionary layout (NFA/LFA/CFA/PFA)

The Super-Forth sources reveal how dictionary metadata is stored and therefore how the
disassembly should be read:

- `ID.` prints a name by applying `COUNT 1F AND`, which means the name length is stored in
  the low 5 bits of the count/flags byte at the `NFA`.
- The decompiler (`<DECOM>`) navigates between the `PFA`, `CFA`, and `NFA` to identify
  colon definitions, emit compiled words, and display literals or quoted strings.

These behaviors match the canonical fig-FORTH layout: the `LFA` is the 16-bit link field
stored two bytes before the `NFA`; the `CFA` begins at the next aligned address after the
name; and the `PFA` immediately follows the `CFA` (i.e., `CFA + 2`).

CWMIN also sets the high bit on the final character of each name field; the count byte
still carries the length/flags, so tools should mask off the high bit when rendering the
name string.

The threaded code stream in CWMIN stores CFA *code pointers* (the value stored at the CFA
field) rather than CFA addresses. That matches the `DUP CFA @` checks in `<DECOM>` and is
why the decompiler tool resolves names by CFA code pointer.

### Locating CFA/PFA/NFA/LFA in CWMIN

The Go helper at `c64/emulator/cmd/decompile-forth` can locate dictionary entries directly
from `CWMIN.prg`. The current CWMIN image resolves the dictionary helpers to:

| Word | NFA | LFA | CFA (addr) | CFA (code) | PFA |
| --- | --- | --- | --- | --- | --- |
| `CFA` | `$17AA` | `$0890` | `$17AE` | `$179A` | `$17B0` |
| `PFA` | `$247A` | `$1EC3` | `$247E` | `$2469` | `$2480` |
| `NFA` | `$23E0` | `$0890` | `$23E4` | `$23C7` | `$23E6` |
| `LFA` | `$218B` | `$0890` | `$2190` | `$B021` | `$2192` |

## Reproducible steps

All of the statements above can be reproduced from checked-in assets in this repository.

1. Review the assembler/decompiler screens in the extracted FORTH sources:

   ```bash
   rg -n "ASSEMBLER|DECOMPILER" "c64/forth/Forth Source Screens.forth"
   sed -n '560,760p' "c64/forth/Forth Source Screens.forth"
   ```

2. Regenerate the disassembly and verify that the binary is unchanged:

   ```bash
   ./scripts/disasm-cwmin.sh
   ```

   The script re-extracts `CWMIN`, rebuilds it from `cwmin.asm`, and reports whether the
   rebuilt PRG matches byte-for-byte.

3. Use the Go helper to query dictionary entries or decompile a word:

   ```bash
   (cd c64/emulator && go run ./cmd/decompile-forth --prg ../docs/cwmin-disasm/CWMIN.prg --info --word CFA)
   (cd c64/emulator && go run ./cmd/decompile-forth --prg ../docs/cwmin-disasm/CWMIN.prg --decompile --word :)
   ```
