STARSHIP_BIN="${HOME}/stow/starship/bin"
mkdir -p "${STARSHIP_BIN}"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force --bin-dir "${STARSHIP_BIN}" > /dev/null
stow -d "${HOME}/stow" "starship"
