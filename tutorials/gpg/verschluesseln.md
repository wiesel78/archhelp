# Verschlüsseln und Entschlüsseln mit GPG

## Verschlüsseln

Um eine Datei mit dem öffentlichen Schlüssel des Empfängers zu verschlüsseln

```
gpg -aer <public-key> <file>
```

Der verschlüsselt Inhalt steht nun in file.asc

## Entschlüsseln

Um diese Datei wieder zu entschlüsseln benötigt man den privaten Schlüssel
passend zum öffentlichen Schlüssel mit dem die Datei verschlüsselt wurde.
Der Befehl :

```
gpg -d file.asc
```

fragt gegebenen falls nach der Passphrase und gibt den entschlüsselten Inhalt
auf der Konsole aus. Mit der Option -o kann man eine Ausgabedatei bestimmen.

```
gpg -d file.asc -o decrypted-file.txt
```
