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

brew install --quiet asdf
brew install --quiet bat
brew install --quiet coreutils
brew install --quiet direnv
brew install --quiet fd
brew install --quiet fish
brew install --quiet fzf
brew install --quiet git
brew install --quiet gojq
brew install --quiet hledger
brew install --quiet hunspell
brew install --quiet lsd
brew install --quiet node@19
brew install --quiet python@3\.11
brew install --quiet ripgrep
brew install --quiet run
brew install --quiet shellcheck
brew install --quiet stow
brew install --quiet tmux
brew install --quiet tree-sitter
brew install --quiet yt-dlp
brew install --quiet zoxide
