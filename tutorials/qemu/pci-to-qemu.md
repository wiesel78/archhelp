## Passthrough PCI Card to QEMU guest  

### Get PCI device

```
    lspci -nn
```

```
    03:00.0 Network controller [0280]: Intel Corporation WiFi Link 5100 [8086:4232]
```

### Unbind the device (as root) 

```
    modprobe pci_stub
    echo "8086 4232" > /sys/bus/pci/drivers/pci-stub/new_id
    echo "0000:03:00.0" > /sys/bus/pci/devices/0000:03:00.0/driver/unbind
    echo "0000:03:00.0" > /sys/bus/pci/drivers/pci-stub/bind
```

### Run qemu

```
    sudo qemu-system-i386 -m 1024M Downloads/openwrt-x86-ext2.image -enable-kvm -device pci-assign,host=03:00.0
```


