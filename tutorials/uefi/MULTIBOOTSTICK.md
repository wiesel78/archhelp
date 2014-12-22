# Multiboot Stick für UEFI Systeme

Eine kurze Anleitung wie man Windows und Linux als Installationsmedien auf einem Stick bringt.

## Partitionieren

Es wird eine Partition für Windows und eine für Linux angelegt. Das Verfahren kann mit beliebig vielen Installationsmedien geführt werden.

```
    gdisk /dev/sdX
      --> lege 2 partition mit je 4 GB (mindestens) an und gib ihnen die Kennung 0700
```

## Formatieren

Beide Partitionen müssen mit FAT formatiert werden.
  
```
    mkfs.vfat -n STWINDOWS /dev/sdX1
    mkfs.vfat -n STLINUX /dev/sdX2
```
  
## Mounten

Mounte beide Partitionen

```
    mkdir /mnt/{windows,linux}
    mount -L STWINDOWS /mnt/windows
    mount -L STLINUX /mnt/linux
```

## GRUB installieren

Installiere GRUB und gib ihm deine Architektur mit i386, x86_64, ia64.

```
    grub-install --target x86_64-efi --root-directory /mnt/linux --removable
```

## Installationsmedien kopieren

Lade dir Windows und Archlinux runter.  
Kopiere Archlinux auf den Stick.

```
    mkdir -p /mnt/linux/boot/iso
    cp archlinux-2014.12.01-dual.iso /mnt/linux/iso/archlinux.iso
```
  
Kopiere Windows auf den Stick. Dazu die Windows.iso in einen Ordner mounten und den Inhalt auf die Windows Partition kopieren.

```
    mkdir windows
    mount Windows8.1.iso windows
    cp -r windows/* /mnt/windows/
```

## GRUB konfigurieren

Zum Schluss muss man noch die Grub Konfiguration schreiben. Es müssen nur die Einträge für die Linux Systeme geschrieben werden. Später wird über das UEFI Bootmenü entweder die Windows Partition oder die Linux Partition ausgewählt.

```
    sudo vim /mnt/linux/boot/grub/grub.cfg


    GRUB_TIMEOUT=10
    GRUB_DEFAULT=0
    set timeout=${GRUB_TIMEOUT}
    
    set path="/boot"
    
    set os64="x86_64"
    
    set partlinux=(hd0,2)
    
    set labellinux="STLINUX"
    

    set archversion="ARCH_201412"
    set archiso="${path}/iso/archlinux.iso"
    
    set ubuntuiso="${path}/iso/ubuntu32.iso"
    
    menuentry "Arch Live 64" {
        set part=${partlinux}
        set isofile=$archiso
        set partlabel=${labellinux}
        set os=${os64}
        loopback loop ${part}${isofile}
        linux (loop)/arch/boot/${os}/vmlinuz archisolabel=$archversion img_dev=/dev/disk/by-label/${partlabel} img_loop=$isofile earlymodules=loop
        initrd (loop)/arch/boot/${os}/archiso.img
    }
    
    menuentry "Ubuntu 14.10" {
        set part=${partlinux}
        set isofile=$ubuntuiso
        loopback loop ${part}${isofile}
        linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=$isofile noprompt noeject quiet splash
        initrd (loop)/casper/initrd.lz
    }

```
  
Das kann man dann beliebig erweitern. In diesem Beispiel ist bereits ein Eintrag für Ubuntu dabei. Wenn man also Ubuntu starten möchte, kann man die Ubuntu.iso nach /mnt/linux/boot/iso/ubuntu.iso kopieren.
