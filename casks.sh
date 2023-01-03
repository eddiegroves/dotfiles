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
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_NO_ENV_HINTS=1
export PATH=$HOMEBREW_PREFIX:$PATH

# Fonts
brew install --cask homebrew/cask-fonts/font-hack

# Casks
brew install --cask beyond-compare
brew install --cask drawio
brew install --cask insomnia
brew install --cask iterm2
brew install --cask krisp
brew install --cask orion
brew install --cask stoplight-studio
brew install --cask vscodium
