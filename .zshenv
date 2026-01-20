# Loads in both login and non-interactive shells
# Always loaded first (ahead of zprofile, zshrc, etc)

# homebrew
export HOMEBREW_NO_ENV_HINTS="true"
eval "$(/opt/homebrew/bin/brew shellenv)"

# local bins
export PATH="$LOCAL/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# tmux-256color $TERM type
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

# Disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# local; not sure what for
export LOCAL="$HOME/.local"
