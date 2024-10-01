return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
		vim.keymap.set("n", "<leader>cc", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope [c]hange [c]ase" })
		vim.keymap.set("v", "<leader>cc", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope [c]hange [c]ase" })
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  cmd = {
    -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
    "Subs",
    "TextCaseOpenTelescope",
    "TextCaseOpenTelescopeQuickChange",
    "TextCaseOpenTelescopeLSPChange",
    "TextCaseStartReplacingCommand",
  },
  -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
  -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
  -- available after the first executing of it or after a keymap of text-case.nvim has been used.
  lazy = false,
}
