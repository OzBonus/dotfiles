#!/bin/bash

# Check for the non-existence of Git.
# Abort is Git is not installed, proceed if it is.
if ! type git >/dev/null 2>&1;
then
    echo >&2 "Git is required, but is not installed. Aborting.";
    exit 1;
fi

# Get the Vundle repository from Github.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Launch Vim and install plugins from vimrc.
vim +PluginInstall +qall
