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
# Update the version as needed.
pyenv install anaconda3-5.1.0

# Activate Anaconda.
pyenv activate anaconda3-5.1.0

# Enable password login.
jupyter notebook password

# Enable SSL.
mkdir -p ~/.jupyter/keys
cd ~/.jupyter/keys
openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout mykey.key -out mycert.pem
cd ~/

# Install nvm and Node.js.
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | PROFILE=~/.bash_profile bash
# source ~/.bash_profile
# nvm install -lts

# Set Jupyter configuration options.
# Lines will be appended to the end of the file.
# ubuntu is the default user for Lightsail Ubuntu installations.
jupyter notebook --generate-config
cat <<'END' >> ~/.jupyter/jupyter_notebook_config.py
c.NotebookApp.open_browser = True
c.NotebookApp.ip = '*'
c.NotebookApp.keyfile = '/home/ubuntu/.jupyter/keys/mykey.key'
c.NotebookApp.certfile = '/home/ubuntu/.jupyter/keys/mycert.pem'
END

# Create a startup script and make it executable.
cat <<'END' >> ~/jupyterlab.sh
#!/bin/bash
# eval "$(pyenv init -)"
pyenv activate anaconda3-5.1.0
cd ~/
jupyter lab
END
chmod +x ~/jupyterlab.sh

# Run Jupyterlab as a service.
mkdir -p ~/.config/systemd/user/
cat <<'END' >> ~/.config/systemd/user/jupyterlab.service
[Unit]
Description=Service to run Jupyterlab is user space

[Service]
ExecStart=/bin/bash -c "source ~/.bash_profile; eval ~/jupyterlab.sh"

[Install]
WantedBy=default.target
END
systemctl --user enable jupyterlab.service

# Finish.
echo "The installation script has finished."
