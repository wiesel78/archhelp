# Arbeit mit den Keyservern

## Keyserver

Keyserver synchronisieren sich untereinander. Hier sind mögliche Adressen.

```
https://pgp.mit.edu/
https://keys.gnupg.net/
```

## Schlüssel hochladen

Um einen öffentlichen Schlüssel hochzuladen

```
gpg --send-key <SchlüsselID>
```

## Schlüssel suchen

Um einen öffentlichen Schlüssel auf dem Keyserver zu suchen

```
gpg --search-keys "Vorname Nachname"
```

## Schlüssel herunterladen

Um einen öffentlichen Schlüssel herunterzuladen

```
gpg --recv-keys <SchlüsselID>
```

## Schlüssel aktualisieren

Um einen Schlüssel auf den neuesten Stand zu bringen

```
gpg --refresh-keys <SchlüsselID>
```
