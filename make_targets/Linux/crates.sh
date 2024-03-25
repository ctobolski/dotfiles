echo "[rust:crates]: Installing zoxide"
cargo install zoxide --locked
echo "[rust:crates]: Installing ripgrep"
cargo install ripgrep
echo "[rust:crates]: Installing eza"
cargo install eza
if rg "FPATH" | rg eza ~/.zshrc >/dev/null 2>&1; then
	echo "Completions already installed for eza"
else
	git clone https://github.com/eza-community/eza.git ~/git/eza
	echo 'export FPATH="~/git/eza/completions/zsh:$$FPATH"' >>~/.zshrc
	echo "Completions installed for eza"
fi
