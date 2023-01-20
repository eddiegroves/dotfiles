########
# PATH #
########

# Homebrew
set -l brew_prefix /usr/local
if test (uname -m) = "arm64"
    set brew_prefix /opt/homebrew
end

fish_add_path $brew_prefix/bin

# Doom Emacs
fish_add_path ~/.emacs.d/bin

# Nix
fish_add_path /nix/var/nix/profiles/default/bin

# Nix profile
fish_add_path /nix/var/nix/profiles/per-user/eddie/profile/bin

# Python
fish_add_path $brew_prefix/opt/python@3.11/libexec/bin

# Dotnet tools
fish_add_path ~/.dotnet/tools

# Homebrew system overrides
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path /opt/homebrew/opt/sqlite/bin

#########################
# Environment variables #
#########################

# Increase plantuml max image size
set -gx PLANTUML_LIMIT_SIZE 8192

# Set default hledger journal
set -gx LEDGER_FILE ~/Finance/2022.journal

# This will make Homebrew install formulae and casks from the homebrew/core and
# homebrew/cask taps using Homebrew’s API instead of local checkouts of these
# repositories.
set -gx HOMEBREW_INSTALL_FROM_API 1

# Opt-out of dotnet telemetry
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

#####################
# Fish integrations #
#####################

# Direnv https://direnv.net/
direnv hook fish | source

# Zoxide https://github.com/ajeetdsouza/zoxide
zoxide init fish | source
