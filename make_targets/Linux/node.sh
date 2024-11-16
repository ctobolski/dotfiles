echo "Checking if volta is installed to manage node"
if which volta >/dev/null 2>&1; then
  echo "Looks like volta is already installed"
else
  curl https://get.volta.sh | bash
fi

if which node >/dev/null 2>&1; then
  echo "Node is installed"
  echo "node --version"
  node --version
else
  echo "Installing latest lts version of node"
  volta install node
fi
