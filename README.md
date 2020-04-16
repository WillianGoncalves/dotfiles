Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)

## Install
Install vim-gtk: `sudo apt install vim-gtk`

Clone this repository and run `./install.sh`

Install **youcompleteme** plugin:
- `sudo apt-get install build-essential cmake`
- `sudo apt-get install python-dev python3-dev`
- `cd ~/.vim/plugged/youcompleteme && sudo ./install.sh`

## Diagnostics
To check which plugins are making vim slow:

```
:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
:noautocmd qall!
```

## Utils

- `CTRL+r`: find and replace selected text (visual mode)
- `CTRL+j`: use snippet
- `]e`: go to next error
- `[e`: go to previous error
- `]h`: go to next hunk of changes
- `[h`: go to previous hunk of changes

## FZF

Install:

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

- The `:Rg` command requires [ripgrep](https://github.com/BurntSushi/ripgrep#installation) installed.
- The `:Files` command is mapped to CTRL+P.

## Vimtex

| LHS              | RHS                                          | MODE  |
| ---------------- | -------------------------------------------- | ----- |
| \<localleader>li  | <plug>(vimtex-info)                          | `n`     |
| \<localleader>lI  | <plug>(vimtex-info-full)                     | `n`     |
| \<localleader>lt  | <plug>(vimtex-toc-open)                      | `n`     |
| \<localleader>lT  | <plug>(vimtex-toc-toggle)                    | `n`     |
| \<localleader>lq  | <plug>(vimtex-log)                           | `n`     |
| \<localleader>lv  | <plug>(vimtex-view)                          | `n`     |
| \<localleader>lr  | <plug>(vimtex-reverse-search)                | `n`     |
| \<localleader>ll  | <plug>(vimtex-compile)                       | `n`     |
| \<localleader>lL  | <plug>(vimtex-compile-selected)              | `nx`    |
| \<localleader>lk  | <plug>(vimtex-stop)                          | `n`     |
| \<localleader>lK  | <plug>(vimtex-stop-all)                      | `n`     |
| \<localleader>le  | <plug>(vimtex-errors)                        | `n`     |
| \<localleader>lo  | <plug>(vimtex-compile-output)                | `n`     |
| \<localleader>lg  | <plug>(vimtex-status)                        | `n`     |
| \<localleader>lG  | <plug>(vimtex-status-all)                    | `n`     |
| \<localleader>lc  | <plug>(vimtex-clean)                         | `n`     |
| \<localleader>lC  | <plug>(vimtex-clean-full)                    | `n`     |
| \<localleader>lm  | <plug>(vimtex-imaps-list)                    | `n`     |
| \<localleader>lx  | <plug>(vimtex-reload)                        | `n`     |
| \<localleader>lX  | <plug>(vimtex-reload-state)                  | `n`     |
| \<localleader>ls  | <plug>(vimtex-toggle-main)                   | `n`     |
| dse              | <plug>(vimtex-env-delete)                    | `n`     |
| dsc              | <plug>(vimtex-cmd-delete)                    | `n`     |
| ds$              | <plug>(vimtex-env-delete-math)               | `n`     |
| dsd              | <plug>(vimtex-delim-delete)                  | `n`     |
| cse              | <plug>(vimtex-env-change)                    | `n`     |
| csc              | <plug>(vimtex-cmd-change)                    | `n`     |
| cs$              | <plug>(vimtex-env-change-math)               | `n`     |
| csd              | <plug>(vimtex-delim-change-math)             | `n`     |
| tsc              | <plug>(vimtex-cmd-toggle-star)               | `n`     |
| tse              | <plug>(vimtex-env-toggle-star)               | `n`     |
| tsd              | <plug>(vimtex-delim-toggle-modifier)         | `nx`    |
| tsD              | <plug>(vimtex-delim-toggle-modifier-reverse) | `nx`    |
| F7               | <plug>(vimtex-cmd-create)                    | `nxi`   |
| ]]               | <plug>(vimtex-delim-close)                   | `i`     |
| ac               | <plug>(vimtex-ac)                            | `xo`    |
| ic               | <plug>(vimtex-ic)                            | `xo`    |
| ad               | <plug>(vimtex-ad)                            | `xo`    |
| id               | <plug>(vimtex-id)                            | `xo`    |
| ae               | <plug>(vimtex-ae)                            | `xo`    |
| ie               | <plug>(vimtex-ie)                            | `xo`    |
| a$               | <plug>(vimtex-a$)                            | `xo`    |
| i$               | <plug>(vimtex-i$)                            | `xo`    |
| aP               | <plug>(vimtex-aP)                            | `xo`    |
| iP               | <plug>(vimtex-iP)                            | `xo`    |
| %                | <plug>(vimtex-%)                             | `nxo`   |
| ]]               | <plug>(vimtex-]])                            | `nxo`   |
| ][                |<plug>(vimtex-][)                              | `nxo`   |
| []               | <plug>(vimtex-[])                            | `nxo`   |
| [[               | <plug>(vimtex-[[)                            | `nxo`   |
| ]m               | <plug>(vimtex-]m)                            | `nxo`   |
| ]M               | <plug>(vimtex-]M)                            | `nxo`   |
| [m               | <plug>(vimtex-[m)                            | `nxo`   |
| [M               | <plug>(vimtex-[M)                            | `nxo`   |
| ]/               | <plug>(vimtex-]/                             | `nxo`   |
| ]*               | <plug>(vimtex-]star                          | `nxo`   |
| [/               | <plug>(vimtex-[/                             | `nxo`   |
| [*               | <plug>(vimtex-[star                          | `nxo`   |
| K                | <plug>(vimtex-doc-package)                   | `n`     |
