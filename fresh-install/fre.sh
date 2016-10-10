#!/bin/bash
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4


clear


TODO_REPOS=()
TODO_PACKS=()


# Confirmation function only for regular packages.
function confirmation() {
    while true
    do
        read -p "Enter your decision. (y/n) >> " YN
        case $YN in
            [Yy]* ) TODO_REPOS=("${TODO_REPOS[@]}" "${REPOS[@]}")
                    TODO_PACKS=("${TODO_PACKS[@]}" "${PACKS[@]}")
                    break;;
            [Nn]* ) break;;
        esac
    done
}


echo "Let's begin by installing some regular packages."


# Install Midnight Commander.
REPOS=()
PACKS=("mc")
echo -e "\nWould you like to install Midnight Commander?"
confirmation


# Install htop.
REPOS=()
PACKS=("htop")
echo -e "\nWould you like to install htop?"
confirmation


# Install Vim.
REPOS=()
PACKS=("vim-gnome")
echo -e "\nWould you like to install vim-gnome?"
confirmation


# Install SciPy.
# REPOS=()
# PACKS=("python-numpy" "python-scipy" "python-matplotlib" "ipython" "ipython-notebook" "python-pandas" "python-sympy" "python-nose")
# echo -e "\nWould you like to install SciPy?"
# confirmation


# Install Latex.
REPOS=()
PACKS=("texlive-latex-base")
echo -e "\nWould you like to install Latex?"
confirmation


# Install Kodi.
REPOS=("ppa:team-xbmc/ppa")
PACKS=("software-properties-common" "kodi")
echo -e "\nWould you like to install Kodi?"
confirmation


echo -e "\nYou are about the following repositories and packages:"


# Because local variables are only allowed in functions. WTF?
function todo_list() {
local count=1
echo -e "\n# REPOSITORIES ################"
for repo in ${TODO_REPOS[@]}
do
    echo $count $repo
    ((count++))
done
local count=1
echo -e "\n# PACKAGES ####################"
for repo in ${TODO_PACKS[@]}
do
    echo $count $repo
    ((count++))
done
}
todo_list


echo
while true
do
    read -p "Enter your decision (y/n) >> " YN
    case $YN in
        [Yy]* ) sudo add-apt-repository -y ${TODO_REPOS[@]}
                sudo apt-get update
                sudo apt-get -y install ${TODO_PACKS[@]}
                break;;
        [Nn]* ) break;;
    esac
done


echo -e "\nNow for some other stuff. You'll need git installed for some of it."


# Install Vundle.
while true
do
    echo
    read -p "Install Vundle? (y/n) >> " YN
    case $YN in
        [Yy]* ) git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
                break;;
        [Nn]* ) break;;
    esac
done


# Install Powerline fonts.
while true
do
    echo
    read -p "Install Powerline fonts? (y/n) >> " YN
    case $YN in
        [Yy]* ) git clone https://github.com/powerline/fonts.git ~/powerline-fonts
                cd ~/powerline-fonts
                ./install.sh
                cd ~/
                rm -rf ~/powerline-fonts
                break;;
        [Nn]* ) break;;
    esac
done


# Install miniconda.
while true
do
    echo
    read -p "Install miniconda and avoid tiresome Python bullshit? (y/n) >> " YN
    case $YN in
        [Yy]* ) curl -o ~/miniconda.sh --silent --show-error --retry 5 https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
                bash ~/miniconda.sh
                break;;
        [Nn]* ) break;;
    esac
done


# Install pip, virtualenv, and virtualenvwrapper.
# while true
# do
#     echo
#     read -p "Install pip, virtualenv, and virtualenvwrapper? (y/n) >> " YN
#     case $YN in
#         [Yy]* ) curl -o ~/get-pip.py --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py
#                 sudo python ~/get-pip.py
#                 sudo pip install virtualenv
#                 sudo pip install virtualenvwrapper
#                 if ! grep "WORKON_HOME=~/Envs" ~/.bashrc     # Check if venvwrapper is already set up.
#                 then
#                     echo "WORKON_HOME=~/Envs" >> ~/.bashrc   # Set up venvwrapper if need be.
#                 fi
#                 source /usr/local/bin/virtualenvwrapper.sh # Activate venvwrapper.
#                 break;;
#         [Nn]* ) break;;
#     esac
# done


# Set terminal to 256 colors.
while true
do
    echo
    read -p "Want 256 color support for x-term? (y/n) >> " YN
    case $YN in
        [Yy]* ) if grep "TERM=xterm-256color" ~/.bashrc
                then
                    echo "That's already set, dude."
                else
                    echo "TERM=xterm-256color" >> ~/.bashrc
                fi
                break;;
        [Nn]* ) break;;
    esac
done


# Set short directory location.
while true
do
    echo
    read -p "Want to shorten the command priompt? (y/n) >> " YN
    case $YN in
        [Yy]* ) if grep "PROMPT_DIRTRIM=2" ~/.bashrc
                then
                    echo "Already there. There's no need to do that twice."
                else
                    echo "PROMPT_DIRTRIM=2" >> ~/.bashrc
                fi
                break;;
        [Nn]* ) break;;
    esac
done


# In i3-gaps and RICE THAT BITCH!
while true
do
    echo
    read -p "Want to install the Airblader branch of i3 with gaps, dmenu, and feh? (y/n) >> " YN
    case $YN in
        [Yy]* ) sudo apt-get install -y \
                libxcb1-dev \
                libxcb-keysyms1-dev \
                libpango1.0-dev \
                libxcb-util0-dev \
                libxcb-icccm4-dev \
                libyajl-dev \
                libstartup-notification0-dev \
                libxcb-randr0-dev \
                libev-dev \
                libxcb-cursor-dev \
                libxcb-xinerama0-dev \
                libxcb-xkb-dev \
                libxkbcommon-dev \
                libxkbcommon-x11-dev
                git clone https://www.github.com/Airblader/i3 ~/i3-gaps
                cd ~/i3-gaps
                git checkout gaps && git pull
                make
                sudo make install
                cd
                sudo apt-get install dmenu feh -y
                break;;
        [Nn]* ) break;;
    esac
done


echo "Asian language input must be set up manually and painfully with fcitx."


exit 0
