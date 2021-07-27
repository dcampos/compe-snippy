# compe-snippy

[Snippy](https://github.com/dcampos/nvim-snippy) source and integration for
[hrsh7th/nvim-compe](https://github.com/hrsh7th/nvim-compe)

# Install

Using vim-plug:

```viml
Plug 'dcampos/compe-snippy'
```

You also need to enable the plugin:

```viml
let g:compe.source.tabnine = v:true
```

Or (using Lua):

```lua
require'compe'.setup {
  ...
  source = {
    ...
    snippy = true;
  };
}
```
