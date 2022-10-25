local status_ok, leap = pcall(require, "leap")
if not status_ok then
  return
end

leap.add_default_mappings()
vim.api.nvim_create_autocmd({'ColorScheme'}, {
  pattern = '*',
  command = 'lua require("leap").init_highlight(true)'
})
