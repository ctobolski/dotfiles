"###############     COC      ###############"
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
let g:coc_global_extensions = [
 \'coc-json',
 \'coc-yaml',
 \'coc-jest',
 \'coc-marketplace',
 \'coc-git',
 \'coc-go',
 \'coc-tsserver',
 \'coc-prettier',
 \'coc-eslint',
 \'coc-snippets'
 \]

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()
nnoremap <silent> <Leader>a <Plug>(coc-codeaction-cursor)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>r <Plug>(coc-refactor)
nmap <leader>rn <Plug>(coc-rename)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


nmap <silent><leader>e :CocDiagnostics<CR>

"
"###############     COC EXTENSIONS     ###############"

"############### Snippets
imap <C-l> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-j>'
xmap <leader>x <Plug>(coc-convert-snippet)
