#!/usr/bin/env bash
set -euf -o pipefail

stow -D -d "${HOME}/stow" "cargo"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --no-modify-path > /dev/null
CARGO="${HOME}/stow/cargo"
mkdir -p "${CARGO}"
(cd "${CARGO}" && rm -f bin && ln -s ../../.cargo/bin)
stow -d "${HOME}/stow" "cargo"

RUST_COMPLETION="rust/.bash_completion.d"
mkdir -p "${RUST_COMPLETION}"
rustup completions bash rustup > "${RUST_COMPLETION}/rustup"
rustup completions bash cargo > "${RUST_COMPLETION}/cargo"
