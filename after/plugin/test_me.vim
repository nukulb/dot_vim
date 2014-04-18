"Find the test file
function! s:FindTestOrCode()
    let test = s:GetTestOrCode(expand('%'))
    call s:Open(test)
endfunction

" Return the test
function! s:GetTestOrCode(file)
    if match(a:file, '^test\/backend') != -1
        echo 'here1'
        return substitute(a:file, '^test\/backend/', 'lib/', '')
    elseif match(a:file, '^test\/frontend') != -1
        echo 'here2'
        return substitute(a:file, '^test\/frontend\/spec/', 'app\/scripts/', '')
    elseif match(a:file, '^lib') != -1
        echo 'here3'
        return substitute(a:file, '^lib/', 'test\/backend/', '')
    elseif match(a:file, '^app') != -1
        echo 'here4'
        return substitute(a:file, '^app\/scripts/', 'test\/frontend\/spec/', '')
    else
        echo 'here5'
        return a:file
    endif
endfunction

function! s:Open(file)
    exec('e ' . a:file)
endfunction

" Register a new command `OT` for open the test file
command! OT :call <SID>FindTestOrCode()
