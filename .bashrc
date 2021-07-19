#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval $(keychain --eval --quiet)

alias ls='ls --color=auto'
alias hs='history | grep'
PS1='[\u@\h \W]\$ '
