# CWMIN FORTH decompiler notes

This note summarizes how the CWMIN FORTH dictionary layout relates to the `DECOMPILE` word
and documents the Go helper that mirrors the decompiler logic when pointed at `CWMIN.prg`.

## Dictionary layout refresher

The Super-Forth sources show that dictionary name fields store the length in the low
five bits of the count/flags byte (`COUNT 1F AND`), and the decompiler walks the dictionary
using `NFA`, `CFA`, and `PFA` addresses. The layout assumed by the Go tool is:

```
[LFA (2 bytes)] [NFA count/flags byte + name bytes] [align] [CFA (2 bytes)] [PFA...]
```

The `PFA` immediately follows the CFA, and CWMIN’s threaded code entries store CFA *code
pointers* (the value inside the CFA cell). The `<DECOM>` word uses these relationships to
detect colon definitions, handle literals/branches, and emit `COMPILE` and string literal
forms.

CWMIN’s name fields also set the high bit on the final character; the Go tool clears that
bit before displaying names.

CWMIN’s threaded code stream stores CFA *code pointers* (the contents of the CFA cell), so
the helper resolves names by matching CFA code pointers. When no match is found, the tool
emits the unresolved code pointer as a `$XXXX` literal.

## Go helper: `decompile-forth`

The tool lives in `c64/emulator/cmd/decompile-forth`. It discovers the dictionary by
scanning for plausible `NFA` entries and then follows link fields (`LFA`) to build a
word list. You can use it to:

- **Inspect dictionary entries** (reporting NFA/LFA/CFA/PFA addresses).
- **Decompile colon definitions** (mirroring `<DECOM>` / `DECOMPILE`).
- **List discovered words**.

Example usage:

```bash
# Extract CWMIN.prg (required once per workspace)
./scripts/disasm-cwmin.sh

# Inspect dictionary entries
(cd c64/emulator && go run ./cmd/decompile-forth --prg ../docs/cwmin-disasm/CWMIN.prg --info --word CFA --word PFA)

# Decompile a colon definition (example: :)
(cd c64/emulator && go run ./cmd/decompile-forth --prg ../docs/cwmin-disasm/CWMIN.prg --decompile --word :)

# List words
(cd c64/emulator && go run ./cmd/decompile-forth --prg ../docs/cwmin-disasm/CWMIN.prg --list)

# List colon definitions by CFA code pointer
(cd c64/emulator && go run ./cmd/decompile-forth --prg ../docs/cwmin-disasm/CWMIN.prg --list-colon)
```

The output intentionally mirrors the original FORTH decompiler logic rather than performing
full control-flow reconstruction; it simply walks the parameter field until it hits `EXIT`
or `<;CODE>`.
