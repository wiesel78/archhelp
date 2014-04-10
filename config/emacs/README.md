# Emacs

Ausgestattet mit
..[Prelude](http://batsov.com/prelude/) ,
..[better-defaults](https://github.com/technomancy/better-defaults),
..[solarized-theme](https://github.com/sellout/emacs-color-theme-solarized)
und einigen Erweiterungen.

## Usage

`make fresh-client` Installiert Prelude auf einem neuen Client
`make to-client` Kopiert Konfiguration auf einen Client

Wenn ihr systemd als Initsystem einsetzt, dann könnt ihr mit der File `emacs@service`
Emacs beim Systemstart mit starten lassen. Die File wird nach `/usr/lib/systemd/system` kopiert und
mit `systemctl [enable|start] emacs@<username>` gestartet.

Erweiterungen
* `web-mode, lua-mode, autocomplete, sr-speedbar ` sind als Zusatzmodule definiert (`autocomplete` ist deaktiviert)
* `C-x C-v` - öffne Datei mit sudo
* Zeilennummern aktiviert
* `Shift - ArrowKeys` - zum Wechseln der Fenster
* Cut and Paste aktiviert
* UTF-8 als Standard Encoding
* `C-c n` - Räumt den aktuellen Buffer auf (Whitespaces und Tabs)
* smex aktiviert
* `M-i` - Go to symbol
* `C-x C-t` - Insert Timestamp
* `C-x k` - Kill current buffer
* `C-c b` - sr-speedbar-toogle
* `C-q` - auto-complete trigger
