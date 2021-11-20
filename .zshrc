export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# arch linux aliases
if [[ $(uname -r | sed "s/[^[:alpha:]]//g") == "arch" ]]; then
        source $HOME/.bash_aliases
fi

# setup zsh plugins
plugins=(git git-prompt battery zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# for adjustment of git-prompt, see $HOME/.oh-my-zsh/plugins/git-prompt.plugin.zsh
PROMPT='%(?.%F{green}√.%F{red}✗)%f%(1j. ⚙.) %B%F{240}%1~%f%b $(git_super_status)%# '

# display battery info for laptop
if [[ $HOST == 'arch-thinkpad' ]]; then
        RPROMPT='%* $(battery_pct_prompt)'
else
        RPROMPT='%*'
fi

# mutual aliases
alias hs="history | grep"
alias myip="curl http://ipecho.net/plain; echo"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# poetry 
export PATH="$HOME/.poetry/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
