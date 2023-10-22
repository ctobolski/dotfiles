################                ###############"
#                                              "
#                Antigen Plugs                 "
#                                              "
################                ###############"
source ~/.config/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

################                ###############"
#                                              "
#                Base Settings                 "
#                                              "
################                ###############"


PLATFORM="$(uname -s)"
# Generic Aliases
alias v='nvim'
alias vs='nvim -o `fzf`'
alias zshrc='v ~/.zshrc'
alias szsh='source ~/.zshrc'
alias vimrc='v ~/.config/nvim/init.vim'
set -o vi

#Binds
#bindkey '^R' history-incremental-search-backward

# Add local bin to path for custom executables
export PATH=$PATH:"$HOME/.config/local/bin"

if [[ $PLATFORM == 'Linux' ]]; then
  # Unix only
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste='xclip -selection clipboard -o'
fi


################      FD      ###############"
#Make sure that you add the global ignore file in .config/fd/ignore if you want to use the hidden flag

################      FZF      ###############"
if which fzf > /dev/null 2>&1; then 
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
fi


################      BAT      ###############"
if which bat > /dev/null 2>&1; then 
  alias cat=bat
fi

################      EZA      ###############"
if which eza > /dev/null 2>&1; then 
  alias l="eza -l"
  alias lt="eza -T"
  alias la="eza -la"
  alias lah="eza -lh"
fi

################      ZOXIDE      ###############"
if which zoxide > /dev/null 2>&1; then 
  eval "$(zoxide init zsh)"
  alias cd='z'
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C /usr/bin/terraform terraform
fi

################      RUST      ###############"
export PATH="$HOME/.cargo/bin:$PATH"
export FPATH="~/git/eza-community/completions/zsh:$FPATH"
