# Canon MG5500 installieren

Um den Canon MG5500 zum laufen zu bekommen, sollte man sich
den Treiber übers AUR saugen.

```
yaourt -S canon-pixma-mg5500-complete
```

Evtl. neu starten.  
Wenn der Drucker sich nicht über das CUPS Interface 
oder irgendeine Oberflaeche hinzufuegen laesst, sollte man 
ihn ueber den folgenden Befehl hinzufuegen.

```
sudo lpadmin -p MG5500 -m canonmg5500.ppd -v <printer-address> -E
```

Um an die Printer Adresse zu kommen, folgender Befehl

```
lpinfo -v
```

In meinem Fall, war der vollständige Befehl

```
sudo lpadmin -p MG5500 -m canonmg5500.ppd -v cnijnet:/F4-81-39-8B-20-2A -E
```
