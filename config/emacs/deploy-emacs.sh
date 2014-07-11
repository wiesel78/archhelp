#!/bin/sh
#
# This script deploys my emacs configuration after a fresh install.

cwd=`pwd`
emacs=$HOME/.emacs.d

cd $emacs
# Install Prelude
curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh

# Install dark-blue theme
cd personal
curl -O https://raw.githubusercontent.com/emacs-jp/replace-colorthemes/master/dark-blue-theme.el
 
# Install yasnippets:
cd ../snippets
git clone https://github.com/AndreaCrotti/yasnippet-snippets.git 

cd cwd
cp -f prelude-modules.el ${emacs}/prelude-modules.el
cp -rf personal/ ${emacs}/
echo "Config successfully copied."
