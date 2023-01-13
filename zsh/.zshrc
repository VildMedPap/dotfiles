# neofetch info
neofetch

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="avit"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions docker docker-compose zsh-docker-aliases alias-tips zsh-syntax-highlighting rustup zsh-cargo-completion)
source $ZSH/oh-my-zsh.sh

# ALIASES

# Conda aliases
alias cact='conda activate'
alias cdeact='conda deactivate'
alias cls='conda list'
alias cels='conda env list'
alias ccen='conda create --name'
alias conup='conda update'
alias conin='conda install'

# Docker shortcuts
alias dkdang='dkrmi -f $(docker images -f "dangling=true" -q)'

# Zsh
alias zshconfig="code ~/.zshrc"
alias zshexec="exec zsh"

# Misc
alias c=clear
alias jp="jupyter-lab"
alias timestamp="date -u +'%Y-%m-%dT%H:%M:%SZ'"
alias dad="curl https://icanhazdadjoke.com/ && echo"

# Custom functions
wttr() {
    local city=$1
    shift 1
    curl "wttr.in/$city?M"
}


if hash fd fzf bat &>/dev/null; then
    cddir() {
        folder=$(fd --type d . $HOME|fzf --height 50% --border --exact)

        if [ -n "$folder" ]; then
        cd $folder
        fi
    }

    opendir() {
        folder=$(fd --type d . $HOME|fzf --height 50% --border --exact)

        if [ -n "$folder" ]; then
        open $folder
        fi
    }

    codedir() {
        folder=$(fd --type d . $HOME|fzf --height 50% --border --exact)

        if [ -n "$folder" ]; then
        code $folder
        fi
    }

    stdoutfile() {
        bat $(fzf --height 50% --border --preview 'bat --color=always {}' --exact)
    }
else
    echo "One or more of the following clis are missing: fd, fzf, bat"
fi

# If any error message appear (e.g. file doesn't exist) redirects to /dev/null,
# which is a special file that discards all data written to it.
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
source ~/.p10k.zsh 2>/dev/null

# Prevent Python from writing bytecode files
export PYTHONDONTWRITEBYTECODE=1

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
