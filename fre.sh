#!/bin/bash
# Ridiculous comment test.
clear
VAR1="cheese"
VAR2="crackers"
echo $VAR1 $VAR2
NUM_A=99
NUM_B=100
if [ NUM_A = 100 ]
	then
		echo "NUM_A is equal to 100"
else
	echo "NUM_A is not equal to 100"
fi
FOOEY=(
	"foo"
	"bar"
	"foobar"
	"barfoo"
)
echo ${FOOEY[@]}
TESTY=()
echo ${TESTY[@]}
TESTY=("${TESTY[@]}" "a" "b" "c" "d")
echo ${TESTY[@]}
TESTY=("${TESTY[@]}" "1" "2" "3" "4")
echo ${TESTY[@]}
echo -e "\nAdd some animal names to TESTY?"
while true; do
	read -p "What is your decision? (y/n) >> " YN
	case $YN in
		[Yy]* ) TESTY=("${TESTY[@]}" "mouse" "manatee" "fox"); break;;
		[Nn]* ) break;;
	esac
done
echo ${TESTY[@]}

TODO_REPOS=()
TODO_PACKS=()


# This script will install the repositories and packages necessary to get my
# machine back to the condition where I can meet my work and leisure goals.
# Each piece of software will be installed if after an affirmative response to a
# yes/no prompt.

# Ideally, I would like the script to create a list of repositories and
# packages, and add/install them all at once, after having gone through all of
# the prompts. Since I don't really know what I am doing with Bash, however, I
# guess I will just have to install each set of repositories and packages after
# their respective prompts.

# Install htop.
echo -e "\nWould you like to install htop?"
while true; do
	read -p "Enter your decision. (y/n) >> " YN
	case $YN in
		[Yy]* ) sudo apt-get install htop; break;;
		[Nn]* ) break;;
	esac
done

# Install Midnight Commander.
echo -e "\nWould you like to install Midnight Commander?"
while true; do
	read -p "Enter your decision. (y/n) >> " YN
	case $YN in
		[Yy]* ) sudo apt-get -y install mc; break;;
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
