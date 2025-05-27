# neofetch info
neofetch

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light akarzim/zsh-docker-aliases

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZP::git

bindkey '^f' autosuggest-accept

autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit

ZSH_THEME=""
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HIST_STAMPS="yyyy-mm-dd"

# ALIASES

# Docker shortcuts
alias dkdang='dkrmi -f $(docker images -f "dangling=true" -q)'

# Misc
alias c=clear
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%SZ'"
alias tmux="tmux -u"

if hash fd fzf bat &>/dev/null; then
    cddir() {
        folder=$(fd --type d . $HOME | fzf --height 50% --border --exact)
        
        if [ -n "$folder" ]; then
            cd $folder
        fi
    }
else
    echo "One or more of the following clis are missing: fd, fzf, bat"
fi

# Prevent Python from writing bytecode files
export PYTHONDONTWRITEBYTECODE=1

# Manually added
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source "$HOME/.cargo/env"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sebastiansteenssoe/.cache/lm-studio/bin"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

eval "$(starship init zsh)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
