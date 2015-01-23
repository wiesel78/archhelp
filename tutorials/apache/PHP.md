# PHP

## Install

```
sudo pacman -S php php-apache
```

## Konfiguration

Füge folgende Zeile an den Anfang der LoadModule Liste in der Datei  
/etc/httpd/conf/httpd.conf

```
LoadModule php5_module modules/libphp5.so
```

Füge nun noch eine Zeile in die Liste der Include Anweisungen hinzu

```
Include conf/extra/php5_module.conf
```

suche folgenden Eintrag

```
LoadModule mpm_event_module modules/mod_mpm_event.so
```

und ändere ihn zu

```
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
```

gehe zur /etc/php/php.ini und ändere

```
    ;extension=gd.so
```

zu

```
    extension=gd.so
```

Es wird also nur das Semikolon am Anfang entfernt.

## Starten

Damit wir wissen ob PHP läuft erstellen wir eine Testseite unter
/srv/http/test.php mit dem Inhalt

```
<?php
    phpinfo();
?>
```

und starten den Apache Server Daemon neu damit die Änderungen übernommen werden.

```
sudo systemctl restart httpd
```
