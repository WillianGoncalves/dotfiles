return {
  'github/copilot.vim',
  init = function()
    vim.keymap.set('i', '<C-C>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })

    vim.g.copilot_no_tab_map = true
    vim.g.copilot_node_command = '~/.nvm/versions/node/v22.14.0/bin/node'
  end,
}
