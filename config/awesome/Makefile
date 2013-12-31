CONFIG = ${HOME}/.config

# phils configuration, dateien im ordner _phil
from-phil:
	if [ -e $(CONFIG)/awesome/ ]; then \
	cp -r $(CONFIG)/awesome/* ./_phil/; \
	echo "Successfully moved to repo."; \
	fi

to-phil:
	mkdir -p $(CONFIG)/awesome/
	cp -r ./_phil/* $(CONFIG)/awesome/


# henriks configuration, dateien im ordner _henrik
from-henrik:
	if [ -e $(CONFIG)/awesome/ ]; then \
	cp -r $(CONFIG)/awesome/* ./_henrik/; \
	echo "Successfully moved to repo."; \
	fi

to-henrik:
	mkdir -p $(CONFIG)/awesome/
	cp -r ./_henrik/* $(CONFIG)/awesome/
