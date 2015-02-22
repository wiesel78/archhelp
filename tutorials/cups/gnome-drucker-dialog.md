## Cups

### Gnome Control Panel

Will man über den Gnome Dialog für Drucker einen Drucker hinzufügen
sollte man seinen Benutzer der Gruppe sys hinzufügen

```
usermod -aG sys "Benutzername"
```

nun sollte man noch das Paket
> system-config-printer

installieren.

```
sudo pacman -S system-config-printer
```

Ab jetzt sollte man über den Gnome Drucker Dialog Drucker verwalten können
ohne dass ständig die meldung kommt "Drucker konnte nicht hinzugefügt werden".
