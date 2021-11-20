export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="/home/jake/.oh-my-zsh"

if [[ $(uname -r | sed "s/[^[:alpha:]]//g") == "arch" ]]; then
        source $HOME/.bash_aliases
fi

plugins=(git
        git-prompt
        battery
        zsh-autosuggestions
        zsh-syntax-highlighting)

# For adjustment of git-prompt, see $HOME/.oh-my-zsh/plugins/git-prompt.plugin.zsh
# To use battery plugin, must have acpi package installed
PROMPT='%(?.%F{green}√.%F{red}✗)%f%(1j. ⚙.) %B%F{240}%1~%f%b $(git_super_status)%# '
if [[ $HOST == 'arch-thinkpad' ]]; then
        RPROMPT='%* $(battery_pct_prompt)'
else
        RPROMPT='%*'
fi

source $ZSH/oh-my-zsh.sh

alias hs="history | grep"
alias myip="curl http://ipecho.net/plain; echo"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.poetry/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
