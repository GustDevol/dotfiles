function! LazyGit(...)
    if a:0 == 0
        Term lazygit
        return
    endif
    execute a:1 . 'Term lazygit'
endfunction

function! Python(...)
    if a:0 == 0
        Term python3
        return
    endif
    execute a:1 . 'Term python3'
endfunction

function! Node(...)
    if a:0 == 0
        Term node
        return
    endif
    execute a:1 . 'Term node'
endfunction
