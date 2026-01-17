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
