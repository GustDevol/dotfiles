""" Sourcing Plugins and Mappings
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim

""" Set options
syn on
set nu
set rnu
set laststatus=2
set bs=2 
set encoding=utf-8
set tabstop=4 softtabstop=0 expandtab smarttab
set clipboard=unnamedplus
set magic
set smartindent
set nocompatible

" Colors
set t_Co=256
set termguicolors
set background=dark
" colorscheme gruvbox
highlight Comment cterm=italic gui=italic

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

""" Following lines only if using st as terminal emulator
if $TERM == "st-256color"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

""" Turning Syntastic auto checking off
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

""" Closetags filetype
let g:closetag_filetypes = 'html,xhtml,phtml,js,ts'
let g:closetag_xhtml_filetypes = 'html,xhtml,phtml,js,ts'

""" hiding vim statusbar 
let s:hidden_all = 0

function! ToggleHidden()
  if s:hidden_all == 0
    let s:hidden_all = 1
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
  else
    let s:hidden_all = 0
    set showmode
    set ruler
    set laststatus=2
    set showcmd
  endif
endfunction
