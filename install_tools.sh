#!/bin/bash

# Dotfiles Tools Installation Script
# This script installs all the tools used in this dotfiles repository

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Arrays to store installation results
declare -a INSTALLED=()
declare -a ALREADY_INSTALLED=()
declare -a FAILED=()

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to check if a package is installed
is_installed() {
    local package=$1
    local is_cask=$2

    if [[ "$is_cask" == "true" ]]; then
        brew list --cask "$package" &>/dev/null
    else
        brew list "$package" &>/dev/null
    fi
}

# Function to install a package
install_package() {
    local package=$1
    local is_cask=$2
    local install_name=$package

    if [[ "$is_cask" == "true" ]]; then
        install_name="$package (cask)"
    fi

    echo -n "Installing $install_name... "

    if is_installed "$package" "$is_cask"; then
        print_status $YELLOW "already installed"
        ALREADY_INSTALLED+=("$install_name")
        return 0
    fi

    if [[ "$is_cask" == "true" ]]; then
        if brew install --cask "$package" &>/dev/null; then
            print_status $GREEN "✓ installed"
            INSTALLED+=("$install_name")
        else
            print_status $RED "✗ failed"
            FAILED+=("$install_name")
        fi
    else
        if brew install "$package" &>/dev/null; then
            print_status $GREEN "✓ installed"
            INSTALLED+=("$install_name")
        else
            print_status $RED "✗ failed"
            FAILED+=("$install_name")
        fi
    fi
}

print_status $BLUE "=== Dotfiles Tools Installation ==="
echo

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_status $RED "Error: Homebrew is not installed. Please install Homebrew first:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Cache sudo credentials to avoid multiple password prompts
print_status $BLUE "Caching sudo credentials (some casks may require admin privileges)..."
sudo -v

print_status $BLUE "Updating Homebrew..."
brew update

echo
print_status $BLUE "Installing command-line tools..."

# Regular brew packages
install_package "gh" false
install_package "htop" false
install_package "neofetch" false
install_package "starship" false
install_package "tmux" false
install_package "eza" false
install_package "fzf" false
install_package "awscli" false
install_package "uv" false
install_package "postgresql@17" false
install_package "bat" false
install_package "stow" false
install_package "keymapp" false
install_package "tldr" false
install_package "duckdb" false
install_package "fd" false
install_package "hadolint" false
install_package "ansible" false
install_package "jq" false

echo
print_status $BLUE "Installing GUI applications (casks)..."

# Cask packages
install_package "ghostty" true
install_package "zed" true
install_package "docker" true
install_package "flycut" true
install_package "rectangle" true
install_package "setapp" true
install_package "slack" true
install_package "spotify" true
install_package "signal" true
install_package "discord" true
install_package "postman" true
install_package "telegram" true
install_package "font-monaspace" true
install_package "zoom" true
install_package "logi-options-plus" true
install_package "chatgpt" true
install_package "dbeaver-community" true
install_package "google-chrome" true
install_package "lm-studio" true
install_package "proxyman" true
install_package "claude" true

echo
print_status $BLUE "=== Installation Summary ==="

if [[ ${#INSTALLED[@]} -gt 0 ]]; then
    print_status $GREEN "✓ Newly installed (${#INSTALLED[@]}):"
    for package in "${INSTALLED[@]}"; do
        echo "  - $package"
    done
    echo
fi

if [[ ${#ALREADY_INSTALLED[@]} -gt 0 ]]; then
    print_status $YELLOW "⚠ Already installed (${#ALREADY_INSTALLED[@]}):"
    for package in "${ALREADY_INSTALLED[@]}"; do
        echo "  - $package"
    done
    echo
fi

if [[ ${#FAILED[@]} -gt 0 ]]; then
    print_status $RED "✗ Failed to install (${#FAILED[@]}):"
    for package in "${FAILED[@]}"; do
        echo "  - $package"
    done
    echo
    print_status $RED "Some packages failed to install. Please check the errors above."
    exit 1
else
    print_status $GREEN "🎉 All tools are now installed!"
fi

# Keep sudo credentials alive during installation
sudo -v

# Post-installation notes
echo
print_status $BLUE "=== Post-installation Notes ==="
echo "• Run 'fzf --install' to set up fzf key bindings and fuzzy completion"
echo "• PostgreSQL 17 service can be started with: brew services start postgresql@17"
echo "• Some GUI applications may require additional setup or permissions"
echo "• Don't forget to run 'cd stow && stow -vSt ~ *' to symlink your dotfiles"
