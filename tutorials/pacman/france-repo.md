## Archlinux France Repo

add this to /etc/pacman.conf  
```
[archlinuxfr]
SigLevel = Optional TrustAll
Server = http://repo.archlinux.fr/$arch
```

and do a db refresh  
```
    pacman -Syu
```

