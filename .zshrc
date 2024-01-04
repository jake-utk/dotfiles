echo "Welcome back, $USER!"
export PATH=$HOME/bin:/usr/local/opt/awscli@1/bin:/Applications/Docker.app/Contents/Resources/bin/docker-compose-v1:$PATH
export ZSH=$HOME/.oh-my-zsh

export ZSH_DISABLE_COMPFIX="true"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# setup zsh plugins
plugins=(git git-prompt battery zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

venv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
        version="$(python --version | cut -d ' ' -f2)"
    else
        venv=''
        version=''
    fi
    [[ -n "$venv" ]] && echo "[%B%F{2}🐍%f%b|%B%F{208}$version%f%b|%B%F{10}$venv%f%b] "
}

# disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# zsh prompt
# for adjustment of git-prompt, see $HOME/.oh-my-zsh/plugins/git-prompt.plugin.zsh
PROMPT='%(?.%F{green}√.%F{red}✗)%f%(1j. ⚙.) $(venv_info)%B%F{240}%1~%f%b $(git_super_status)%# '

# display battery info if laptop
if [[ $HOST == 'arch-thinkpad' || $(echo $HOST | cut -d "." -f 1 | tail -c 6) == "MBP16" ]]; then
    RPROMPT='%* $(battery_pct_prompt)'
else
    RPROMPT='%*'
fi

# aliases
source $HOME/.bash_aliases

# MacOS tmux-256color $TERM type
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

# ripgrep configuration
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_DEFAULT_OPS='-m --height 50% --border'
fi
