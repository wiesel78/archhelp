## Liste der installierten Pakete Archivieren

```
pacman -Qeq > pakete.txt
```
  
## Pakete aus der Liste installieren

```
pacman -S $(cat pakete.txt)
```
