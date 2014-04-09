# Awesome

Awesome Configuration
Checkout with:
```
 make pull-[henrik|phill] | push-[henrik|phill]
```

#### _henrik
Some notes about my configuration:
* Battery widget (`rc.lua`, line ~167), insert your own battery (`l /sys/class/power_supply`).
* Check you have the correct state files in `battery.lua` (line ~21)
* Change the path of the wp_changer to your wallpaper folder (`rc.lua` line ~53)

#### _phil
wp_change require 'lfs' : 
```
    sudo pacman -S luarocks
    sudo luarocks install luafilesystem
```
or on arch linux just
`sudo pacman -S lua51-filesystem`  
Change wp_path to your wallpaper folder (`rc.lua` line ~530)

