# neofetch info
neofetch

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit

ZSH_THEME=""
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions docker docker-compose zsh-docker-aliases alias-tips zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sebastiansteenssoe/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sebastiansteenssoe/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sebastiansteenssoe/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sebastiansteenssoe/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source "$HOME/.cargo/env"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sebastiansteenssoe/.cache/lm-studio/bin"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

eval "$(starship init zsh)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
