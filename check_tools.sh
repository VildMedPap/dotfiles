#!/bin/bash

# Dotfiles Tools Status Check Script
# This script checks the installation status of all tools used in this dotfiles repository

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to check if a package is installed
check_package() {
    local package=$1
    local is_cask=$2
    local display_name=$3

    if [[ -z "$display_name" ]]; then
        display_name=$package
    fi

    printf "%-20s " "$display_name"

    if [[ "$is_cask" == "true" ]]; then
        if brew list --cask "$package" &>/dev/null; then
            print_status $GREEN "✓ installed"
            return 0
        else
            print_status $RED "✗ not installed"
            return 1
        fi
    else
        if brew list "$package" &>/dev/null; then
            print_status $GREEN "✓ installed"
            return 0
        else
            print_status $RED "✗ not installed"
            return 1
        fi
    fi
}

print_status $BLUE "=== Dotfiles Tools Status Check ==="
echo

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_status $RED "Error: Homebrew is not installed."
    echo "Install Homebrew first: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

print_status $BLUE "Command-line tools:"
echo

# Track counts
installed_count=0
total_count=0

# Regular brew packages
packages=(
    "gh"
    "htop"
    "neofetch"
    "starship"
    "tmux"
    "eza"
    "fzf"
    "awscli"
    "uv"
    "postgresql@17"
    "bat"
    "stow"
    "keymapp"
    "tldr"
    "duckdb"
    "fd"
    "hadolint"
    "ansible"
    "jq"
)

for package in "${packages[@]}"; do
    if check_package "$package" false; then
        ((installed_count++))
    fi
    ((total_count++))
done

echo
print_status $BLUE "GUI Applications (casks):"
echo

# Cask packages
casks=(
    "ghostty"
    "zed"
    "docker"
    "flycut"
    "rectangle"
    "setapp"
    "slack"
    "spotify"
    "signal"
    "discord"
    "postman"
    "telegram"
    "font-monaspace"
    "zoom"
    "logi-options-plus"
    "chatgpt"
    "dbeaver-community"
    "google-chrome"
    "lm-studio"
    "proxyman"
    "claude"
)

for cask in "${casks[@]}"; do
    if check_package "$cask" true; then
        ((installed_count++))
    fi
    ((total_count++))
done

echo
print_status $BLUE "=== Summary ==="
echo "Installed: $installed_count/$total_count tools"

if [[ $installed_count -eq $total_count ]]; then
    print_status $GREEN "🎉 All tools are installed!"
else
    missing=$((total_count - installed_count))
    print_status $YELLOW "⚠ $missing tools are missing"
    echo
    echo "Run './install_tools.sh' to install missing tools"
fi
