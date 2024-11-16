SHELL := /bin/bash
CONFIG_HOME := $(HOME)/.config/
ZPLUG_HOME := $(CONFIG_HOME)/zplug
ZSH_HOME := $(CONFIG_HOME)/zplug
ZSH_ENV_HOME := $(HOME)/
NVIM_HOME := $(CONFIG_HOME)/nvim
HR := @echo "========================================"
UNAME_S := $(shell uname -s)
MAKE_HOME := $(CURDIR)
export MAKE_HOME
export CONFIG_HOME


# Install flags -- keep the steps for reference, but refuse to install
ANTIGEN = 1
KITTY = 0


install: export CONFIG_HOME = $(CONFIG_HOME)
install: export ZPLUG_HOME = $(ZPLUG_HOME)
install: export ZSH_HOME = $(ZSH_HOME)
install: export ZSH_ENV_HOME = $(ZSH_ENV_HOME)

all: dirs zsh rust node crates git antigen go docker kubernetes fzf
	@echo "All done!"

dirs:
	@echo "[dirs]: Setting up directories"
	@./make_targets/$(UNAME_S)/dirs.sh
	@echo "[dirs]: done"
	$(HR)

zsh: dirs
	@echo "[zsh]: Setting up zsh"
	@./make_targets/$(UNAME_S)/zsh.sh
	@echo "[zsh]: done"
	$(HR)

nvim: dirs
	@echo "[nvim]: Setting up nvim"
	@./make_targets/$(UNAME_S)/nvim.sh
	@echo "[nvim]: done"
	$(HR)

keyboard: dirs
	@echo "[keyboard]: Setting up keyboard"
	@./make_targets/$(UNAME_S)/keyboard.sh
	@echo "[keyboard]: done"
	$(HR)

ifeq ($(KITTY),1)
kitty:
	@echo "[kitty]: Setting up kitty"
	@./make_targets/$(UNAME_S)/kitty.sh
	@echo "[kitty]: done"
	$(HR)
else
	@echo "Not installing kitty"
endif

docker:
	@echo "[docker]: Setting up docker"
	@./make_targets/$(UNAME_S)/docker.sh
	@echo "[docker]: done"
	$(HR)


minikube:
	@echo "[minikube]: Setting up minikube"
	@./make_targets/$(UNAME_S)/minikube.sh
	@echo "[minikube]: done"
	$(HR)

k8s-kubectl:
	#https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
	#Upgrading kubectl requires updating /etc/apt/sources before updating
	#https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/change-package-repository/
	@echo "[kubectl]: Setting up kubectl"
	@./make_targets/$(UNAME_S)/k8s-kubectl.sh
	@echo "[kubectl]: done"
	$(HR)


kubernetes: minikube k8s-kubectl
	@echo "[k8s]: Installing kubernetes and kubectl"
	$(HR)

rust:
	@echo "[rust]: Setting up rust"
	@./make_targets/$(UNAME_S)/rust.sh
	@echo "[rust]: done"
	$(HR)

node:
	@echo "[node]: Setting up node"
	@./make_targets/$(UNAME_S)/node.sh
	@echo "[node]: done"
	$(HR)

crates: rust
	@echo "[rust:crates]: Adding rust crates"
	@./make_targets/shared/crates.sh
	@echo "[rust:crates]: done"
	$(HR)


ifeq ($(ANTIGEN),1)
antigen: dirs zsh
	@echo "[zsh:antigen]: Adding zsh package manager antigen"
	@./make_targets/$(UNAME_S)/antigen.sh
	@echo "[zsh:antigen]: done"
else
	@echo "Not installing antigen"
endif

git: dirs
	@echo "[git]: Installing git"
	@./make_targets/$(UNAME_S)/git.sh
	@echo "[git]: done"

fzf: git
	@echo "[fzf]: Installing fzf"
	@./make_targets/$(UNAME_S)/fzf.sh
	@echo "[fzf]: done"


go:
	@echo "[go]: Installing go"
	@./make_targets/$(UNAME_S)/go.sh
	@echo "[go]: done"

