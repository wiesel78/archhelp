# Programme installieren

```
sudo pacman -S bluez bluez-libs bluez-utils bluez-firmware
```

## Bluetooth starten

```
sudo systemctl start bluetooth
```

evtl. muss man noch nachsehen ob das BT gerät blockiert ist

```
rfkill list
```

falls es blockiert ist, 

```
sudo rfkill unblock <rfkill-NR>
```

## HCI Gerät anschalten

```
sudo hciconfig hci0 up
```

## Einrichtung

starte bluetoothctl und lege den agent fest

```
bluetoothctl
> agent KeyboardOnly
> default-agent
```

die bluetooth konsole an lassen und sich mit den geräten verbinden.
In der Konsole erscheint, wenn nötig, die pinabfrage
