return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  build = 'cargo build --release',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  opts = {
    keymap = {
      preset = 'default',
      -- Select the [n]ext item
      ['<C-j>'] = { 'select_next', 'fallback' },
      ["<Tab>"] = { 'select_next', 'fallback' },
      -- Select the [p]revious item
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ["<S-Tab>"] = { 'select_prev', 'fallback' },

      -- Scroll the documentation window [b]ack / [f]orward
      ['<C-y>'] = { 'scroll_documentation_up' },
      ['<C-e>'] = { 'scroll_documentation_down' },

      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      --  This will auto-import if your LSP supports it.
      --  This will expand snippets if the LSP sent a snippet.
      ['<CR>'] = { 'select_and_accept', 'fallback' },
      ["<C-x>"] = { 'cancel' },

      -- Manually trigger a completion from nvim-cmp.
      --  Generally you don't need this, because nvim-cmp will display
      --  completions whenever it has completion options available.
      ['<C-Space>'] = { 'show' },

      -- Think of <c-l> as moving to the right of your snippet expansion.
      --  So if you have a snippet that's like:
      --  function $name($args)
      --    $body
      --  end
      --
      -- <c-n> will move you to the right of each of the expansion locations.
      -- <c-p> is similar, except moving you backwards.
      ['<C-n>'] = { 'snippet_forward', 'fallback' },
      ['<C-p>'] = { 'snippet_backward', 'fallback' },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      -- menu = {
      --   draw = {
      --     columns = {
      --       { "label",     "label_description", gap = 1 },
      --       { "kind_icon", "kind" }
      --     }
      --   }
      -- }
    },

    sources = {
      -- OLD WAY:
      -- sources = {
      --   { name = "nvim_lsp", priority = 90 },
      --   { name = "nvim_lua", priority = 80 },
      --   { name = "buffer",   priority = 20 },
      --   { name = "path",     priority = 10 },
      -- },
      default = { 'lsp', 'snippets', 'lazydev', 'path' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        snippets = {
          opts = {
            friendly_snippets = true,
          }
        }
      },
    },

    snippets = { preset = 'luasnip' },

    cmdline = {
      keymap = {
        preset = 'inherit',
        ['<CR>'] = { 'accept_and_enter', 'fallback' },
      },
      completion = {
        menu = {
          auto_show = true,
        },
        ghost_text = {
          enabled = true,
        },
        list = {
          selection = {
            preselect = false,
          }
        }
      },
    }
  }
  -- config = function()
  --   cmp.setup.cmdline("/", {
  --     preselect = "None",
  --     completion = {
  --       completeopt = "menu,menuone,noinsert,noselect",
  --     },
  --     mapping = cmp.mapping.preset.cmdline(),
  --     sources = {
  --       { name = "buffer" },
  --     },
  --   })

  --   cmp.setup.cmdline(":", {
  --     preselect = "None",
  --     completion = {
  --       completeopt = "menu,menuone,noinsert,noselect",
  --     },
  --     mapping = cmp.mapping.preset.cmdline(),
  --     sources = cmp.config.sources({
  --       { name = "path", priority = 10 },
  --     }, {
  --       { name = "cmdline", priority = 70 },
  --     }),
  --   })
  -- end,
}
