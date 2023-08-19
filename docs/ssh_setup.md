## Goal: setup SSH access by key only

`apt install openssh-server`

`ssh-keygen` (maybe this is optional, and you can just create the .ssh folder)

### set password authentication to `no`

`vi /etc/ssh/sshd_config`

https://linuxhandbook.com/add-ssh-public-key-to-server/

vi `/root/.ssh/authorized_keys`

### add your public key to authorized keys

`chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys`

### restart ssh service

`systemctl restart sshd.service`

Now, you should be able to use your keypair to ssh into the lxc container