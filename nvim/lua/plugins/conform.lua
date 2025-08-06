return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        fdx = { 'prettier_xml' },
        xml = { 'prettier_xml' }
      },
    })

    -- require('conform').formatters.prettier_xml = {
    --   command = 'prettier',
    --   args = { '--stdin-filepath', '$FILENAME', '--parser', 'xml' },
    --   stdin = true,
    -- }
    require('conform').formatters.prettier_xml = {
      command = 'xmllint',
      args = { '$FILENAME' },
      stdin = true,
    }

    vim.api.nvim_create_user_command('Format', function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ['end'] = { args.line2, end_line:len() },
        }
      end
      require('conform').format({ async = true, lsp_format = 'prefer', range = range })
    end, { range = true })
  end
}
