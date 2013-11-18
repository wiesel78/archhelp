all:

zsh-sync-to-client:
	cp zshrc.local ${HOME}/.zshrc.local

zsh-sync-to-repo:
	if [ -e ${HOME}/.zshrc.local ]; then \
	cp ${HOME}/.zshrc.local zshrc.local; \
	fi

# henriks configuration im ordner _henrik
from-client:
	cp -f ${HOME}/.zshrc ./_henrik/zshrc

to-client:
	cp -f ./_henrik/zshrc ${HOME}/.zshrc
