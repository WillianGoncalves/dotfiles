local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tr', builtin.lsp_references, { desc = '[T]elescope lsp [r]eferences' })
vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope [h]elp tags' })
vim.keymap.set('n', '<leader>tgc', builtin.git_commits, { desc = '[T]elescope [g]it [c]ommits' })
vim.keymap.set('n', '<leader>tbc', builtin.git_bcommits, { desc = '[T]elescope git [b]uffer [c]ommits' })
vim.keymap.set('n', '<leader>tgb', builtin.git_branches, { desc = '[T]elescope [g]it [b]ranches' })
vim.keymap.set('n', '<leader>tgs', builtin.git_status, { desc = '[T]elescope [g]it [s]tatus' })
vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = '[T]elescope [k]eymaps' })
vim.api.nvim_create_user_command('Colors', 'Telescope colorscheme', {})

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    path_display = { truncate = 3 },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-y>"] = actions.preview_scrolling_up,
        ["<C-e>"] = actions.preview_scrolling_down,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension('fzf')
