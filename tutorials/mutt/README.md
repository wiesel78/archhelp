# Mutt (E-Mail client fuer die shell)

## Installieren

``` 
    sudo pacman -Syu mutt 
```

## Konfiguration

Die Konfigurationsdatei kann unter anderem .muttrc im HOME-Ordner sein. 
Eine Beispielkonfiguration liegt in diesem Ordner.

## Starten

```
    mutt
```

der rest ergibt sich aus der oberflaeche

## Mutt per Kommandozeile

>Empfaenger  : mustermann@gmail.com  
>Text        : text.txt  
>Anhang      : -a anhang.txt  
>Betreff     : -s "Betreff der TestMail"  

```
    cat text.txt | mutt mustermann@gmail.com -s "Betreff der TestMail" -a anhang.txt  
```

## Verschluesselte Nachricht

```
    gpg -aesr mustermann@gmail.com textdatei
```

Es so etwas wie textdatei.asc raus.  

Jetzt so wie oben per mutt verschicken

```
    cat textdatei.asc | mutt mustermann@gmail.com -s "betreff"
```
  
und in einem Rutsch

```
    cat text.txt | gpg -aesr mustermann@gmail.com | mutt mustermann@.gmail.com -s "betreff"
```
