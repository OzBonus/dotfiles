#!/bin/bash


clear


TODO_REPOS=()
TODO_PACKS=()


function confirmation() {
	while true; do
		read -p "Enter your decision. (y/n) >> " YN
		case $YN in
			[Yy]* ) TODO_REPOS=("${TODO_REPOS[@]}" "${REPOS[@]}")
				    TODO_PACKS=("${TODO_PACKS[@]}" "${PACKS[@]}"); break;;
			[Nn]* ) break;;
		esac
	done
}

echo "Let's begin by installing some regular packages."


# Install Midnight Commander.
REPOS=()
PACKS=("mc")
echo
echo "Would you like to install Midnight Commander?"
confirmation


# Install htop.
REPOS=()
PACKS=("htop")
echo
echo "Would you like to install htop?"
confirmation


# Install Kodi.
REPOS=("ppa:team-xbmc/ppa")
PACKS=("software-properties-common" "kodi")
echo
echo "Would you like to install Kodi?"
cinfirmation


echo
echo "Do you want to install the following ${#TODO_PACKS[@]} package(s) and any associated repositories?"


for package in ${TODO_PACKS[@]}
do
	echo $package
done


while true; do
	read -p "Enter your decision (y/n) >> " YN
	case $YN in
		[Yy]* ) sudo add-apt-repository ${TODO_REPOS[@]};
			    sudo apt-get update;
			    sudo apt-get -y install ${TODO_PACKS[@]}; break;;
		[Nn]* ) break;;
	esac
done

# Install vim-gnome

# Install vundle.

# Install Powerline fonts.

# Install Dropbox.

# Install SciPy.

# Install setuptools.

# Install pip.

# Install virtualenv.

# Install Steam.

# Install Kodi Media Player
