require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "dockerfile",
    "graphql",
    "hcl",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "json5",
    "latex",
    "lua",
    "prisma",
    "regex",
    "ruby",
    "scss",
    "typescript",
    "vim",
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}
