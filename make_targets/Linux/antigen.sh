echo "Installing antigen"
if [[ -f $CONFIG_HOME/zsh/antigen.zsh ]]; then
	echo "[Antigen] is already installed"
else
	curl -L git.io/antigen >$CONFIG_HOME/zsh/antigen.zsh
fi
