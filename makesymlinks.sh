#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# Thanks to The Smalley Creative Blog
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

########## Variables

DOTDIR=~/dotfiles      # dotfiles directory
OLDDIR=~/dotfiles_old  # old dotfiles backup directory
FILES=".vimrc"         # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DOTDIR directory"
cd $DOTDIR
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks.
for file in $FILES
    do
        echo "Moving any existing dotfiles from ~ to $OLDDIR"
        mv ~/$FILES ~/dotfiles_old/
        echo "Creating symlink to $FILES in home directory."
        ln -s $DOTDIR/$FILES ~/$FILES
    done

# Create symlink for i3-gaps.
ln -s ~/dotfiles/i3/config ~/.config/i3/config
