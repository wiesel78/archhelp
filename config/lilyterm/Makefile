CONFIG = ${HOME}/.config

all:

push-henrik:
	if [ -e $(CONFIG)/lilyterm/ ]; then \
	cp $(CONFIG)/lilyterm/default.conf ./default.conf; \
	fi

pull-henrik:
	mkdir -p ~/.config/lilyterm
	cp default.conf $(CONFIG)/lilyterm/default.conf
