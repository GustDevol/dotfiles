" Lightline Options
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'gitstatus', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename':  'LightLineFilename',
      \   'filetype':  'LightlineFiletype',
      \   'fileformat': 'LightlineFileformat',
      \   'gitstatus': 'LightLineGitStatus',
      \ },
      \ }

function! LightLineFilename()
  return (expand('%:t') != '' ? WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '[No Name]')
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineGitStatus()
  if winwidth(0) <= 70
      return ''
  endif
  let [a,m,r] = GitGutterGetHunkSummary()
  if a == 0 && m == 0 && r == 0
      return ''
  endif
  return printf('+%d ~%d -%d', a, m, r)
endfunction
