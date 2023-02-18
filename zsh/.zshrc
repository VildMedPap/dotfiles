# neofetch info
neofetch

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit

ZSH_THEME="avit"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions docker docker-compose zsh-docker-aliases alias-tips zsh-syntax-highlighting rustup zsh-cargo-completion)
source $ZSH/oh-my-zsh.sh
eval "$(register-python-argcomplete pipx)"

# ALIASES

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
        folder=$(fd --type d . $HOME | fzf --height 50% --border --exact)
        
        if [ -n "$folder" ]; then
            cd $folder
        fi
    }
    
    opendir() {
        folder=$(fd --type d . $HOME | fzf --height 50% --border --exact)
        
        if [ -n "$folder" ]; then
            open $folder
        fi
    }
    
    codedir() {
        folder=$(fd --type d . $HOME | fzf --height 50% --border --exact)
        
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
source ~/powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
source ~/.p10k.zsh 2>/dev/null

# Prevent Python from writing bytecode files
export PYTHONDONTWRITEBYTECODE=1

# Created by `pipx` on 2023-02-14 09:12:46
export PATH="$PATH:/Users/sebastiansteenssoe/.local/bin"

# Manually added
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
