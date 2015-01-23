# MySQL

## Install

```
sudo pacman -S mysql
```

## Start

MySQL Daemon starten und root passwort ändern

```
sudo systemctl start mysqld
sudo systemctl enable mysqld

sudo mysqladmin -u root password 'yourpw'
```

Du kannst auch mysql secure installation durchlaufen lassen
um testuser und testdatenbank zu löschen.

```
mysql_secure_installation
```

## Aktivieren (für PHP)

gehe in /etc/php/php.ini und kommentiere ";extension=mysqli.so" ein. Also ändere

```
    ;extension=mysqli.so
```

zu

```
    extension=mysqli.so
```

und starte den httpd Daemon neu, mit

```
sudo systemctl restart httpd
```
