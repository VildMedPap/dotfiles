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

# If any error message appear (e.g. file doesn't exist) redirects to /dev/null,
# which is a special file that discards all data written to it.
source ~/powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
source ~/.p10k.zsh 2>/dev/null

# Prevent Python from writing bytecode files
export PYTHONDONTWRITEBYTECODE=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<