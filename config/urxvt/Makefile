all:

pull-phil:
	if [ ! -e ${HOME}/.Xdefaults.bak ]; then \
    if [ -e ${HOME}/.Xdefaults ]; then \
	cp ${HOME}/.Xdefaults ${HOME}/.Xdefaults.bak; \
    fi \
	fi
	cp _phil/Xdefaults ${HOME}/.Xdefaults
	if [ ! -e /usr/lib/urxvt/perl/tabbed.bak ]; then \
	sudo cp /usr/lib/urxvt/perl/tabbed /usr/lib/urxvt/perl/tabbed.bak; \
	fi
	sudo cp _phil/tabbed /usr/lib/urxvt/perl/tabbed

push-phil: 
	cp ${HOME}/.Xdefaults _phil/Xdefaults
	cp /usr/lib/urxvt/perl/tabbed _phil/tabbed

