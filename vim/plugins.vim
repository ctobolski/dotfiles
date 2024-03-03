let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  " Style
  Plug 'morhetz/gruvbox'
  " Config
  Plug 'wellle/targets.vim' " allows text object modifications on more stuff
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/clever-f.vim'
  Plug 'lambdalisue/fern.vim' " nerdtree alternative
  Plug 'lambdalisue/fern-git-status.vim'
  " Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " LSP
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  

call plug#end()
