# deploys emacs configuration with prelude
CONFIG=${HOME}/.emacs.d

# if not create dir
mkdir -p $(CONFIG)/.emacs.d
# install prelude
export PRELUDE_INSTALL_DIR="${CONFIG}"
curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
# overwrite existing configuration
cp -f ./prelude-modules.el ${CONFIG}/prelude-modules.el
cp -rf ./personel/ ${CONFIG}/
