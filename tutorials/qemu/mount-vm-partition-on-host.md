# Partition im Hostsystem einhängen

Um eine virtuelle Festplatte im Hostsystem zu laden kann man 
qemu-nbd missbrauchen. Dazu als erstes das nbd Modul laden.

```
sudo modprobe nbd max_part=63
```

dann verbindet man das nbd0 device mit der vm-image

```
sudo qemu-nbd --connect=/dev/nbd0 /pfad/zur/qemu.img
```

ab hier ist der Weg wie mit jeder anderen Festplatte auch. Nur dass die 
Geräte-Dateien nach dem schema /dev/nbd0p1 zu handhaben sind.

```
sudo mount /dev/nbd0p1 /mnt
```

## aushängen

Um die Platte wieder sauber auszuhängen

```
sudo umount /mnt
sudo qemu-nbd -d /dev/nbd0

```
