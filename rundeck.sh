#!/bin/bash
KEY=$1
sudo rpm -Uvh https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
sudo yum -y install blobfuse

sudo mkdir /mnt/resource/blobfusetmp -p
sudo chown ctc-admin:ctc-admin /mnt/resource/blobfusetmp
touch /home/ctc-admin/fuse_connection.cfg
echo "accountName ctcrndckst
accountKey ${KEY}
containerName rundeck" > /home/ctc-admin/fuse_connection.cfg

chmod 600 ~/fuse_connection.cfg
mkdir /home/ctc-admin/rundeck #create directory /home/ctc-admin/rundeck

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible
sudo dnf -y install git

ansible --version

echo "Done"
