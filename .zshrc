#Exports :)
export ZSH=/Users/chris/.oh-my-zsh
export PATH=$PATH:/Users/chris/workspace/react-native/ios/albums/node_modules/.bin/
export ECLIPSE_HOME='/Users/chris/Applications/Eclipse.app/Contents/Eclipse'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
ZSH_THEME="christobolski"
plugins=(git)
source $ZSH/oh-my-zsh.sh

#ALIAIIIIII
alias zshrc='vi ~/.zshrc'
alias szsh='source ~/.zshrc'
alias vimrc='vi ~/.vimrc'
set -o vi 
#
#Binds
bindkey '^R' history-incremental-search-backward

# :)
alias grok='man'
source ~/.private.zshrc
#terminal configuration to allow use of ctrl-s in VIM
stty -ixon

export NVM_DIR="/Users/chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
alias clipdir="pwd | pbcopy"
alias shrug="echo ¯\\\_(ツ)_/¯"
alias p='pushd'
alias b='popd'
