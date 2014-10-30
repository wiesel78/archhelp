all:

pull-phil:
	cp _phil/{.zshrc.local,.dircolors} ${HOME}/

push-phil:
	if [ -e ${HOME}/.zshrc.local ]; then \
	cp ${HOME}/{.zshrc.local,.dircolors} _phil/; \
	fi


push-henrik:
	cp -fr ${HOME}/.oh-my-zsh/custom ./_henrik/
	cp -f ${HOME}/.zshrc ./_henrik/zshrc

pull-henrik:
	cp -fr ./_henrik/custom ${HOME}/.oh-my-zsh/
	cp -f ./_henrik/zshrc ${HOME}/.zshrc

fresh-henrik:
	curl -L http://install.ohmyz.sh | sh
	pull-henrik
