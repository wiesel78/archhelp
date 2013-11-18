# deploys emacs configuration with prelude

# save existing one
tar -cf ${HOME}/emacs.tar.gz ${HOME}/.emacs ${HOME}/.emacs.d
# if not create dir
mkdir -p $(CONFIG)/.emacs.d
# install prelude
export PRELUDE_INSTALL_DIR="${HOME}/.emacs.d"
curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
# overwrite existing configuration
cp -f ./prelude-modules.el $(CONFIG)/.emacs.d/prelude-modules.el
