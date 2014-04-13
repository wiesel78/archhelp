# PPTP mit pptpclient

Eine kurze Anleitung wie man eine PPTP VPN Verbindung aufbaut. Als Beispiel dient hier eine Verbindung zur Uni-Potsdam. Als Distribution kommt wie immer Archlinux zum einsatz -> sollte aber unter jedem unix system mit pptpclient ähnlich sein

## Installation  

aus den Öffentlichen Repos pptpclient installieren  

``` 
  sudo pacman -Syu pptpclient 
```  

## Konfiguration  

pptpsetup macht alles für uns, wir müssen ihm nur alle Informationen geben.

``` 
  sudo pptpsetup --create univpn --server vpn.uni-potsdam.de --username name@uni-potsdam.de --password deinpasswort --encrypt 
```  

Das erstellt uns eine Datei in /etc/ppp/peers/ namens univpn  
Löschen kann man die Datei direkt oder mit dem Befehl   

``` 
  sudo pptpsetup --delete univpn 
```  

## Verbindung starten  

Für den ersten start sollte man sich von pptpclient alle möglichen Informationen ausgeben lassen um zu sehen ob man vielleicht ein falschen Namen oder ein falsches Passwort eingegeben hat.

``` 
  sudo pon univpn debug dump logfd 2 nodetach 
```  

Wenn alles gut ging sollte man "ip addr" das gerät ppp0 sehen  
Normales starten mit  

``` 
  sudo pon univpn 
```

## Routing  

Um auch tatsächlich alle Pakete über die PPTP VPN Verbindung zu jagen sollte man noch eine route auf ppp0 setzen.  

``` 
  sudo ip route add default dev ppp0 
```  

Wenn es nur die Pakete sein sollen die auch an das Vpn-Netzwerk gerichtet sind dann  

``` 
  sudo ip route add 141.89.0.0/16 dev ppp0 
```  

Man kann die jeweiligen Routen wieder löschen in dem man statt add ein delete schreibt



