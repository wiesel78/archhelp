# Markdown

### Markdown in PDF umwandeln

um Markdown in PDF umzuwandeln installiere wkhtmltopdf

```
pacman -S wkhtmltopdf
```

Markdown wirft html raus

```
markdown protokoll.md > source.html
```

Um Deutsche umlaute zu ersetzen

```
markdown protokoll.md | sed -e "s/ä/\&auml\;/g" -e "s/ö/\&ouml\;/g" -e "s/ü/\&uuml\;/g" > protokoll.html
```

Um die Ausgabe in eine PDF umzuwandeln

```
wkhtmltopdf protokoll.html protokoll.pdf
```

