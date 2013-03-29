CONFIG = ${HOME}/.config/

all:

awesome-sync-to-client: rc.lua
	mkdir -p $(CONFIG)/awesome/
	if [ ! -e $(CONFIG)/awesome.bak.tar.gz ]; then \
	tar -cvzf $(CONFIG)/awesome.bak.tar.gz $(CONFIG)/awesome/*; \
	fi
	cp -r * $(CONFIG)/awesome/

awesome-sync-to-repo:
	if [ -e $(CONFIG)/awesome/ ]; then \
	cp -r $(CONFIG)/awesome/* ./; \
	fi

