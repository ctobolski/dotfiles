echo "Installing Rust"
if which cargo >/dev/null 2>&1; then
	echo "Looks like rust is already installed"
else
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
