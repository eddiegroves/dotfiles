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

export HOMEBREW_NO_GOOGLE_ANALYTICS=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_ENV_HINTS=1
export PATH=$HOMEBREW_PREFIX:$PATH

if test -n "${1-}"; then
    brew install --cask --verbose "$1"
    exit 0
fi

# Fonts
brew install --cask --quiet homebrew/cask-fonts/font-hack

# Casks
brew install --cask --quiet aldente
brew install --cask --quiet beyond-compare
brew install --cask --quiet drawio
brew install --cask --quiet iina
brew install --cask --quiet insomnia
brew install --cask --quiet iterm2
brew install --cask --quiet krisp
brew install --cask --quiet powershell
brew install --cask --quiet stoplight-studio
brew install --cask --quiet vscodium

brew tap homebrew/cask-versions
brew install --cask --quiet firefox-developer-edition
