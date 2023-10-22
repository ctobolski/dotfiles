#!/bin/bash
set -e

PLATFORM="$(uname -s)"
echo "Installing tmux"

case "$PLATFORM" in
	"Darwin") brew install tmux
	;;
	"Linux") sudo apt install tmux
	;;
	*) exit 1
	;;
esac
echo "Done!"

echo "========================================"

echo "Installing plugin manager"
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "Done!"
else
	echo "TPM already installed, doing nothing"
fi

echo "Copying config"

cp ./.tmux.conf ~/
