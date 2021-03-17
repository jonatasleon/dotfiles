" General funcions
function! IsLastBuffer()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

