" Emulate vsnip so we can expand with snippy instead

function! vsnip#anonymous(body) abort
    call luaeval("snippy.expand_snippet(_A)", a:body)
endfunction
