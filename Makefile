SHELL := /bin/bash
CONFIG_HOME := $(HOME)/.config/
ZPLUG_HOME := $(CONFIG_HOME)/zplug
ZSH_HOME := $(CONFIG_HOME)/zplug
ZSH_ENV_HOME := $(HOME)/
NVIM_HOME := $(CONFIG_HOME)/nvim
HR := @echo "========================================"

# Install flags -- keep the steps for reference, but refuse to install
ANTIGEN = 1


install: export CONFIG_HOME = $(CONFIG_HOME)
install: export ZPLUG_HOME = $(ZPLUG_HOME)
install: export ZSH_HOME = $(ZSH_HOME)
install: export ZSH_ENV_HOME = $(ZSH_ENV_HOME)

all: dirs zsh kitty rust crates git antigen go docker kubernetes
	@echo "All done!"

dirs: 
	@mkdir -p ~/git
	@mkdir -p ~/.config/zsh

zsh:
	$(HR)
	@echo "Installing Zsh..."
	@if [[ -f /usr/bin/zsh ]]; then \
		echo "[zsh]: Already installed, refreshing dotfiles"; \
	else \
		sudo apt install zsh -y; \
		chsh -s $(shell which zsh); \
	fi
	@cp ./term/zsh/.zshrc ~/
	@cp -r ./term/zsh/.zsh_config ~/.zsh_config
	$(HR)

kitty:
	@echo "Installing kitty"
	@if [[ -d ~/.local/kitty.app/ ]]; then \
		echo "[kitty]: Already installed"; \
	else \
		curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; \
	fi;
	@if [[ ! -L ~/.local/bin/kitty ]]; then \
		echo "Setting up kitty as an application"; \
		ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/; \
		cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/; \
		cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/; \
		sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop; \
		sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop; \
	fi;
	@mkdir -p ~/.config/kitty
	@cp ./term/kitty/kitty.conf ~/.config/kitty/
	# install some themes
	@if [[ ! -d ~/.config/kitty/kitty-themes ]]; then \
		git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes; \
	fi;
	@ln -sf ~/.config/kitty/kitty-themes/themes/gruvbox_dark.conf ~/.config/kitty/theme.conf
	$(HR)
		

# Docker install instructions have you download the install package from the site
docker:
	@echo "Installing docker pre-requisites"
	sudo apt install gnome-terminal \


minikube:
	@echo "Installing minikube"
	@if which minikube > /dev/null 2>&1; then \
			echo "Minikube is already installed"; \
	else \
			(curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
			sudo install minikube-linux-amd64 /usr/local/bin/minikube && \
			rm minikube-linux-amd64); \
	fi
	$(HR)

k8s-kubectl:
	#https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
	#Upgrading kubectl requires updating /etc/apt/sources before updating
	#https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/change-package-repository/
	
	@echo "Installing k8s dependencies"
	@if which kubectl > /dev/null 2>&1; then \
			echo "kubectl is already installed"; \
	else \
		sudo apt-get update; \
		sudo apt-get install -y apt-transport-https ca-certificates curl; \
		curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg; \
		echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list; \
		sudo apt-get update; \
		sudo apt-get install -y kubectl; \
	fi

kubernetes: minikube k8s-kubectl
	@echo "Installing Kubernetes"
	$(HR)

rust:
	@echo "Installing Rust"
	@if which cargo > /dev/null 2>&1; then \
		echo "Looks like rust is already installed"; \
	else \
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh; \
	fi
	$(HR)

crates: rust
	@echo "Installing zoxide"
	@cargo install zoxide --locked
	@echo "Installing ripgrep"
	@cargo install ripgrep
	@echo "Installing eza"
	@cargo install eza
	@if rg "FPATH" | rg eza ~/.zshrc > /dev/null 2>&1; then \
		echo "Completions already installed for eza"; \
	else \
		git clone https://github.com/eza-community/eza.git ~/git/eza; \
		echo 'export FPATH="~/git/eza/completions/zsh:$$FPATH"' >> ~/.zshrc; \
		echo "Completions installed for eza"; \
	fi

ifeq ($(ANTIGEN),1)
antigen: dirs zsh 
	@echo "Installing antigen"
	@if [[ -f ~/.config/zsh/antigen.zsh ]]; then \
		echo "[Antigen] is already installed"; \
	else \
		curl -L git.io/antigen > ~/.config/zsh/antigen.zsh; \
	fi
else
	@echo "Not installing antigen"
endif

git: 
	# misc tools from git repositories
	@echo "Installing fzf"
	@if [[ -d ~/.fzf ]]; then \
		echo "[fzf] Already installed"; \
	else \
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
		~/.fzf/install; \
	fi

go:
	@echo "Installing go"
	@if [[ -d ~/.fooby ]]; then \
		echo "[go] Already installed"; \
	else \
		echo "Go is not installed, follow steps here https://go.dev/doc/install"; \
	fi
	$(HR)

