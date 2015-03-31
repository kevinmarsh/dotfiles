#!/bin/bash

################################################################################
# This script installs the dotfiles into the users home dir
# 1. Backs up existing dotfiles
# 2. Creates symlinks from dotfiles to the home directory
# 3. Creates private .gitconfig and .hgrc files
################################################################################

dotfilesdir=dotfiles
backupdir=$HOME/dotfiles_old


echo "Creating $backupdir for backup of any existing dotfiles in $HOME"
mkdir -p $backupdir

for file in `git ls-tree -r master --name-only`; do
    if [[ "$file" != "README.md" && "$file" != "install.sh" ]]; then
        if [ -e $HOME/$file ]; then
            echo "Moving $file to $backupdir/$file"
            mv $HOME/$file $backupdir/
        fi
        echo "Creating symlink to $file in home directory."
        cp --parents $file $HOME
        ln -sf $HOME/$dotfilesdir/$file $HOME/$file
    fi
done


# Create a .gitconfig.private file if it doesn't exist
privategit=$HOME/.gitconfig.private
if [ ! -f $privategit ]; then
    echo -e "\n\nSetting up $privategit"
    echo -n "What is your email? "
    read gitemail
    echo -n "What is your full name? "
    read gitname

    echo -e "[user]\n\temail = $gitemail\n\tname = $gitname" > $privategit
fi


# Create a .hgrc.private file if it doesn't exist
privatehg=$HOME/.hgrc.private
if [ ! -f $privatehg ]; then
    echo -e "\n\nSetting up $privatehg"

    read -p "Are you using the same name and email address for mercurial as well? (y/n) "
    if [ "$REPLY" == "y" ]
    then
        hgrcemail=$gitemail
        hgrcname=$gitname
    else
        echo -n "What is your email? "
        read hgrcemail
        echo -n "What is your full name? "
        read hgrcname
    fi

    echo -e "[ui]\nusername = $hgrcname <$hgrcemail>" > $privatehg
fi
