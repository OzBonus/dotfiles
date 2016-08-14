# apt-get update -y
# apt-get upgrade -y
# For now, be sure to use the 5.0.16 ISO.

apt-get install build-essential module-assistant -y
m-a prepare
read -p
sudo mount /media/cdrom
mount /media/cdrom
sh /media/cdrom/VBoxLinuxAdditions.run
