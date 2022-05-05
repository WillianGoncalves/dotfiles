# Path to your oh-my-zsh installation.
export ZSH=/home/willian/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="af-magic"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker-compose zsh-syntax-highlighting zsh-256color tmux)

ZSH_TMUX_AUTOSTART="true"

source $ZSH/oh-my-zsh.sh

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias robomongo='/usr/local/bin/robomongo/robo3t-1.3.1-linux-x86_64-7419c406/bin/robo3t'
alias nvim='$HOME/Applications/nvim_v0_7.appimage'
alias gco='git checkout $(git branch | fzf)'
alias cdpl='cd $HOME/Projects/o2/etherpad-docker/etherpad-src/etherpad-lite/node_modules && cd $(ls | fzf)'
alias bat='$HOME/.local/bin/bat'

# autoload functions defined in "functions" folder
fpath=($HOME/Projects/dotfiles/zsh/functions $fpath)
autoload $fpath[1]/*(.:t)

export VISUAL='$HOME/Applications/nvim_v0_7.appimage'
export EDITOR="$VISUAL"
