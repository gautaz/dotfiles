#!/usr/bin/env bash
set -euf -o pipefail

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --no-modify-path > /dev/null

CARGO_BIN="${HOME}/.cargo/bin"
CARGO="${CARGO_BIN}/cargo"
RUSTUP="${CARGO_BIN}/rustup"

RUST_COMPLETION="rust/.bash_completion.d"
mkdir -p "${RUST_COMPLETION}"
"${RUSTUP}" completions bash rustup > "${RUST_COMPLETION}/rustup"
"${RUSTUP}" completions bash cargo > "${RUST_COMPLETION}/cargo"
