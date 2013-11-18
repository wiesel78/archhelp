CONFIG = ${HOME}/.config

all:

from-client:
	if [ -e $(CONFIG)/lilyterm/ ]; then \
	cp -r $(CONFIG)/lilyterm/default.conf ./default.conf; \
	fi

to-client:
	cp default.conf $(CONFIG)/lilyterm/default.conf
