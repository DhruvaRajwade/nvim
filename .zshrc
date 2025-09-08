
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/tmux:$PATH"

export TERM=xterm-256color

plugins=(git fast-syntax-highlighting zsh-autosuggestions history zsh-history-substring-search copybuffer vscode python zsh-lazyload)


eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

source $ZSH/oh-my-zsh.sh



export PATH="$HOME/.fzf/bin:$PATH"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
# pyenv setup (uncomment if using pyenv)

# lazyload pyenv -- 'export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"'

# conda setup (#NOTE: CHANGE PATH ACCORDING TO YOUR CONDA INSTALLATION)
lazyload conda -- 'export PATH="~/miniforge3/bin:$PATH"
__conda_setup="$('/home/dhruva/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dhruva/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/dhruva/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dhruva/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/dhruva/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/dhruva/miniforge3/etc/profile.d/mamba.sh"
fi'
#
# nvim alias
alias nvim="$HOME/.config/nvim/nvim-linux-x86_64.appimage"
alias la='ls -a'


# nvm setup (install using: `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash`)

# lazyload nvm -- 'export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
#
# Rust setup (#NOTE: install using conda OR `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`)

# . "$HOME/.cargo/env"

# alias tmux="~/.config/tmux/tmux.appimage -u -f ~/.tmux.conf"

#NOTE: Can install Go using Conda (`conda install conda-forge::go`)

# export GOROOT="$HOME/.local/go"
# export GOPATH="$HOME/go"
# export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

#NOTE: Zoxide can be installed using `curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh`

# eval "$(zoxide init zsh)"

#NOTE: sesh can be installed using `conda -c conda-forge install sesh` or via Go: `go install github.com/joshmedeski/sesh/v2@latest`

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search



# alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs ~/.config/nvim/nvim-linux-x86_64.appimage'

