map <F6> :source ~/.config/nvim/init.vim<CR>
map <F4> :e ~/.config/nvim/init.vim<CR>
map <F9> :w<CR> 
map <Del> dl
map ;, :tabp<CR>
map ;. :tabn<CR>

nnoremap <C-w>E :SyntasticCheck<CR>
nnoremap <leader>t  :NERDTreeToggle<CR>
nnoremap <leader>g  :GitGutterToggle<CR>
nnoremap ,tg :!ctags -R .<CR><CR>
nnoremap ,mk :!make
nnoremap ,ga  :G add 
nnoremap ,gm  :G commit -S -m ""<LEFT>
nnoremap ,gP :G push<CR>
nnoremap ,gp :G pull<CR>

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

" COC
nnoremap <A-h> :CocCommand clangd.inlayHints.toggle<CR>
nnoremap <C-e>E :CocEnable<CR>
nnoremap <C-e>D :CocDisable<CR>
" COC Snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
