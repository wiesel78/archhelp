# deploy emacs configuration with prelude
CONFIG=${HOME}/.emacs.d
CWD=`pwd`

# install prelude
export PRELUDE_INSTALL_DIR="${CONFIG}"
curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh

# overwrite existing configuration
cd $CWD
cp -f prelude-modules.el ${CONFIG}/prelude-modules.el
cp -rf personal/ ${CONFIG}/
echo "Config successfully copied."
