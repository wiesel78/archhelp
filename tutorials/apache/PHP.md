# füge 2 zeilen in /etc/httpd/conf/httpd.conf ein
# die erste Zeile an den Anfang der LoadModule liste

```
    LoadModule php5_module modules/libphp5.so
    Include conf/extra/php5_module.conf
```

# ändere

```
    LoadModule mpm_event_module modules/mod_mpm_event.so
```

zu

```
    LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
```
  
# kommentiere die gd.so in der /etc/php/php.ini ein
  
aus
  
```
    ;extension=gd.so
```
  
wird
  
```
    extension=gd.so
```
  

# /srv/http/test.php erstellen

```
    <?php
        phpinfo();
    ?>
```

# apache server neu starten

```
    sudo systemctl restart httpd
```

