## Eine Partition mit dm-crypt Verschlüsseln

um eine partition zu verschlüsseln führe

```
    cryptsetup -c aes-xts-plain -y -s 512 luksFormat /dev/sda1
```
aus. wenn die Platte größer als 2TB ist, sollte man statt "aes-xts-plain"
besser "aes-xts-plain64" verwenden.


## Verschlüsselte Platte einhängen

um eine verschlüsselte Platte einzuhängen führe

```
    cryptsetup luksOpen /dev/sda1 name
```

aus. Statt name gibt man irgendwas ein. Dieser Name wird später unter
/dev/mapper/name sichtbar. Ab hier kann man mit /dev/mapper/name
arbeiten wie mit jeder anderen Partition.
