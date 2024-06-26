return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require('gitsigns')

    local on_attach = function(bufnr)
      local function map(mode, l, r, desc)
        desc = desc or ''
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = 'Gitsigns: ' .. desc })
      end

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal({']h', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end)

      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal({'[h', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end)

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, '[H]unk [S]tage')
      map('n', '<leader>hr', gitsigns.reset_hunk)
      map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, '[H]unk [S]tage')
      map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      map('n', '<leader>hS', gitsigns.stage_buffer)
      map('n', '<leader>hu', gitsigns.undo_stage_hunk)
      map('n', '<leader>hR', gitsigns.reset_buffer)
      map('n', '<leader>hp', gitsigns.preview_hunk)
      map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
      map('n', '<leader>hd', gitsigns.diffthis)
      map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
      map('n', '<leader>td', gitsigns.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end


    gitsigns.setup({ on_attach = on_attach })
  end
}
