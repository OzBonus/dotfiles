echo "This will install the latest version of Miniconda3 for x86_64 Linux."
wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh


# Fixes for WSL
# https://github.com/Microsoft/BashOnWindows/issues/185#issuecomment-238470680
sudo pip uninstall pyzmq
sudo add-apt-repository ppa:aseering/wsl
sudo apt-get update
sudo apt-get install libzmq3 libzmq3-dev
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
sudo pip install --no-use-wheel -v pyzmq
sudo pip install jupyter
