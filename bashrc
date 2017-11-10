#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh'

PS1='[\u@\h \W]\$ '

export TERMINAL=roxterm

exec fish
