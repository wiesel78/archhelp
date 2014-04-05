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

#### Phil
wp_change require 'lfs' : 
```
    sudo pacman -S luarocks
    sudo luarocks install luafilesystem
``` 
Change wp_path to your wallpaper folder (`rc.lua` line ~530)

