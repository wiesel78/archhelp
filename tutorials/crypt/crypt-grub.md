## Von einer Verschlüsselten Partition booten  

Die boot Partition muss unverschlüsselt bleiben und liegt in diesem Beispiel auf /dev/sda128. 
Die root Partition liegt auf /dev/sda1.
  
Als erstes fügt man encrypt zu dem HOOKS Array in der Datei /etc/mkinitcpio.conf :  

```
    HOOKS="base udev autodetect modconf block filesystems keyboard encrypt fsck"
```
  
Nun hängt man als Kernel Parameter folgendes in der Datei /boot/grub/grub.cfg hinzu.  

```

    linux /vmlinuz-linux root=LABEL=ROOT ro rootflags=subvol=root cryptdevice=/dev/sda1:root lang=de locale=de_DE.UTF-8
```

rootflags=subvol=root benötigt man nur wenn man ein btrfs subvolume namens root hat.  
cryptdevice=/dev/sda1:name gibt die verschlüsselte Partition an und den Namen der dann unter /dev/mapper/name auftaucht.  

