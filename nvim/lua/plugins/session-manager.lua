-- :lua print(vim.fn.stdpath('data')) => ~/.local/share/nvim

return {
  'Shatur/neovim-session-manager',
  opts = {
    path_replacer = '__', -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
    autosave_last_session = false, -- Automatically save last session on exit and on session switch.
  },
  config = function(_, opts)
    opts.autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession

    vim.keymap.set('n', '<F5>', '<cmd>SessionManager save_current_session<CR><cmd>echo "session saved"<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<F8>', '<cmd>SessionManager load_current_dir_session<CR>', { noremap = true, silent = true })

    require('session_manager').setup(opts)
  end
}
