" Toggle Status Line
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
nnoremap <C-s> :call ToggleHidden()<CR>

" Load vim or lua config based on nvim version
" and uselua variable value

" redir => vrs
" silent version
" redir END
" if split(vrs)[1] =~ 'v0.[5-9]..'

let uselua = 1
if has('nvim-0.7') && uselua
    lua require('init')
else
    """ Sourcing Plugins and Mappings
    source $HOME/.config/nvim/plugins.vim
    source $HOME/.config/nvim/mappings.vim
    source $HOME/.config/nvim/lightline.vim
    source $HOME/.config/nvim/splitterm.vim
    source $HOME/.config/nvim/opts.vim
endif
