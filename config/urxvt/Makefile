all:

urxvt-sync-to-client: Xdefaults tabbed
	if [ ! -e ${HOME}/.Xdefaults.bak ]; then \
	cp ${HOME}/.Xdefaults ${HOME}/.Xdefaults.bak; \
	fi
	cp Xdefaults ${HOME}/.Xdefaults
	if [ ! -e /usr/lib/urxvt/perl/tabbed.bak ]; then \
	sudo cp /usr/lib/urxvt/perl/tabbed /usr/lib/urxvt/perl/tabbed.bak; \
	fi
	sudo cp tabbed /usr/lib/urxvt/perl/tabbed

urxvt-sync-to-repo: ${HOME}/.Xdefaults /usr/lib/urxvt/perl/tabbed
	cp ${HOME}/.Xdefaults Xdefaults
	cp /usr/lib/urxvt/perl/tabbed tabbed

