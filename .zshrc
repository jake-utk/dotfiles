export PATH=$HOME/bin:/usr/local/opt/awscli@1/bin:/Applications/Docker.app/Contents/Resources/bin/docker-compose-v1:$PATH
export ZSH=$HOME/.oh-my-zsh

if [[ $(echo $HOST | cut -d "." -f 1) == "Jake-Addis-MBP16" ]]; then
    export ZSH_DISABLE_COMPFIX="true"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# poetry
if [[ -e "$HOME/.poetry/bin" ]]; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

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
if [[ $HOST == 'arch-thinkpad' || $(echo $HOST | cut -d "." -f 1) == "Jake-Addis-MBP16" ]]; then
    RPROMPT='%* $(battery_pct_prompt)'
else
    RPROMPT='%*'
fi

# mutual aliases
alias hs="history | grep"
alias myip="curl http://ipecho.net/plain; echo"

# device specific aliases
if [[ $(uname -r | sed "s/[^[:alpha:]]//g") == "arch" || $(echo $HOST | cut -d "." -f 1) == "Jake-Addis-MBP16" ]]; then
    source $HOME/.bash_aliases
fi

# built specific
if [[ $(echo $HOST | cut -d "." -f 1) == "Jake-Addis-MBP16" ]]; then
    export BUILT_SKIP_SERVICES=lot-management,agreements-service,accounting-service,auth-service,collateral-service,files-service,geolocations-service,payments-service,inspections-service,cla-product-api,cla-miniapp
    export SOURCE_REPO_PATH="/Users/jake.addis/dev/integration-pipelines"
    source "$SOURCE_REPO_PATH/integration-pipelines.zsh"
    echo "Welcome back, $USER!"
    # echo "$(tenure)"
fi
