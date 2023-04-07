# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="christobolski"

plugins=(git lpass macos ripgrep)

source $ZSH/oh-my-zsh.sh
#ALIAIIIIII
alias zshrc='vi ~/.zshrc'
alias szsh='source ~/.zshrc'
alias vimrc='nvim ~/.vimrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias shrug="print '¯\\\_(ツ)_/¯'"
alias v='nvim -o `fzf`'
alias copy="tr -d '\n' | pbcopy"

set -o vi
#
#Binds
bindkey '^R' history-incremental-search-backward

export VOLTA_HOME="$HOME/.volta"
export PATH=$PATH:"$HOME/.config/local/bin"
export PATH="$VOLTA_HOME/bin:$PATH"

# Unix only
#alias pbcopy="xclip -selection clipboard"
#alias pbpaste='xclip -selection clipboard -o'

################      FD      ###############"
#Make sure that you add the global ignore file in .config/fd/ignore if you want to use the hidden flag
################      FZF      ###############"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --hidden -t f"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --info=inline --preview='bat --style=numbers --color=always --line-range :250 {} 2> /dev/null' --bind='f2:toggle-preview,ctrl-y:execute-silent(bat {+} | pbcopy)'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -20' ;;
    export)       fzf "$@" --preview "eval 'echo \$'{}" ;;
    *)            fzf "$@" ;;
  esac
}


################      BAT      ###############"
alias cat=bat

################      ZOXIDE      ###############"
eval "$(zoxide init zsh)"
alias cd='z'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform


################      RUST      ###############"
export PATH="$HOME/.cargo/bin:$PATH"
