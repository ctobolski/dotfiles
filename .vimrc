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
nmap <Space>o :tabnew <CR>:FufFileWithCurrentBufferDir<CR>
nmap <Space>f :FufFileWithCurrentBufferDir<CR>
nmap <Space>b :tabnew <CR>:FufBuffer<CR>
nmap <Space>v :vnew <CR> :FufFileWithCurrentBufferDir<CR>
nmap <Space>h :new <CR> :FufFileWithCurrentBufferDir<CR> 
nmap <Space>t :FufTaggedFile<CR>

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
nmap <silent> <Space>q :tabclose <CR> 
nmap <silent> <Space>n :tabnext <CR> 
nmap <silent> <Space>p :tabprevious <CR> 
"Elm
let g:elm_setup_keybindings = 0
nmap <silent> <Space>e :ElmShowErrorDetail <CR>
nmap <silent> <Space>l :ElmFormat <CR>

"autocomplete matching pairs
inoremap {<CR>  {<CR>}<Esc>O 
inoremap (<CR>  (<CR>)<Esc>O 

"hit return again to clear search highlighting
nnoremap <CR> :noh<CR><CR> 
"vim builtins 
runtime macros/matchit.vim

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:elm_syntastic_show_warnings = 1 
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:EclimCompletionMethod = 'omnifunc'
let g:jsx_ext_required = 0
let g:ycm_semantic_triggers = { 'elm' : ['.'], }
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': [] }                                       
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
Plug 'vim-syntastic/syntastic'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'elmcast/elm-vim' 
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
call plug#end() 
