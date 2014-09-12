# apache, php und mysql installieren

```
    sudo pacman -S apache php php-apache mysql
```
  
# mysql daemon starten und root passwort ändern

```
    sudo systemctl start mysqld
    sudo systemctl enable mysqld

    sudo mysqladmin -u root password 'yourpw'
```

# Du kannst auch mysql secure installation durchlaufen lassen
# um testuser und testdatenbank zu löschen

```
    mysql_secure_installation
```
  
# schreibe /src/http/index.html

```
    sudo echo "<b>hallo welt</b>" > /srv/http/index.html
```

# starte httpd

```
    sudo systemctl start httpd
    sudo systemctl enable httpd
```




