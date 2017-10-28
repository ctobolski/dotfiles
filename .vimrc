filetype off
"filetype plugin indent on    " required
filetype indent on 
syntax on 
"remap leader key
let mapleader="<Space>"

colorscheme molokai

set nocompatible "use all features 
set incsearch "search incrementally
set hls "highlight matches in search
set ai "autoindent based on filetype
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set showcmd
set cursorline
set wildmenu
set showmatch
set smartcase
set number
set noswapfile
set ttimeoutlen=100 "reduce timout length so o and O dont take so damn long.
set laststatus=2 
set scrolloff=3

set statusline=%f

"Fuzzyfinder
nmap <Space>o :FZF <CR>

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
"rebind tab navigation
nmap <silent> <Space>w :tabclose <CR> 
nmap <silent> <Space>l :tabnext <CR> 
nmap <silent> <Space>h :tabprevious <CR> 
nmap <silent> <Space>n :tabnew <CR>
nmap <silent> <Space>d :lcd %:p:h <CR>
" 
"hit return again to clear search highlighting
nnoremap <CR> :noh<CR><CR> 
"vim builtins 
runtime macros/matchit.vim


let g:EclimCompletionMethod = 'omnifunc'
let g:jsx_ext_required = 0
let g:ycm_semantic_triggers = { 'elm' : ['.'], }
let g:molokai_original = 1


"Elm stuff
let g:elm_jump_to_error = 1
let g:elm_make_show_warnings = 0
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1 
let g:elm_format_fail_silently = 1
let g:elm_format_two_spaces = 1
let g:elm_setup_keybindings = 1

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'valloric/youcompleteme'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'elmcast/elm-vim' 
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end() 
