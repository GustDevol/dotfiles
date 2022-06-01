call plug#begin('~/.local/share/nvim/plugins')

  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'vim-syntastic/syntastic'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ap/vim-css-color'
  Plug 'mattn/emmet-vim'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround' | Plug 'tpope/vim-commentary' | Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'joshdick/onedark.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'vimlab/split-term.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ryanoasis/vim-devicons'

call plug#end()
