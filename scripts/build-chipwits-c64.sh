#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
emulator_dir="${repo_root}/c64/emulator"
emulator_bin="${emulator_dir}/chipwits-emulator"

drive8_boot="${repo_root}/c64/disks/CW Boot/CW Boot.d64"
drive8_buildtools="${repo_root}/c64/buildtools/buildtools.d64"
drive9_forth="${repo_root}/c64/disks/Master 1of3 - Forth Source Screens/Forth Source Screens.d64"
drive9_menu="${repo_root}/c64/disks/Master 2of3 - CW Joy+Menu Screen/CW Joy+Menu Screen.d64"
drive9_game="${repo_root}/c64/disks/Master 3of3 - CW Game Screens/CW Game Screens.d64"

pushd "${emulator_dir}" >/dev/null
go build -o "${emulator_bin}" ./cmd/chipwits-emulator
popd >/dev/null

cat <<EOF | "${emulator_bin}" \
  --drive8 "${drive8_boot}" \
  --drive9 "${drive9_forth}" \
  --load CWMIN \
  --halt-after-save GAME \
  --max-instructions 200000000
@HOST SWAP8 ${drive8_buildtools}
@HOST SWAP9 ${drive9_forth}
DR1
64 ' C/L !
1 LIST
EMPTY-BUFFERS
1 LIST
1 LOAD
2 LOAD
DR0
@HOST SWAP9 ${drive9_menu}
EMPTY-BUFFERS
79 LIST
171 LIST
79 LOAD
@HOST SWAP9 ${drive9_game}
EMPTY-BUFFERS
80 LIST
171 LIST
80 LOAD
CW
EOF
