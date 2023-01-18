#!/bin/bash
# See HOMEBREW_PREFIX in https://github.com/Homebrew/install/blob/master/install.sh
if [[ $(uname -m) == 'arm64' ]]; then
    HOMEBREW_PREFIX="/opt/homebrew/bin"
else
    HOMEBREW_PREFIX="/usr/local/bin"
fi

if [ ! -f "$HOMEBREW_PREFIX/brew" ]; then
    echo "Homebrew not found, have you installed it?"
    exit 0
fi

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_INSTALL_FROM_API=1
export PATH=$HOMEBREW_PREFIX:$PATH

brew tap d12frosted/emacs-plus
brew install emacs-plus@29 --verbose --with-native-comp --with-xwidgets --with-poll --with-no-frame-refocus --with-nobu417-big-sur-icon
echo "For Emacs to show up in Spotlight, see https://apple.stackexchange.com/a/32495"
