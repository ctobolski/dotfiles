filetype plugin on
colorscheme gruvbox
syntax on
set nocompatible "use all features
set incsearch "search incrementally
set hls "highlight matches in search
set ai "autoindent based on filetype
"indicate trailing spaces with dash
set listchars=trail:-
set list
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set showcmd
set cursorline
set wildmenu
set showmatch
set smartcase
set number
set noswapfile
set ttimeoutlen=100 "reduce timout length so o and O dont take so damn long.
set hidden "Dont warn me when swapping to buffers when I have a modified one

nnoremap <Space> <Nop>
let mapleader = "\<Space>"


"Force yourself to use the keyboard movement keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

"rebind window switching
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"rebind tab nav
nmap <silent> <Leader>ww :tabclose <CR>
nmap <silent> <Leader>l :tabnext <CR>
nmap <silent> <Leader>h :tabprevious <CR>
nmap <silent> <Leader>n :tabnew <CR>
"binding buffers
nmap <silent> <Leader>k :bnext<CR>
nmap <silent> <Leader>j :bprev<CR>
nmap <silent> <Leader>w :bd <CR>
nmap <silent> <Leader>1 :b1<CR>
nmap <silent> <Leader>2 :b2<CR>
nmap <silent> <Leader>3 :b3<CR>
nmap <silent> <Leader>4 :b4<CR>
nmap <silent> <Leader>5 :b5<CR>
"remap ctrlp
nmap <silent> <Leader>o :CtrlP<CR>
"hit return again to clear search highlighting
nnoremap <CR> :noh<CR><CR>
"remap format
nmap <silent> <Leader>f mzgg=G'z
"remap save to CTRL-s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
noremap <silent> <C-Q>          :qa!<CR>
vnoremap <silent> <C-Q>         <C-C>:qa!<CR>
inoremap <silent> <C-Q>         <C-O>:qa!<CR>
"add newlines above or below
nmap zj o<Esc>k
nmap zk O<Esc>j

"quickly edit vimrc
noremap <Leader>rc :tabe $MYVIMRC<CR>
"source vimrc
noremap <Leader>sc :source $MYVIMRC<CR>

"Config
let g:airline_powerline_fonts = 1
let g:airline_theme="badwolf"
let g:jsx_ext_required = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set completeopt-=preview
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd vimenter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call plug#begin('~/.vim/plugged')
"color schemes
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'rafi/awesome-vim-colorschemes'
"language specific plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-dtsm'
Plug 'mhartington/vim-typings'
"sweet statusline plugin!
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Vim exchange! Swapping regions of text
Plug 'tommcdo/vim-exchange'
"show buffers in status line
Plug 'bling/vim-bufferline'
"File explorer
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
"fuzzyfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"different fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
"awesome support for functions and stuff! Allows repeat on vim surround and stuff
Plug 'tpope/vim-repeat'
"Git plugin
Plug 'tpope/vim-fugitive'
"change surrounding texts
Plug 'tpope/vim-surround'
"cant live without
Plug 'jiangmiao/auto-pairs'
"autocompletion engine
Plug 'valloric/YouCompleteMe'
call plug#end()

"file specific mappings
autocmd FileType javascript nmap <Leader>t oit('', () => {<ESC>oexpect(actual).toEqual(expected);<ESC>o});<ESC>kkf'a
autocmd FileType javascript nmap <Leader>cl iconsole.log(``);<ESC>==0f`a
autocmd FileType javascript nmap <Leader>e iexpect().toBe();<ESC>0f(a
autocmd FileType javascript nmap <Leader>tt oit('', () => {<CR>});<ESC>kkf'a

autocmd FileType typescript nmap <Leader>tt oit('', () => {<CR>});<ESC>kkf'a
autocmd FileType typescript nmap <Leader>td odescribe('', () => {<CR>});<ESC>kkf'a
autocmd FileType typescript nmap <Leader>cl iconsole.log(``);<ESC>==0f`a

autocmd FileType typescript let @f=":TsuQuickFix"

autocmd FileType typescript let @t=":!npm test"
