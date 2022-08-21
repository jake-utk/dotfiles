alias cache="ls $HOME/.built/cache | grep"
alias rm="rm -i"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias sandbox="code $HOME/dev/sandbox"
alias aws="AWS_SHARED_CREDENTIALS_FILE=$HOME/.aws/prod-integrations aws"
alias credstash="AWS_SHARED_CREDENTIALS_FILE=$HOME/.aws/prod-integrations credstash"
alias dps='docker ps --format "{{.Names}} => [{{.Status}}]"'
unalias gl # set by zsh / oh-my-zsh
alias gl="git log --oneline --decorate --graph | head"
