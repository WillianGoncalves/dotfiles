return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require "telescope.actions"

    require('telescope').setup {
      defaults = {
        layout_strategy = 'vertical',
        layout_config = { preview_cutoff = 0 },
        path_display = { truncate = 3 },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>tr', builtin.lsp_references, { desc = '[T]elescope lsp [r]eferences' })
    vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope [h]elp tags' })
    vim.keymap.set('n', '<leader>tgc', builtin.git_commits, { desc = '[T]elescope [g]it [c]ommits' })
    vim.keymap.set('n', '<leader>tbc', builtin.git_bcommits, { desc = '[T]elescope git [b]uffer [c]ommits' })
    vim.keymap.set('n', '<leader>tgb', function() builtin.git_branches({ show_remote_tracking_branches = false }) end, { desc = '[T]elescope [g]it [b]ranches' })
    vim.keymap.set('n', '<leader>tgs', builtin.git_status, { desc = '[T]elescope [g]it [s]tatus' })
    vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = '[T]elescope [k]eymaps' })
    vim.keymap.set('n', '<leader>tof', function() builtin.oldfiles({ only_cwd = true }) end, { desc = '[T]elescope [o]ld [f]iles' })
    vim.api.nvim_create_user_command('Colors', 'Telescope colorscheme', {})

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end
}
