return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
  -- The `main` branch is a full rewrite: there is no more `nvim-treesitter.configs`
  -- module, and `ensure_installed`/`auto_install`/`incremental_selection` are gone.
  -- Parsers are now installed on demand from a FileType autocommand instead.
  config = function()
    local ignore_install = { "ipkg", "jsonc", "unison", "mlir", "swift", "blueprint", "t32", "fusion", "teal", "scfg", "ocamllex", "latex" }
    -- Some languages depend on vim's regex indent system (such as Ruby).
    -- If you are experiencing weird indenting issues, add the language here
    -- to keep using its native ftplugin indentation instead of treesitter's.
    local indent_disable = { "ruby" }

    ---@param buf integer
    ---@param language string
    local function try_attach(buf, language)
      -- check if parser exists and load it
      if not vim.treesitter.language.add(language) then
        return
      end

      -- enables syntax highlighting and other treesitter features
      vim.treesitter.start(buf, language)

      -- enables treesitter based indentation
      if not vim.tbl_contains(indent_disable, language) then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    local available_parsers = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(ignore_install, lang)
    end, require("nvim-treesitter").get_available())

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        local installed_parsers = require("nvim-treesitter").get_installed("parsers")

        if vim.tbl_contains(installed_parsers, language) then
          -- enable the parser if it is already installed
          try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
          -- install it first, then enable it
          require("nvim-treesitter").install(language):await(function()
            try_attach(buf, language)
          end)
        end
      end,
    })
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: no longer supported on the `main` branch
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects (main branch)
}
