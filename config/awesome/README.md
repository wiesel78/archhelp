## Awesome

Awesome Konfiguration
Benutzung mit
```
 make pull-[henrik|phill] | push-[henrik|phill]
```

#### Henrik
bei mir sollte nach dem ersten Checkout folgende Dinge angepasst werden
..* Im Battery Widget (`rc.lua` Zeile 167) die eigene Battery eintragen (zu finden mit `l /sys/class/power_supply`)
..* Vielleicht muss noch in der `battery.lua` (Zeile 21ff.) die jeweiligen Status Files angepasst werden
..* Der WP_Changer (`rc.lua` (Zeile 53)) muss noch auf einen eigenen Pfad mit Hintergrundbilder gesetzt werden
