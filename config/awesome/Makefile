CONFIG = ${HOME}/.config

all:

awesome-sync-to-client:
mkdir -p $(CONFIG)/awesome/
if [ ! -e $(CONFIG)/awesome.bak.tar.gz ]; then \
tar -cvzf $(CONFIG)/awesome.bak.tar.gz $(CONFIG)/awesome/*; \
fi
cp -r `ls -I Makefile -I netrc` $(CONFIG)/awesome/
if [ ! -e ${HOME}/.netrc ]; then \
cp netrc ${HOME}/.netrc; \
echo ".netrc anpassen : Name, Passwort"; \
fi

awesome-sync-to-repo:
if [ -e $(CONFIG)/awesome/ ]; then \
cp -r $(CONFIG)/awesome/* ./; \
fi
echo "machine mail.google.com login user password pass" > ./netrc

# henriks configuration, dateien im ordner _henrik
from-client:
if [ -e $(CONFIG)/awesome/ ]; then \
cp -r $(CONFIG)/awesome/* ./_henrik/; \
echo "Successfully moved to repo."; \
fi

to-client:
mkdir -p $(CONFIG)/awesome/
cp -r ./_henrik/* $(CONFIG)/awesome/
