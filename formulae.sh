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

brew install --formulae --quiet asdf
brew install --formulae --quiet bat
brew install --formulae --quiet coreutils
brew install --formulae --quiet direnv
brew install --formulae --quiet fd
brew install --formulae --quiet fish
brew install --formulae --quiet fzf
brew install --formulae --quiet git
brew install --formulae --quiet gitleaks
brew install --formulae --quiet gojq
brew install --formulae --quiet hledger
brew install --formulae --quiet hunspell
brew install --formulae --quiet lsd
brew install --formulae --quiet node@19
brew install --formulae --quiet pre-commit
brew install --formulae --quiet python@3\.11
brew install --formulae --quiet ripgrep
brew install --formulae --quiet run
brew install --formulae --quiet shellcheck
brew install --formulae --quiet stow
brew install --formulae --quiet tmux
brew install --formulae --quiet tree-sitter
brew install --formulae --quiet yt-dlp
brew install --formulae --quiet zoxide
