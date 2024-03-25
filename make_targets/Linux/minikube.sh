echo "Installing minikube"
if which minikube >/dev/null 2>&1; then
	echo "Minikube is already installed"
else
	(curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
		sudo install minikube-linux-amd64 /usr/local/bin/minikube &&
		rm minikube-linux-amd64)
fi
