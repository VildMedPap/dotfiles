### ── Startup Banner ─────────────────────────────────────────────
neofetch

### ── Plugin Manager ─────────────────────────────────────────────
PLUGIN_MANAGER_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $PLUGIN_MANAGER_HOME ] && mkdir -p "$(dirname $PLUGIN_MANAGER_HOME)"
[ ! -d $PLUGIN_MANAGER_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$PLUGIN_MANAGER_HOME"
source "${PLUGIN_MANAGER_HOME}/zinit.zsh"

### ── Plugins ────────────────────────────────────────────────────
# Shell enhancements
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light djui/alias-tips

# Docker aliases (e.g. dkps, dkpsa, dkCls, dkdang)
zinit light akarzim/zsh-docker-aliases

# Git aliases (e.g. ggpull, glog, gst, gss, gc!)
zinit snippet OMZP::git
zinit snippet OMZL::git.zsh

### ── Shell Behavior / Completion / UX ───────────────────────────
# Accept autosuggestion with Ctrl+F instead of right arrow
bindkey '^f' autosuggest-accept

# Zsh completion system
autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit

# Visual indicator when completions are loading
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Timestamp formatting in command history
HIST_STAMPS="yyyy-mm-dd"

### ── Aliases ─────────────────────────────────────────────────────
alias dkdang='dkrmi -f $(docker images -f "dangling=true" -q)'
alias c=clear
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%SZ'"
alias tmux="tmux -u"
alias l='ls -lAhG'

# Directory jumping
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Quick jumps
alias ~='cd ~'
alias -- -="cd -"

### ── History Configuration ──────────────────────────────────────
# Controls how shell command history is stored, shared, and deduplicated
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

### ── Directory Navigation Helpers (fzf + fd + bat) ───────────────
if hash fd fzf bat &>/dev/null; then
  cddir() {
      folder=$(fd --type d . $HOME | fzf --height 50% --border --exact)
          [ -n "$folder" ] && cd "$folder"
    }
else
    echo "Missing one of: fd, fzf, bat"
fi

### ── Toolchain & CLI Setup ───────────────────────────────────────
# Rust (cargo, etc.)
source "$HOME/.cargo/env"

# Astral's `uv` tools
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# LM Studio CLI tools
export PATH="$PATH:$HOME/.cache/lm-studio/bin"

# PostgreSQL (Homebrew)
export PATH="$PATH:/opt/homebrew/opt/postgresql@17/bin"

### ── Prompt Manager ──────────────────────────────────────────────
eval "$(starship init zsh)"

### ── Locale ──────────────────────────────────────────────────────
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
