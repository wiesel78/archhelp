# GPG-Key Exportieren

## Öffentliche Schlüssel

Um Öffentliche Schlüssel zu exportieren

```
gpg -a --output gpg-key.asc --export <optional Schlüsselname>
```

Schlüsselnamen einfach weglassen um alle Schlüssel zu exportieren.

## Private Schlüssel

Um Private Schlüssel zu exportieren

```
gpg -a --output gpg-secret-key.asc --export-secret-keys <optional Schlüsselname>
```

Schlüsselnamen einfach weglassen um alle Schlüssel zu exportieren.

## Ownertrust Informationen

Um die Vertrauensinformationen zu exportieren

```
gpg --export-ownertrust > gpg-ownertrust.txt
```
