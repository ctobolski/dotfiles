"###############      FZF       ###############"
" [Buffers] Jump to the existing window if possible
set rtp+='/home/chris/.local/custom/fzf'
let g:fzf_buffers_jump = 1
nmap <silent> <Leader><Space> :Buffers<CR>
nmap <silent> <Leader>o :FZF<CR>
