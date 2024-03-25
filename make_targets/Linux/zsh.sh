echo "[zsh]: Setting up zsh"
if [[ -f /usr/bin/zsh ]]; then
	echo "[zsh]: Already installed, refreshing dotfiles"
else
	sudo apt install zsh -y
	chsh -s $(shell which zsh)
fi
cp $MAKE_HOME/term/zsh/.zshrc ~/
cp $MAKE_HOME/term/zsh/custom/*.zsh $CONFIG_HOME/zsh/custom
