#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
out_dir="${repo_root}/c64/docs/cwmin-disasm"
prg_path="${out_dir}/CWMIN.prg"

mkdir -p "${out_dir}"

(cd "${repo_root}/c64/emulator" && go run ./cmd/extract-d64 \
  --src "${repo_root}/c64/disks/CW Boot/CW Boot.d64" \
  --file CWMIN \
  --out "${prg_path}")

python3 "${repo_root}/scripts/cwmin_disasm.py" \
  --prg "${prg_path}" \
  --out-dir "${out_dir}"

echo "CWMIN disassembly written to ${out_dir}"
