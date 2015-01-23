# Signieren und verifizieren mit GPG

## Signatur erstellen

Um eine Datei mit dem privaten Schlüssel zu signieren.

```
gpg -ab <file>
```

die Signatur steht in der Datei file.asc. Um die Signatur der Datei
anzufügen kann man neben der manuellen variante auch folgenden Befehl verwenden.

```
gpg --clearsign -a <file>
```

## Verifizieren

Um eine Signatur zu prüfen benötigt man den öffentlichen Schlüssel der Person
die die Signatur erstellt hat. Zum verifizieren dient folgender Befehl.

```
gpg --verify <sig-file> <decrypted-file>
```
