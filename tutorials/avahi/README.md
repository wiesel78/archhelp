# avahi installieren

```
pacman -S avahi nss-mdns
```


# um netzwerknamen der form name.local zu aktivieren
# folgendes in /etc/nsswitch.conf umschreiben

# von

```
hosts: files myhostname dns
```

# zu

```
hosts: files myhostname mdns_minimal [NOTFOUND=return] dns
```

# danach in systemd aktivieren

```
systemctl enable avahi-daemon.service
systemctl restart avahi-daemon.service
```


# falls avahi mit dem fehlerstatus 255 stop
# sollte man in der datei /etc/avahi/avahi-daemon.conf
# folgendes umschreiben

# von 

```
#disallow-other-stacks=no
```

# zu

```
disallow-other-stacks=yes
```

