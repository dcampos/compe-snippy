vim.g.loaded_compe_snippy = 1
vim.g.loaded_vsnip = 1

-- Emulate vsnip so we can expand with snippy instead
vim.fn['vsnip#anonymous'] = function (body)
    require('snippy').expand_snippet(body)
end

require('compe').register_source('snippy', require 'compe_snippy')
