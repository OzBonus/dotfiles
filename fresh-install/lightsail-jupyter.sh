#!/bin/bash

if [[ $EUID -ne 0  ]]; then
  echo "Please run this script as root."
  exit 1
fi

# This is the version of Anaconda that you want.
ANACONDA="anaconda3-5.1.0"

# Download and install pyenv.
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# Initialize pyenv at login.
cat <<'END' >> ~/.bash_profile
export "PATH=~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
END

# Reload and update pyenv.
source ~/.bash_profile
pyenv update

# Install Anaconda's distribution of Python 3.
pyenv install $ANACONDA

# Activate Anaconda.
pyenv activate $ANACONDA

# Enable password login.
jupyter notebook --generate-config
jupyter notebook password

# Enable SSL.
mkdir -p ~/.jupyter/keys
cd ~/.jupyter/keys
openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout mykey.key -out mycert.pem
cd ~/

# Install nvm and Node.js.
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | PROFILE=~/.bash_profile bash
source ~/.bash_profile
nvm install --lts

# Set Jupyter configuration options.
# Lines will be appended to the end of the file.
pyenv activate $ANACONDA
cat <<END >> ~/.jupyter/jupyter_notebook_config.py
c.NotebookApp.open_browser = False
c.NotebookApp.ip = '*'
c.NotebookApp.keyfile = '/home/$SUDO_USER/.jupyter/keys/mykey.key'
c.NotebookApp.certfile = '/home/$SUDO_USER/.jupyter/keys/mycert.pem'
END
pyenv deactivate


# -- Everything above this line works as intended. ----------------------------------------------->8


# Create a startup script and make it executable.
cat <<END >> ~/jupyterlab.sh
#!/bin/bash
. ~/.bash_profile
pyenv activate $ANACONDA
cd ~/
jupyter lab
END
chmod +x ~/jupyterlab.sh

# Run Jupyterlab as a service.
sudo mkdir -p /usr/lib/systemd/system/
cat <<END >> /usr/lib/systemd/system/jupyterlab.service
[Unit]
Description=Service to run Jupyterlab at startup

[Service]
Type=simple
PIDFile=/var/run/jupyterlab.pid
ExecStart=/bin/bash /home/$SUDO_USER/jupyterlab.sh
User=$SUDO_USER
Group=$SUDO_USER
WorkingDirectory=/home/$SUDO_USER

[Install]
WantedBy=default.target
END
sudo systemctl daemon-reload
sudo systemctl enable jupyterlab.service
sudo systemctl start jupyterlab.service

# Finish.
echo "The installation script has finished."
