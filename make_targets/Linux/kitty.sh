echo "Installing kitty"
if [[ -d ~/.local/kitty.app/ ]]; then
	echo "[kitty]: Already installed"
else
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi
if [[ ! -L ~/.local/bin/kitty ]]; then
	echo "Setting up kitty as an application"
	ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
	cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
	cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
	sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
	sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
fi
mkdir -p $CONFIG_HOME/kitty
cp ./term/kitty/kitty.conf $CONFIG_HOME/kitty/
# install some themes
if [[ ! -d $CONFIG_HOME/kitty/kitty-themes ]]; then
	git clone --depth 1 https://github.com/dexpota/kitty-themes.git $CONFIG_HOME/kitty/kitty-themes
fi
ln -sf $CONFIG_HOME/kitty/kitty-themes/themes/gruvbox_dark.conf $CONFIG_HOME/kitty/theme.conf
