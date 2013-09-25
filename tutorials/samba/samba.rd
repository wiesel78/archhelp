# samba installieren

sudo pacman -S samba

# benutzer zu samba hinzufuegen

sudo smbpasswd -a benutzer

# minimal konfiguration in /etc/samba/smb.conf

[global]
   workgroup = WORKGROUP

   netbios name = stalin
   server string = Samba Server

   security = user


[downloads]
    path = /home/wiesel/Downloads
    comment = downloads
    public = yes
    guest ok = yes
    read only = yes
    browseable = yes

# daemonen starten (in der reihenfolge)
sudo systemctl start nmbd.service
sudo systemctl start smbd.service

# daemonen dauerhaft aktivieren
sudo systemctl enable nmbd.service
sudo systemctl enable smbd.service

# nach verfuegbaren freigaben sehen
smbclient -L server

# zu einer freigabe verbinden
smbclient //server/freigabe

