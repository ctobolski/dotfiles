SHELL := /bin/bash
CONFIG_HOME := $(HOME)/.config/
ZPLUG_HOME := $(CONFIG_HOME)/zplug
ZSH_HOME := $(CONFIG_HOME)/zplug
ZSH_ENV_HOME := $(HOME)/
NVIM_HOME := $(CONFIG_HOME)/nvim
HR := @echo "========================================"

install: export CONFIG_HOME = $(CONFIG_HOME)
install: export ZPLUG_HOME = $(ZPLUG_HOME)
install: export ZSH_HOME = $(ZSH_HOME)
install: export ZSH_ENV_HOME = $(ZSH_ENV_HOME)

all: dirs zsh kitty rust crates git
	@echo "All done!"

dirs: 
	@mkdir -p ~/git
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
	$(HR)

kitty:
	@echo "Installing kitty"
	@if [[ -d ~/.local/kitty.app/ ]]; then \
		echo "[kitty]: Already installed"; \
	else \
		curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; \
	fi; \
	if [[ ! -L ~/.local/bin/kitty ]]; then \
		echo "Setting up kitty as an application"; \
		ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/; \
		cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/; \
		cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/; \
		sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop; \
		sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop; \
	fi
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
		git clone https://github.com/eza-community/eza.git ~/git; \
		echo 'export FPATH="~/git/eza-community/completions/zsh:$$FPATH"' >> ~/.zshrc; \
		echo "Completions installed for eza"; \
	fi


git: 
	@echo "Installing fzf"
	@if [[ -d ~/.fzf ]]; then \
		echo "[fzf] Already installed"; \
	else \
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
		~/.fzf/install; \
	fi
