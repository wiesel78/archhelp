# ArchLinux auf UEFI Systemen installieren

## Partitionierung

```
    gdisk /dev/sdX
```
  
lege eine Partition auf die id 128 und am ende der Festplatte mit 512MB und der Kennung EF00.  
Den Rest kannst du belegen wie du willst. Hier gehe ich von einer weiteren Partition über den restlichen speicherplatz aus.

## Dateisysteme erstellen

```
    mkfs.fat -n EFISYSTEM -f /dev/sdX128
    mkfs.ext4 -L LINUX /dev/sdX1
```
  
## Mounten der Systeme

```
    mount -L LINUX /mnt
    mkdir /mnt/boot
    mount -L EFISYSTEM /mnt/boot
```
  
## Installiere GRUB
Installiere dein Arch Linux wie gewohnt mit pacstrap /mnt base und geh hinein mit arch-chroot /mnt. Installieren dann GRUB
  

```
   pacman -S grub efibootmgr dosfstools
   grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCHLINUX --recheck --debug
```


