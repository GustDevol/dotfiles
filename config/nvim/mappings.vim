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
nnoremap <C-s> :call ToggleHidden()<CR>

inoremap <C-b> <C-x><C-o>


" Move Text
" lines up/dowm ( Normal Mode )
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
" char left/right ( Normal Mode )
nnoremap <C-h> dlhP
nnoremap <C-l> dlp
" selected up/dowm ( Visual Mode )
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv
" equally selected block left/right ( Visual Mode )
vnoremap <C-h> dhPgvhoho
vnoremap <C-l> dpgvlolo
