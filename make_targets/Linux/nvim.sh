echo "[nvim]: Removing old backups"
rm -rf ~/.local/share/nvim.bak
rm -rf ~/.local/state/nvim.bak
rm -rf ~/.cache/nvim.bak
rm -rf ~/.config/nvim.bak

echo "[nvim]: Creating new backups"
mv ~/.config/nvim{,.bak} 2>/dev/null
# mv ~/.local/share/nvim{,.bak} 2>/dev/null
# mv ~/.local/state/nvim{,.bak} 2>/dev/null
# mv ~/.cache/nvim{,.bak} 2>/dev/null

echo "[nvim]: Copying config"
cp -r $MAKE_HOME/nvim $CONFIG_HOME/
