# Apache

## Install

Apache installieren mit :

```
    sudo pacman -S apache
```

## Starten

schreibe /src/http/index.html

```
sudo echo "<b>hallo welt</b>" > /srv/http/index.html
```

starte httpd

```
sudo systemctl start httpd
sudo systemctl enable httpd
```
