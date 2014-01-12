CONFIG=${HOME}/.emacs.d/

all:

from-client:
	if [ -d $(CONFIG)/ ]; then \
	cp $(CONFIG)/prelude-modules.el ./prelude-modules.el; \
	cp -r $(CONFIG)/personal/ ./; \
	fi

to-client:
	mkdir -p $(CONFIG)
	cp ./prelude-modules.el $(CONFIG)/prelude-modules.el
	cp -r ./personal/ $(CONFIG)/

fresh-client:
	./deploy.sh
