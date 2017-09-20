# ls aliases
alias ls='ls --color="auto" --group-directories-first'
alias ll='ls -alFh'
alias la='ls -A'

# Add an "alert" alias for long running commands. Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Clipboard
alias c='xclip -selection clipboard'
alias p='xclip -o -selection clipboard'

# Get tmux and vim to play nicely
alias tmux='TERM=screen-256color tmux'

# Quick mercurial update
alias hglog='hg glog -l 12'
