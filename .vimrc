filetype plugin on
colorscheme badwolf
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
nmap <silent> <Leader>O :CtrlPBuffer<CR>
"hit return again to clear search highlighting
nnoremap <CR> :noh<CR><CR>
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

nmap <silent> <Leader>1 :NERDTreeToggle<CR>

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


"Nerdtree quits when a file is opened from nerdtree
let NERDTreeQuitOnOpen=1


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd vimenter * bel terminal
autocmd vimenter * NERDTree | wincmd l
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call plug#begin('~/.vim/plugged')
"****************************************************************************************************
"" Color Schemes
"****************************************************************************************************
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'rafi/awesome-vim-colorschemes'
"****************************************************************************************************
"" Utilities
"****************************************************************************************************
Plug 'vim-airline/vim-airline' "sweet statusline plugin!
Plug 'vim-airline/vim-airline-themes'
Plug 'tommcdo/vim-exchange' "Vim exchange! Swapping regions of text
Plug 'bling/vim-bufferline' "show buffers in status line
Plug 'scrooloose/nerdtree' "file explorer
Plug 'scrooloose/nerdcommenter' "easycommenting
Plug 'ctrlpvim/ctrlp.vim' "different fuzzy finder
Plug 'tpope/vim-repeat' "awesome support for functions and stuff! Allows repeat on vim surround and stuff
Plug 'tpope/vim-surround' "change surrounding texts
Plug 'Raimondi/delimitMate' "bracket completion
Plug 'ntpeters/vim-better-whitespace' "remove trailing spaces h
Plug 'sickill/vim-pasta' "pasting with indentation context
Plug 'tyru/open-browser.vim' "open urls in the browser
Plug 'ryanoasis/vim-devicons' "Filetype icons support
"" stuff I want to learn how to use but havent yet!"
"Plug 'terryma/vim-multiple-cursors'
"****************************************************************************************************
"" Git support
"****************************************************************************************************
Plug 'tpope/vim-fugitive' "Git plugin
Plug 'Xuyuanp/nerdtree-git-plugin' "show git status in nerdtree
"****************************************************************************************************
"" Language Support
"****************************************************************************************************
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'dense-analysis/ale' "linter
Plug 'sheerun/vim-polyglot' "language packs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" JavaScript
Plug 'pangloss/vim-javascript' " JavaScript Syntax
Plug 'othree/javascript-libraries-syntax.vim' " Syntax for some JS libraries
call plug#end()

"****************************************************************************************************
"" Plugin config
"****************************************************************************************************
"ntpeters/vim-better-whitespace
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=0
"ryanoasis/vim-devicons
set encoding=UTF-8
"dense-analysis/ale "linter
nmap <silent> <Leader>b :ALEGoToDefinition <CR>
let g:ale_completion_tsserver_autoimport = 1
"prettier
"remap format
nmap <silent> <Leader>f <Plug>(Prettier)
"neoclide/coc
"set nobackup
"set nowritebackup
"set cmdheight=2 "sets the command window to 2 line heights
"set updatetime=300 "diagnostic messages for coc?
"set shortmess+=c "????
"set signcolumn=yes
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
"xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
