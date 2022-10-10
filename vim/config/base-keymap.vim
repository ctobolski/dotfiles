"###############                ###############"
"                                              "
"                Key Remapping                 "
"              Non-plugin specific             "
"                                              "
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

"binding buffers
nmap <silent> <Leader>h :bprev<CR>
nmap <silent> <Leader>l :bnext<CR>
nmap <silent> <Leader>w :bd <CR>
nmap <silent> <Leader>w! :bd! <CR>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"hit return again to clear search highlighting
nnoremap <CR> :noh<CR><CR>

"quickly edit vimrc
noremap <Leader>rc :tabe $MYVIMRC<CR>
"source vimrc
noremap <Leader>sc :source $MYVIMRC<CR>
