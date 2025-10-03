return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.align').setup()

    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    local spec_treesitter = require('mini.ai').gen_spec.treesitter
    require('mini.ai').setup({
      n_lines = 500,
      custom_textobjects = {
        -- Tree-sitter attribute text objects for JSX/HTML.
        -- We define 'A' for Attributes using the treesitter spec generator.
        A = spec_treesitter({ a = "@attribute.outer", i = "@attribute.inner" }),
        F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
      },
    })
  end
}
