## Setup
Install vim-gtk: `sudo apt install vim-gtk`

**Some plugins require `node` installed.**

Clone this repository and run `./install.sh`

## Plugins manager
Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)

To generate a snapshot of all plugins, run:

```
:PlugSnapshot ./vim/plugins_snapshot.vim
```

The generated file describes how to restore the plugins versions.

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
- `]e`: go to next error (ale)
- `[e`: go to previous error (ale)
- `]h`: go to next hunk of changes (gitgutter)
- `[h`: go to previous hunk of changes (gitgutter)
- `\uh`: undo hunk (gitgutter)
- `\ntt`: nerd tree toggle (nerdtree)
- `CTRL+n`: jump to next placeholder within a snippet (coc)
- `CTRL+p`: jump to previous placeholder within a snippet (coc)
- `CTRL+n`, `CTRL+j`: when the snippets window is opened, jump to next snippet option (coc)
- `CTRL+p`, `CTRL+k`: when the snippets window is opened, jump to previous snippet option (coc)
- `CTRL+c`: when the snippets window is opened, confirms the snippet option (coc)
- `TAB`: use snippet when in snippet window (coc)
- `:Gread`: checkout current file

## Fugitive

1. `:Git` to open the fugitive summary with all changes (`g?` to help)
2. `s` state file under cursor
3. `u` unstage file under cursor
4. `cc` create commit

## FZF, ripgrep and fd

Install:

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

**Fzf** already includes a `Rg` command, but the **vim-ripgrep** has some
advantages like send the search result to quickfix automatically, search for
the word under cursor and specify search parameters (like --glob/-g).  For that
reason we use both, and to do so, we create a custom command called `RGDynamic`
to be used by **fzf**. So we have:

- `RGDynamic`, which uses fzf plugin, mapped to CTRL+f;
- `Rg`, which uses vim-ripgrep plugin.

Vim-ripgrep plugin must be included after fzf so that the fzf's `Rg` command is
overrided with the vim-ripgrep's `Rg` command. Algo, it requires
[ripgrep](https://github.com/BurntSushi/ripgrep#installation) to be installed
on Ubuntu.

| Command | Description                                   | Requires                                                        |
| ------- | --------------------------------------------- | --------------------------------------------------------------- |
| CTRL+p  | Find files                                    | [fd](https://github.com/sharkdp/fd)                             |
| CTRL+f  | Find content, uses fzf's `Rg` command         | [ripgrep](https://github.com/BurntSushi/ripgrep#installation)   |
| Rg      | Find content, uses vim-ripgrep's `Rg` command | [ripgrep](https://github.com/BurntSushi/ripgrep#installation)   |

In the results window:

- TAB: select and move cursor down
- SHIFT+TAB: select and move cursor up (for some reason, neovim doesn't support the key)
- ALT+a: select all
- ALT+d: deselect all
- ENTER / CTRL+x / CTRL+v / CTRL+t: open selected entries (current window / horizontal splits / vertical splits / tabs), and send them to quickfix

## Coc

To use snippets, it is necessary to install the [vim-snippets](https://github.com/honza/vim-snippets) plugin.

## Tags

To use tags, install exuberant-ctags on Ubuntu:

```
sudo apt-get update -y
sudo apt-get install -y exuberant-ctags
```

And create the `~/.ctags` configuration file (copy the content from the `ctags-config` file in this project).

The **vim-gutentags** plugin will use it.

Finally, create a `~/.gitignore_global` file, add `tags` to it and configure git to use this file:

```
git config --global core.excludesfile ~/.gitignore_global
```

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
