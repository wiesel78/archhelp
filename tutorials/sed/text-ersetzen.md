# SED

### Text ersetzen

angenommen man bekommt einen html input und möchte die Umlaute ä, ö und ü
gegen die html aquivalente umschreiben

```
sed -e "s/ö/\&ouml\;/g" -e "s/ä/\&auml\;/g" -e "s/ü/\&uuml;/g" protokoll.html
```

### Text in Datei ersetzen

möchte man Text in einer Datei ersetzen, kann man die option -i benutzen

```
sed -e "s/suchtext/ersatztext/g" -i textdatei.txt
```

