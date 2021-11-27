export PATH="$HOME/bin:/usr/local/opt/awscli@1/bin:/Applications/Docker.app/Contents/Resources/bin/docker-compose-v1:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# poetry
# export PATH="$HOME/.poetry/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
. ~/.nvm/nvm.sh

# setup zsh plugins
plugins=(git git-prompt battery zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

PROMPT='%(?.%F{green}√.%F{red}✗)%f%(1j. ⚙.) %B%F{240}%1~%f%b $(git_super_status)%# '
RPROMPT='%* $(battery_pct_prompt)'


alias sandbox="code $HOME/dev/sandbox"
alias hs="history | grep"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Built specific
export BUILT_SKIP_SERVICES=lot-management,agreements-service,accounting-service,auth-service,collateral-service,files-service,geolocations-service,payments-service,inspections-service,cla-product-api,cla-miniapp
export SOURCE_REPO_PATH="/Users/jake.addis/dev/integration-pipelines"
source "$SOURCE_REPO_PATH/integration-pipelines.zsh"
