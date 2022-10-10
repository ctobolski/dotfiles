command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Fix :call CocAction('runCommand', 'tsserver.executeAutofix')
nmap <silent><leader>af :Fix<CR>
