#TODO: add fzf config to zsh dotfile
echo "Installing fzf"
if [[ -d ~/.fzf ]]; then
	echo "[fzf] Already installed"
else
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi
