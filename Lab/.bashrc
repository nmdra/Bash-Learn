#!/bin/bash

#######################################################
# SOURCED ALIAS'S AND SCRIPTS BY zachbrowne.me
#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

status() {
	{ echo -e "\nuptime:"
		uptime
		echo -e "\ndisk space:"
		df -h 2> /dev/null
		echo -e "\ninodes:"
		df -i 2> /dev/null
		echo -e "\nblock devices:"
		blkid
		echo -e "\nmemory:"
		free -m
		if [[ -r /var/log/syslog ]]; then
			echo -e "\nsyslog:"
			tail /var/log/syslog
		fi
		if [[ -r /var/log/messages ]]; then
			echo -e "\nmessages:"
			tail /var/log/messages
		fi
	} | less
}

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

#######################################################
# Set the ultimate amazing command prompt
#######################################################

alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
function __setprompt {
  local LAST_COMMAND=$? # Must come first!

  # Define colors
  local DARKGRAY="\033[1;30m"
  local RED="\033[0;31m"
  local LIGHTRED="\033[1;31m"
  local GREEN="\033[0;32m"
  local BROWN="\033[0;33m"
  local NOCOLOR="\033[0m"

  # Show error exit code if there is one
  if [[ $LAST_COMMAND != 0 ]]; then
    # PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
    PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
    if [[ $LAST_COMMAND == 1 ]]; then
      PS1+="General error"
    elif [ $LAST_COMMAND == 2 ]; then
      PS1+="Missing keyword, command, or permission problem"
    elif [ $LAST_COMMAND == 126 ]; then
      PS1+="Permission problem or command is not an executable"
    elif [ $LAST_COMMAND == 127 ]; then
      PS1+="Command not found"
    elif [ $LAST_COMMAND == 128 ]; then
      PS1+="Invalid argument to exit"
    elif [ $LAST_COMMAND == 129 ]; then
      PS1+="Fatal error signal 1"
    elif [ $LAST_COMMAND == 130 ]; then
      PS1+="Script terminated by Control-C"
    elif [ $LAST_COMMAND == 131 ]; then
      PS1+="Fatal error signal 3"
    elif [ $LAST_COMMAND == 132 ]; then
      PS1+="Fatal error signal 4"
    elif [ $LAST_COMMAND == 133 ]; then
      PS1+="Fatal error signal 5"
    elif [ $LAST_COMMAND == 134 ]; then
      PS1+="Fatal error signal 6"
    elif [ $LAST_COMMAND == 135 ]; then
      PS1+="Fatal error signal 7"
    elif [ $LAST_COMMAND == 136 ]; then
      PS1+="Fatal error signal 8"
    elif [ $LAST_COMMAND == 137 ]; then
      PS1+="Fatal error signal 9"
    elif [ $LAST_COMMAND -gt 255 ]; then
      PS1+="Exit status out of range"
    else
      PS1+="Unknown error code"
    fi
    PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
  else
    PS1=""
  fi

  # User and server
  local SSH_IP=$(echo $SSH_CLIENT | awk '{ print $1 }')
  local SSH2_IP=$(echo $SSH2_CLIENT | awk '{ print $1 }')
  if [ $SSH2_IP ] || [ $SSH_IP ]; then
    PS1+="\[${RED}\]\u@\h"
  else
    PS1+="\[${RED}\]\u"
  fi

  # Current directory
  PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${GREEN}\]❯"

  # Skip to the next line
  PS1+="\n"

  if [[ $EUID -ne 0 ]]; then
    PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
  else
    PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
  fi

  # PS2 is used to continue a command using the \ character
  PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

  # PS3 is used to enter a number choice in a script
  PS3='Please enter a number from above list: '

  # PS4 is used for tracing a script in debug mode
  PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'
