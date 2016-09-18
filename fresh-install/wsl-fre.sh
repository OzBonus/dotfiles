#!/bin/bash

PACKAGES="git \
          top \
          toilet \
          cowsay \
          tesseract-ocr \
          imagemagick \
          textlive-latex-base \
          python-pip"
ALREADY_INSTALLED=""
NOT_INSTALLED=""
GUI_FOR_WSL=""

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

# Add virtual environment support to Python 3.
# For help, see http://docs.python-guide.org/en/latest/dev/virtualenvs/
sudo pip install virtualenv
sudo pip install virtualenvwrapper
if ! grep "export WORKON_HOME=$HOME/.virtualenvs" ~/.bashrc
then
    echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
    echo "export PROJECT_HOME=$HOME/Devel" >> ~/.bashrc
    source /usr/local/bin/virtualenvwrapper.sh
fi

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

