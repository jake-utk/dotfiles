export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.scripts:$PATH
export ZSH="/home/jake/.oh-my-zsh"


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git
        git-prompt
        battery)

# For adjustment of git-prompt, see $HOME/.oh-my-zsh/plugins/git-prompt.plugin.zsh
PROMPT='%(?.%F{green}√.%F{red}✗)%f%(1j. ⚙.) %B%F{240}%1~%f%b $(git_super_status) %# '
RPROMPT='%* $(battery_pct_prompt)'

source $ZSH/oh-my-zsh.sh

alias hs="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias ufw:up="sudo ufw enable"
alias vpn="sudo protonvpn"
alias vpn:status="sudo protonvpn s"
alias vpn:up="sudo protonvpn connect -f"
alias vpn:down="sudo protonvpn disconnect"
alias vpn:refresh="vpn:down && vpn:up"
alias sysch="echo 'Checking vpn...' && sudo protonvpn s | grep Status: && echo 'Checking firewall...' && sudo ufw status | grep Status:"
alias sandbox="code ~/dev/sandbox"
alias dotfiles='/usr/bin/git --git-dir=/home/jake/.dotfiles/ --work-tree=/home/jake'
alias audio-devices='pactl list sinks | grep "Sink #\|Ports\|analog-ou" -A 3'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.poetry/bin:$PATH"
