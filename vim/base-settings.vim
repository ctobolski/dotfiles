"###############                ###############"
"                                              "
"                Base Settings                 "
"                                              "
"###############                ###############"
filetype plugin on
"" set re=0 "because on mac there was excessive redraw time that ruined syntax highlighting
set mouse=a
set backspace=indent,eol,start " allow backspace
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
set smartcase
set ignorecase
set number
set noswapfile
set ttimeoutlen=100 "reduce timout length so o and O dont take so damn long.
set hidden "Dont warn me when swapping to buffers when I have a modified one
syntax on
