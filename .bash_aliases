
# ls aliases
alias ls='ls --color="auto" --group-directories-first'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# For when ntfs-3g crashes
alias remount='sudo umount /media/Windows;sudo mount -t ntfs-3g /dev/sda1 /media/Windows'

# Load backburnerdev server as a local dir
alias loadserver='sshfs -o idmap=user kevinmar@backburnerdev.co.uk:/home/kevinmar/public_html bbd-server/'

# Add an "alert" alias for long running commands. Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'