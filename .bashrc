# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


################################################################################
# History
################################################################################

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000


################################################################################
# Random
################################################################################

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ensure that vim is the default editor
export EDITOR=/usr/bin/vim


################################################################################
# Color
################################################################################

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi


################################################################################
# Load alias definitions
################################################################################

alias grep='grep --color=auto --exclude=*.{orig,rej,bak,pyc,d,i}'

. ~/.bash_aliases

if [ -f ~/.bash_aliases.private ]; then
    . ~/.bash_aliases.private
fi


################################################################################
# Add paths and any other bash modifications
################################################################################

if [ -f $HOME/bin ]; then
    PATH=$PATH:$HOME/bin
fi


if [ -f ~/dotfiles/.config/fabric-autocompletion.sh ]; then
    source ~/dotfiles/.config/fabric-autocompletion.sh
fi

################################################################################
# asdf
################################################################################

if [ -f $HOME/.asdf/asdf.sh ]; then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi

################################################################################
# Python virtual environments
################################################################################

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    WORKON_HOME=~/.virtualenvs
    # Build the source file for virtualenvwrapper
    source /usr/local/bin/virtualenvwrapper.sh
fi

################################################################################
# Load local or private bashrc overrides
################################################################################
if [ -f ~/.bashrc.private ]; then
    . ~/.bashrc.private
fi

# Created by `pipx` on 2023-01-04 04:18:52
export PATH="$PATH:/home/kevin/.local/bin"
eval "$(register-python-argcomplete pipx)"
