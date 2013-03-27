CONFIG = ${HOME}/.config/awesome

all:

awesome-sync-to-client: rc.lua
	mkdir -p ${HOME}/.config/awesome
	if [ -e $(CONFIG)/rc.lua ]; then \
	cp $(CONFIG)/rc.lua $(CONFIG)/rc.lua.bak; \
	fi
	if [ -e $(CONFIG)/theme.lua ]; then \
	cp $(CONFIG)/theme.lua $(CONFIG)/theme.lua.bak; \
	fi
	if [ -e $(CONFIG)/wallpaper.jpg ]; then \
	cp $(CONFIG)/wallpaper.jpg $(CONFIG)/wallpaper.bak.jpg; \
	fi
	cp rc.lua $(CONFIG)/rc.lua
	cp theme.lua $(CONFIG)/theme.lua
	cp wallpaper.jpg $(CONFIG)/wallpaper.jpg

awesome-sync-to-repo:
	if [ -e $(CONFIG)/rc.lua ]; then \
	cp $(CONFIG)/rc.lua rc.lua; \
	fi
	if [ -e $(CONFIG)/theme.lua ]; then \
	cp $(CONFIG)/theme.lua theme.lua; \
	fi
	if [ -e $(CONFIG)/wallpaper.jpg ]; then \
	cp $(CONFIG)/wallpaper.jpg wallpaper.jpg; \
	fi
	
