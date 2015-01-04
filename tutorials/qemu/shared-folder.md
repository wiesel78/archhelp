# Gemeinsamer Ordner zwischen Wirt und Gast System

## Installiere Samba im Wirt System

```
    pacman -S samba
```

## Lege eine Samba Freigabe für Qemu an 

Du musst festlegen welchen Ordner vom Wirt System im Gast System zu sehen sein soll. Um einen leeren Ordner als gemeinsame Freigabe zu erstellen.

```
    mkdir ~/shared
```

erstelle in der /etc/samba/smb.conf einen Eintrag für dieses Ordner

```
[qemu]
    comment = shared folder
    path = /home/yourhomefolder/shared
    readonly = no
    public = yes
    writeable = yes
    browseable = yes
```

## 
