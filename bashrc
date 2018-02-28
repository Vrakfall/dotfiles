#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SXHKD_SHELL='/usr/bin/sh'
export BSPWM_SHELL='/usr/bin/sh'
export BSPWMRC_SHELL='/usr/bin/sh'
export TERMINAL=roxterm
export BROWSER=vivaldi-stable

export PATH="/home/vrakfall/.bin:$PATH"

alias ls='ls --color=auto'
alias ll='ls -alh'
alias gst='git status'

PS1='[\u@\h \W]\$ '

exec fish
