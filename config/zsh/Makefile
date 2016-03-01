all:

pull-phil:
	cp _phil/{.zshrc.local,.dircolors} ${HOME}/

push-phil:
	if [ -e ${HOME}/.zshrc.local ]; then \
	cp ${HOME}/{.zshrc.local,.dircolors} _phil/; \
	fi


push-henrik:
	cp -f ${HOME}/.zshrc.local ./_henrik/.zshrc.local

pull-henrik:
	cp -f ./_henrik/.zshrc.local ${HOME}/.zshrc.local

