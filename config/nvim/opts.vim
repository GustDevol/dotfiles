""" Set options
syn on
set nu
set rnu
set laststatus=2
set bs=2 
set path+=**
set encoding=utf-8
set nohlsearch incsearch
set tabstop=4 softtabstop=0 expandtab smarttab
set shiftwidth=4
set clipboard=unnamedplus
set magic
set smartindent
set hidden
set splitbelow splitright
set completeopt=menu,menuone,noselect
if has('nvim-0.5')
    set signcolumn=number
endif

" Colors
set termguicolors
set background=dark
colorscheme onedark
highlight Comment cterm=italic gui=bolditalic

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

""" Map leader to SPC
map <SPACE> <leader>
"" nnoremap <SPACE> <Nop>
" let mapleader = " "
" let g:mapleader = " "

""" Following lines only if using st as terminal emulator
if $TERM == "st-256color"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

""" Turning Syntastic auto checking off
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

""" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,typescript,htmldjango,jinja.html EmmetInstall
""" Closetags filetype
let g:closetag_filetypes = 'html,xhtml,phtml,js,ts,javascript'
let g:closetag_xhtml_filetypes = 'html,xhtml,phtml,js,ts,javascript'
