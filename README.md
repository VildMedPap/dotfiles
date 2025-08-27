# My dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

**Homebrew** must be installed first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Tools & Dependencies

This dotfiles repository includes configurations for the following tools:

| Tool | Description | Installation | Config |
|------|-------------|--------------|--------|
| **CLI Tools** | | | |
| `gh` | GitHub CLI for repository management | `brew install gh` | ✓ |
| `git` | Version control system | (pre-installed on macOS) | ✓ |
| `htop` | Interactive process viewer | `brew install htop` | ✓ |
| `neofetch` | System information display tool | `brew install neofetch` | ✓ |
| `starship` | Cross-shell prompt customization | `brew install starship` | ✓ |
| `tmux` | Terminal multiplexer | `brew install tmux` | ✓ |
| `vim` | Text editor | (pre-installed on macOS) | ✓ |
| `zsh` | Shell | (pre-installed on macOS) | ✓ |
| `eza` | Modern replacement for ls | `brew install eza` |  |
| `fzf` | Fuzzy finder for command line | `brew install fzf` |  |
| `awscli` | AWS command line interface | `brew install awscli` |  |
| `uv` | Fast Python package installer | `brew install uv` |  |
| `postgresql@17` | PostgreSQL database server | `brew install postgresql@17` |  |
| `bat` | Cat clone with syntax highlighting | `brew install bat` |  |
| `stow` | Symlink farm manager | `brew install stow` |  |
| `keymapp` | ZSA keyboard configuration tool | `brew install keymapp` |  |
| `tldr` | Simplified man pages | `brew install tldr` |  |
| `duckdb` | In-process SQL database | `brew install duckdb` |  |
| `fd` | Fast alternative to find | `brew install fd` |  |
| `hadolint` | Dockerfile linter | `brew install hadolint` |  |
| `ansible` | IT automation tool | `brew install ansible` |  |
| `jq` | JSON processor | `brew install jq` |  |
| **GUI Applications** | | | |
| `ghostty` | Fast terminal emulator | `brew install --cask ghostty` | ✓ |
| `zed` | Code editor | `brew install --cask zed` | ✓ |
| `docker` | Containerization platform | `brew install --cask docker` |  |
| `flycut` | Clipboard manager | `brew install --cask flycut` |  |
| `rectangle` | Window management tool | `brew install --cask rectangle` |  |
| `setapp` | App subscription service | `brew install --cask setapp` |  |
| `slack` | Team communication | `brew install --cask slack` |  |
| `spotify` | Music streaming service | `brew install --cask spotify` |  |
| `signal` | Private messaging app | `brew install --cask signal` |  |
| `discord` | Voice and text chat | `brew install --cask discord` |  |
| `postman` | API development tool | `brew install --cask postman` |  |
| `telegram` | Messaging app | `brew install --cask telegram` |  |
| `font-monaspace` | Monospace font family | `brew install --cask font-monaspace` |  |
| `zoom` | Video conferencing | `brew install --cask zoom` |  |
| `logi-options-plus` | Logitech device configuration | `brew install --cask logi-options+` |  |
| `chatgpt` | OpenAI ChatGPT desktop app | `brew install --cask chatgpt` |  |
| `dbeaver-community` | Universal database tool | `brew install --cask dbeaver-community` |  |
| `google-chrome` | Web browser | `brew install --cask google-chrome` |  |
| `lm-studio` | Local language model runner | `brew install --cask lm-studio` |  |
| `proxyman` | HTTP debugging proxy | `brew install --cask proxyman` |  |
| `claude` | Anthropic Claude AI assistant | `brew install --cask claude` | ✓ |

## Quick Installation

Install all tools at once using the provided script:

```bash
chmod +x install_tools.sh
./install_tools.sh
```

The script will:
- Check if Homebrew is installed
- Install all missing tools
- Provide a summary of installation status
- Show post-installation notes

### Check Installation Status

To check which tools are already installed without installing anything:

```bash
chmod +x check_tools.sh
./check_tools.sh
```

This will show you a detailed status of all tools and a summary of what's missing.

## Stow Setup Prerequisites

* `GNU stow`
  * MacOS: `brew install stow`
  * Ubuntu: `sudo apt-get update && sudo apt-get install -y stow`

## Usage

### Setup all dotfiles

Run `cd stow && stow -vSt ~ *`.

### Add new package to stow

Say you wanted to add your `.vimrc` file to stow:
* Create the directory `stow/vim`: `mkdir -p stow/vim`
* Touch `.vimrc` file: `touch stow/vim/.vimrc`
* Adopt "real" `.vimrc` file: `stow -vSt ~ vim --adopt`
