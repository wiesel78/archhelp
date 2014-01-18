CONFIG = ${HOME}/.config

# phils configuration, dateien im ordner _phil
push-phil:
	if [ -e $(CONFIG)/awesome/ ]; then \
	cp -r $(CONFIG)/awesome/* ./_phil/; \
	echo "Successfully moved to repo."; \
	fi

pull-phil:
	mkdir -p $(CONFIG)/awesome/
	cp -r ./_phil/* $(CONFIG)/awesome/


# henriks configuration, dateien im ordner _henrik
push-henrik:
	if [ -e $(CONFIG)/awesome/ ]; then \
	cp -r $(CONFIG)/awesome/* ./_henrik/; \
	echo "Successfully moved to repo."; \
	fi

pull-henrik:
	mkdir -p $(CONFIG)/awesome/
	cp -r ./_henrik/* $(CONFIG)/awesome/
