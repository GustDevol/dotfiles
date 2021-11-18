map <F6> :source ~/.config/nvim/init.vim
map <F4> :e ~/.config/nvim/init.vim
map <F9> :w<CR> 
map <Del> dl
map ;, :tabp<CR>
map ;. :tabn<CR>

nnoremap <C-w>E :SyntasticCheck<CR>
nnoremap nt  :NERDTreeToggle<CR>
nnoremap ,tg :!ctags -R .<CR><CR>
nnoremap ,mk :!make 
nnoremap ,ga  :G add 
nnoremap ,gm  :G commit -S -m ""<LEFT>
nnoremap ,gP :G push<CR>
nnoremap ,gp :G pull<CR>
nnoremap <C-h> :call ToggleHidden()<CR>

inoremap <C-b> <C-x><C-o>
