#!/bin/bash

################################################################################
# This script installs the dotfiles into the users home dir
# 1. Backs up existing dotfiles
# 2. Creates symlinks from dotfiles to the home directory
# 3. Creates private .gitconfig and .hgrc files
################################################################################

homedir=~
dotfilesdir=~/dotfiles
backupdir=$homedir/dotfiles_old

# Exclude the readme, git repo and "this" dir names in the files
files=`ls -a $dotfilesdir | grep -Ev 'README.md|install.sh|^\.git$|\.$'`

echo "Creating $backupdir for backup of any existing dotfiles in $homedir"
mkdir -p $backupdir

for file in $files; do
    if [ -e $homedir/$file ]; then
        echo "Moving $file to $backupdir/$file"
        mv $homedir/$file $backupdir/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dotfilesdir/$file $homedir/$file
done


# Create a .gitconfig.private file if it doesn't exist
privategit=$homedir/.gitconfig.private
if [ ! -f $privategit ]; then
    echo -e "\n\nSetting up $privategit"
    echo -n "What is your email? "
    read gitemail
    echo -n "What is your full name? "
    read gitname

    echo -e "[user]\n\temail = $gitemail\n\tname = $gitname" > $privategit
fi


# Create a .hgrc.private file if it doesn't exist
privatehg=$homedir/.hgrc.private
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
