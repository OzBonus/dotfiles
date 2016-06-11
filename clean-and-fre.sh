# A much less fancy, but more useable form of necromancy.

sudo apt-get -y update
sudo apt-get -y upgrade

# Install basic apps.
sudo apt-get -y install \
	htop \
	mc \
	vim-gnome \
	textlive-latex-base \
	figlet \
	curl \
	ruby-full \
	dmenu \
	feh

# Install i3-gaps.
sudo apt-get install -y \
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

# Install miniconda.
curl -o ~/miniconda.sh --silent --show-error --retry 5 https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/miniconda.sh

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3
export PATH="$HOME/miniconda3/bin:$PATH"

# Create symlinks.
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/i3/config ~/.config/i3/config
