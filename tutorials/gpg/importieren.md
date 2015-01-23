# GPG Importieren

## Private und Öffentliche Schlüssel

Um jede Art von Schlüssel zu importieren

```
gpg --with-fingerprint <keyfile>
```

oder

```
gpg --import <keyfile>
```

## Ownertrust

Um die Vertrauensinformationen zu importieren

```
gpg --import-ownertrust < <ownertrust-file>
```
