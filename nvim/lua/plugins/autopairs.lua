-- TODO configure with nvim-cmp: https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  opts = {
    enable_check_bracket_line = false
  },
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
