
## See "Basic Unprivilaged Usage"
[https://ubuntu.com/server/docs/containers-lxc](https://ubuntu.com/server/docs/containers-lxc)

`mkdir -p ~/.config/lxc`

`nano ~/.config/lxc/default.conf`

```
lxc.idmap = u 0 100000 65536
lxc.idmap = g 0 100000 65536
lxc.net.0.type = veth
lxc.net.0.link = lxcbr0
```

`echo "$USER veth lxcbr0 2" | sudo tee -a /etc/lxc/lxc-usernet`

`lxc-create -t download -n u1 -- -d ubuntu -r jammy -a amd64`

Where "jammy" is the current distro codename

It downloads stuff, unpacks the rootfs

[https://linuxcontainers.org/lxc/getting-started/](https://linuxcontainers.org/lxc/getting-started/)

`systemd-run --unit=my-unit --user --scope -p "Delegate=yes" -- lxc-create -t download -n my-container`

set username/password

`lxc-attach -n my-container`

`systemd-run --unit=my-unit --user --scope -p "Delegate=yes" -- lxc-start my-container -F`

Issue with home directory not having permission:

https://discuss.linuxcontainers.org/t/unprivileged-container-not-starting/15154/3

to stop lxc container

`lcx-stop my-container`


## mediawiki installation

`apt install apache2`

`apt install mariadb-server`

`mysql_secure_installation`

### setup table for mediawiki

[https://www.mediawiki.org/wiki/Manual:Installing_MediaWiki#MariaDB/MySQL](https://www.mediawiki.org/wiki/Manual:Installing_MediaWiki#MariaDB/MySQL)

`mysql`

```
CREATE DATABASE mediawiki;
CREATE USER 'mediawiki'@'localhost' IDENTIFIED BY 'database_password';
GRANT ALL PRIVILEGES ON mediawiki.* TO 'mediawiki'@'localhost' WITH GRANT OPTION;
```

[SECRET] 'birdseatmysunflowersandmywatermellonistiny'


### get mediawiki
`apt install git`

`cd /var/www/html`

`git clone https://gerrit.wikimedia.org/r/mediawiki/core.git --branch REL1_40 mediawiki --depth=1`

`git submodule update --init --recursive`

`sudo apt install composer`

`apt install apache2 mariadb-server php php-mysql libapache2-mod-php php-xml php-mbstring`

`apt install php-apcu php-intl imagemagick inkscape php-cli php-curl`

`systemctl restart apache2` or `service apache2 reload`

`apt install openssh-server`

`ssh-keygen` (maybe this is optional, and you can just create the .ssh folder)

set password authentication to `no`

`vi /etc/ssh/sshd_config`

https://linuxhandbook.com/add-ssh-public-key-to-server/

vi `/root/.ssh/authorized_keys`

add your public key

`chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys`

`systemctl restart sshd.service`

i went through setup...

drop database and restore from backup
https://www.mediawiki.org/wiki/Manual:Restoring_a_wiki_from_backup

`mysqladmin -u root -p drop mediawiki`

`mysqladmin -u root -p create mediawiki`

`mysql -u root -p mediawiki < dump_of_wikidb.sql`

