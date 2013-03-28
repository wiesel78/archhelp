CONFIG = ${HOME}/.config/awesome

all:

awesome-sync-to-client: rc.lua
	mkdir -p ${HOME}/.config/awesome
	if [ ! -e $(CONFIG)/rc.bak.lua ]; then \
	cp $(CONFIG)/rc.lua $(CONFIG)/rc.bak.lua; \
	fi
	if [ ! -e $(CONFIG)/theme.bak.lua ]; then \
	cp $(CONFIG)/theme.lua $(CONFIG)/theme.bak.lua; \
	fi
	if [ ! -e $(CONFIG)/wallpaper.bak.jpg ]; then \
	cp $(CONFIG)/wallpaper.jpg $(CONFIG)/wallpaper.bak.jpg; \
	fi
	if [ ! -e $(CONFIG)/keydoc.bak.lua ]; then \
	cp $(CONFIG)/keydoc.lua $(CONFIG)/keydoc.bak.lua; \
	fi
	cp rc.lua $(CONFIG)/rc.lua
	cp theme.lua $(CONFIG)/theme.lua
	cp keydoc.lua $(CONFIG)/keydoc.lua
	cp wallpaper.jpg $(CONFIG)/wallpaper.jpg

awesome-sync-to-repo:
	if [ -e $(CONFIG)/rc.lua ]; then \
	cp $(CONFIG)/rc.lua rc.lua; \
	fi
	if [ -e $(CONFIG)/theme.lua ]; then \
	cp $(CONFIG)/theme.lua theme.lua; \
	fi
	if [ -e $(CONFIG)/keydoc.lua ]; then \
	cp $(CONFIG)/keydoc.lua keydoc.lua; \
	fi
	if [ -e $(CONFIG)/wallpaper.jpg ]; then \
	cp $(CONFIG)/wallpaper.jpg wallpaper.jpg; \
	fi
	
