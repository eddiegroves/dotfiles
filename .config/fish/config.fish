########
# PATH #
########

# Homebrew
set -l brew_prefix /usr/local
if test (uname -m) = arm64
    set brew_prefix /opt/homebrew
end

fish_add_path $brew_prefix/bin

# Doom Emacs
fish_add_path ~/.config/emacs/bin
fish_add_path ~/.emacs.d/bin

# Nix
fish_add_path /nix/var/nix/profiles/default/bin

# Nix profile
fish_add_path /nix/var/nix/profiles/per-user/eddie/profile/bin

# Python
fish_add_path $brew_prefix/opt/python@3.11/libexec/bin

# Dotnet tools
fish_add_path ~/.dotnet/tools

# Rust
fish_add_path ~/.cargo/bin

# Homebrew system overrides
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path /opt/homebrew/opt/sqlite/bin

# Asdf dotnet
fish_add_path ~/.asdf/shims

#########################
# Environment variables #
#########################

# Set path to dotnet SDK
set -gx DOTNET_ROOT (asdf where dotnet)

# Opt-out of dotnet telemetry
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

# Increase plantuml max image size
set -gx PLANTUML_LIMIT_SIZE 8192

# Set default hledger journal
set -gx LEDGER_FILE ~/Finance/2022.journal

# Custom env var for other apps to know where brew is putting things
set -gx HOMEBREW_PREFIX $brew_prefix

# This will make Homebrew install formulae and casks from the homebrew/core and
# homebrew/cask taps using Homebrew’s API instead of local checkouts of these
# repositories.
set -gx HOMEBREW_INSTALL_FROM_API 1

# TODO: Document
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# TODO: Document
set -gx HOMEBREW_NO_ANALYTICS 1

# TODO: Document
set -gx HOMEBREW_NO_INSTALL_UPGRADE 1

# TODO: Document
set -gx HOMEBREW_NO_ENV_HINTS 1

#####################
# Fish integrations #
#####################

# Direnv https://direnv.net/
direnv hook fish | source

# Zoxide https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Google Cloud SDK
source ~/.config/google-cloud-sdk/google-cloud-sdk/path.fish.inc
