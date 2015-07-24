## VIM Paketmanager Pathogen

für die Benutzung von Pathogen sieht man sich am besten das
Pathogen Repository an (https://github.com/tpope/vim-pathogen "Pathogen Repository")  
in den Configs unter vim -> phil gibt es eine vim Konfiguration die mit Pathogen
eingerichtet wurde.

### Neues Paket Hinzufügen

Wenn Pathogen vollständig eingerichtet ist und man nun ein
Paket hinzufügen möchte, geht man nach 

```
cd ~/.vim/bundle
```

und hängt das gewünschte repository dort ein 

```
git submodule add https://github.com/scrooloose/nerdcommenter.git nerdcommenter
```

nun sollte das Plugin im vim nutzbar sein

