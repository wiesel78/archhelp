all:

pull-phil:
	cp _phil/{.zshrc.local,.dircolors} ${HOME}/

push-phil:
	if [ -e ${HOME}/.zshrc.local ]; then \
	cp ${HOME}/{.zshrc.local,.dircolors} _phil/; \
	fi

# henriks configuration im ordner _henrik
push-henrik:
	cp -f ${HOME}/.zshrc ./_henrik/zshrc

pull-henrik:
	cp -f ./_henrik/zshrc ${HOME}/.zshrc
