all:

pull-phil:
	cp _phil/{.zshrc.local,.dircolors} ${HOME}/

push-phil:
	if [ -e ${HOME}/.zshrc.local ]; then \
	cp ${HOME}/{.zshrc.local,.dircolors} _phil/; \
	fi

# henriks configuration in _henrik
push-henrik:
	cp -fr ${HOME}/{.zshrc,.zsh} ./_henrik/

pull-henrik:
	cp -fr ./_henrik/{.zshrc,.zsh} ${HOME}/
	chmod -R 755 ${HOME}/.zsh
