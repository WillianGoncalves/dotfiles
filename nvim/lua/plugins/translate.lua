return {
  'uga-rosa/translate.nvim',
  config = function()
    require('translate').setup {
      default = {
        command = "google",
        output = "replace",
      },
      preset = {
        output = {
          replace = 'head',
        },
      },
    }

    vim.keymap.set('v', '<leader>tr', "<cmd>Translate en<CR>", { desc = '[T]elescope lsp [r]eferences' })
  end
}
