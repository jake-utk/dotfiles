# Loads last (behind zshenv + zprofile)
# For interactive shells

# load completion system
autoload -Uz compinit && compinit

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups share_history

# aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# colors for git prompt
autoload -U colors && colors
for color in black red green yellow blue magenta cyan white; do
  eval "fg[$color]='%F{$color}'"
  eval "fg_bold[$color]='%B%F{$color}'"
  eval "bg[$color]='%K{$color}'"
  eval "bg_bold[$color]='%B%K{$color}'"
done
reset_color="%f%b%k"

# plugins
ZSH_PLUGINS=$HOME/.zsh_plugins

source $ZSH_PLUGINS/git-prompt/git-prompt.plugin.zsh
[[ -z $SSH_TTY && -z $SSH_CONNECTION ]] && source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# functions for prompt
venv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
        version="$(python --version 2>/dev/null | cut -d ' ' -f2)"
        echo "[%B%F{2}🐍%f%b|%B%F{208}$version%f%b|%B%F{10}$venv%f%b] "
    fi
}

setopt PROMPT_SUBST
# zsh prompt
PROMPT='%(?.%F{green}√.%F{red}✗)%f%(1j. ⚙.) $(venv_info)%B%F{208}%1~%f%b $(git_super_status)%# '
RPROMPT=''

# fzf bindings + completion
if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
    source /opt/homebrew/opt/fzf/shell/completion.zsh
fi
