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

# Rancher Desktop
fish_add_path ~/.rd/bin

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

# Homebrew’s analytics are currently sent to both to Google Analytics and a
# self-hosted InfluxDB instance hosted in the EU. I am okay with the InfluxDB
# analytics, so just disabling GA until it's removed permanently from Homebrew.
set -gx HOMEBREW_NO_GOOGLE_ANALYTICS 1

# Unless HOMEBREW_NO_INSTALL_UPGRADE is set, brew install formula will upgrade
# formula if it is already installed but outdated. This makes me explicity
# perform upgrades which I am okay with.
set -gx HOMEBREW_NO_INSTALL_UPGRADE 1

# Do not print any hints about changing Homebrew’s behaviour with environment
# variables.
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
