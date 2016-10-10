#!/bin/bash

PACKAGES="git \
          htop \
          toilet \
          cowsay \
          tesseract-ocr \
          imagemagick \
          textlive-latex-base \
          libav-tools \
          mc \
          ruby-ful \
          python3-pip"
ALREADY_INSTALLED=""
NOT_INSTALLED=""
GUI_FOR_WSL=""

sudo apt-get update
sudo apt-get upgrade

# Install packages if they are not already installed.
for P in $PACKAGES
do
    # Check non-existence with type, and dump result text to /dev/null.
    if ! type $P >/dev/null 2>&1
    then
        # Add to list of installed packages.
        NOT_INSTALLED="$NOT_INSTALLED $P"
        # Install a package that is not already installed.
        sudo apt-get install -y $P
    else
        # Add to list of already installed packages.
        ALREADY_INSTALLED="$ALREADY_INSTALLED $P"
    fi
done

# Add GUI app support to WSL.
if ! grep "DISPLAY=:0" ~/.bashrc
then
    echo "DISPLAY=:0" >> ~/.bashrc
    GUI_FOR_WSL="GUI app support has been added to bashrc."
else
    GUI_FOR_WSL="GUI app support was already added to bashrc."
fi

# Symlink vimrc from repository to home directory.
ln -s ~/toolbox/config/.vimrc ~/.vimrc

echo ""
echo "SUMMARY"
echo ""
echo "These packages were already installed:"
echo $ALREADY_INSTALLED | sed 's/^/  /'
echo ""
echo "These packages were installed:"
echo $NOT_INSTALLED | sed 's/^/  /'
echo ""
echo $GUI_FOR_WSL
echo ""
