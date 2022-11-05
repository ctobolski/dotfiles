################                ###############"
#                                              "
#                Base Settings                 "
#                                              "
################                ###############"
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
#ALIAIIIIII
alias zshrc='vi ~/.zshrc'
alias szsh='source ~/.zshrc'
alias vimrc='vi ~/.vimrc'
alias shrug="print '¯\\\_(ツ)_/¯'"
alias v='vim -o `fzf`'
set -o vi
#
#Binds
bindkey '^R' history-incremental-search-backward

export VOLTA_HOME="$HOME/.volta"
export PATH=$PATH:/home/chris/.local/bin
export PATH=$PATH:/home/chris/.yarn/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$VOLTA_HOME/bin:$PATH"

# Unix only
#alias pbcopy="xclip -selection clipboard"
#alias pbpaste='xclip -selection clipboard -o'

################      FZF      ###############"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd -t f -H"
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
alias cat=batcat


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
