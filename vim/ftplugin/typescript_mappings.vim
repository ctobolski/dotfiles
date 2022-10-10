"requires coc-extensions tsserver
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Fix :call CocAction('runCommand', 'tsserver.executeAutofix')
nmap <silent><leader>af :Fix<CR>
nmap <silent><leader>ao :OR<CR>

"requires coc-extensions jest
" Run jest for current test
"nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" Run jest for current file
nnoremap <leader>t :call  CocAction('runCommand', 'jest.fileTest', ['%'])<CR>

