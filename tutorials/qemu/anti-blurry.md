# Anti Blurry

Unter Windows kann es vorkommen, dass die Schriften ein wenig 
verschwommen erscheinen. Um diesem Effekt entgegen zu wirken 
holt man sich mit 

```
xdootool
```


```
xdotool windowsize `xdotool search --name QEMU` 1919 1079
```
