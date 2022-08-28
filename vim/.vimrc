"###############                ###############"
"                                              "
"                Base Settings                 "
"                                              "
"###############                ###############"
colorscheme molokai
filetype plugin on
syntax on
set mouse=a
set nocompatible "use all features
set incsearch "search incrementally
set hls "highlight matches in search
set ai "autoindent based on filetype
"indicate trailing spaces with dash
set listchars=trail:·
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


"###############                ###############"
"                                              "
"                Key Remapping                 "
"              Non-plugin specific             "
"###############                ###############"
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
nmap <silent> <Leader>j :tabprevious <CR>
nmap <silent> <Leader>k :tabnext <CR>
nmap <silent> <Leader>n :tabnew <CR>

"binding buffers
nmap <silent> <Leader>h :bprev<CR>
nmap <silent> <Leader>l :bnext<CR>
nmap <silent> <Leader>w :bd <CR>
nmap <silent> <Leader>w! :bd! <CR>
nmap <silent> <Leader>1 :b1<CR>
nmap <silent> <Leader>2 :b2<CR>
nmap <silent> <Leader>3 :b3<CR>
nmap <silent> <Leader>4 :b4<CR>
nmap <silent> <Leader>5 :b5<CR>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>


"hit return again to clear search highlighting
nnoremap <CR> :noh<CR><CR>

nmap <silent> <Leader>1 :NERDTreeToggle<CR>

"quickly edit vimrc
noremap <Leader>rc :tabe $MYVIMRC<CR>
"source vimrc
noremap <Leader>sc :source $MYVIMRC<CR>


"###############                ###############"
"                                              "
"              Plugin Configuration            "
"                                              "
"###############                ###############"

"###############      FZF       ###############"

"###############    Airline     ###############"
"let g:airline_powerline_fonts = 1
"let g:airline_theme="gruvbox"
"
"###############    Airline     ###############"
let g:jsx_ext_required = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'



"Nerdtree quits when a file is opened from nerdtree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1


autocmd vimenter * NERDTree | wincmd l
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"ntpeters/vim-better-whitespace
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=0
"ryanoasis/vim-devicons
set encoding=UTF-8
"prettier
"remap format
nmap <silent> <Leader>f <Plug>(Prettier)

"dense-analysis/ale "linter
nmap <silent> <Leader>b :ALEGoToDefinition <CR>
let g:ale_completion_tsserver_autoimport = 1
