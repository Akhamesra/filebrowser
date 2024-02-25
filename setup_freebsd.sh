pkg install -y sudo curl bash rsync

pw useradd -n diseno -e '' -m -s /bin/sh -L default -h 0 -c "ravipratap" -G wheel #creating a user named diseno
mkdir -p /home/diseno/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDwdUhp++5VBzRb+11vsbK2xvtxto+BS2zW6ZgNxnhZw3y091Pwysvb+pqzhTm0SVCMGzicugEy6aiH6AjpcG6itv940JSLgUvJswznF3LPgjw8QVbzKhJ3EFOdU0SEetG6eomFXpGgpFtgQaqDfdndZD1LA+0A7OPVzr95w9QuY+CcMU0IiHh1pnc3deokcqwr/AFvPI81d7885Frk5UaVRxFjs8NPcwZ0kOT5DaVEAWU92awFrVsIjOnPuk7ebT5ZTf9BGzc6Cys9jdl+hNbxurDoOpwQ/2odwRnFOluw28kTF5F5H4IO/t0mgrL7xrFDbTS2Q2nZKK1cssqg+bGrlqvJxMNpBP2zy1tqn91zbUWRdWnqgftV5zgR+fSrOW5UiQdlXGgFv21tAwz8WsrMNrI5jacFTkDYyjhlOcK02kNs0PnG7fsUMAvCHeCaelIhqbb90CYa5qKeJP1Qi3Rc6Vj+EnYn3Id6nJTsWrqcvI+dRmscTlT64bGqj0oMeFM= akshitkhamesra@L-LXFPLQL5QN.local" >> /home/diseno/.ssh/id_rsa.pub

chown diseno:diseno /home/diseno/.ssh/
chown diseno:diseno /home/diseno/.ssh/id_rsa.pub

curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
filebrowser config set --branding.name "DISEÑO" --branding.disableExternal -a 0.0.0.0 -p 80
filebrowser -r /home/diseno/backup -a 0.0.0.0 -p 80

cd /usr/local/etc/rc.d
echo "filebrowser -r /home/diseno/backup -a 0.0.0.0 -p 80" >> filebrowser.sh
chmod 0755 filebrowser.sh

# rsync -havzPe "ssh -i /path/to/id_rsa" /path/to/backup/folder/ diseno@static_ip
