echo "Installing fzf"
if which fzf >/dev/null 2>&1; then
  echo "[fzf] Already installed"
  echo "[fzf] updating"
  cd ~/.fzf
  git pull
  ~/.fzf/install
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
