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

Now, we need to transfer files (e.g. database backup and LocalSettings.php) to the system

I used ssh (sshfs) for this