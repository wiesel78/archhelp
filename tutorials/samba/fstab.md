## Freigabe beim Systemstart einbinden

Eine möglichkeit eine Samba-Freigabe beim Systemstart einzubinden ist es, einen Eintrag in die /etc/fstab vorzunehmen.  
Damit die Zugangsdaten für die Freigabe nicht für jeden lesbar in der fstab liegen, sollte man in seinem homeverzeichnis eine Datei z.B. ~/.smbcredent erstellen und die Zugangsdaten hineinschreiben.

  
~/.smbcredent
```
username=youruser
password=yourpassword
```
  
danach noch die sichtbarkeit dieser Datei eingrenzen :
  
```
    chmod 600 ~/.smbcredent
```
  
nun zu dem fstab Eintrag. Einfach folgende Zeile anpassen und zu deiner fstab hinzufügen.  

```
# //server/freigabe 
//server-name-oder-ip/freigabename /destination/folder cifs credentials=/home/yourusername/.smbcredent,uid=yourusername,gid=users,nofail,comment=x-systemd.automount,comment=x-systemd.device-timeout=90 0 0
```
  
Als erstes gibst du die Freigabe an.  
Danach folgt der Zielordner auf deinem Rechner.  
Dann folgen die Optionen. credentials gibt die Datei an in der die Zugangsinformationen stehen. uid und gid geben den Benutzernamen und den Gruppennamen an unter deren Rechte die Freigabe in das System eingehangen werden soll.  

