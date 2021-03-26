" General funcions
function! IsLastBuffer()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
endfunction

function! OpenFileInPrevWindow()
    let cfile = expand("<cfile>")
    wincmd p
    execute "edit " . cfile
endfunction
