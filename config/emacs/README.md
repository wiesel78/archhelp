# Emacs

Provided with:
..[Prelude](http://batsov.com/prelude/) ,
..[God-Mode](https://github.com/chrisdone/god-mode)
..[Dark-Blue Theme](https://github.com/emacs-jp/replace-colorthemes/blob/master/dark-blue-theme.el)
and some other configurations. Check `personel/`

## Usage

`make fresh-client` Installs Prelude on a new client.
`make to-client` Copies this configuration to `~/.emacs.d/personal/`

If you're using systemd as init system you can use the `emacs@service` file to load emacs
within your system boot. This file goes to `/usr/lib/systemd/system`. After that 
you can [enable|start] it with `systemctl [enable|start] emacs@<username>`.

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
