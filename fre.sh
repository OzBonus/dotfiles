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
REPOS=()
PACKS=("python-numpy" "python-scipy" "python-matplotlib" "ipython" "ipython-notebook" "python-pandas" "python-sympy" "python-nose")
echo -e "\nWould you like to install SciPy?"
confirmation


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


echo -e "\nNow for some other stuff. You'll need git installed for most of it."


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


# Install pip and virtualenv.
while true
do
    echo
    read -p "Install pip and virtualenv? (y/n) >> " YN
    case $YN in
        [Yy]* ) curl -o ~/get-pip.py --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py
                sudo python ~/get-pip.py
                sudo pip install virtualenv
                break;;
        [Nn]* ) break;;
    esac
done


exit 0
