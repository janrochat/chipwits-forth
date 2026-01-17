#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
image="${repo_root}/c64/buildtools/buildtools.d64"

pushd "${repo_root}/c64/emulator" >/dev/null
go run ./cmd/check-d64 --d64 "${image}" --file GAME
popd >/dev/null
