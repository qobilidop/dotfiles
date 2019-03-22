export PATH="$HOME/local/bin:$PATH"

# oh-my-zsh config
# https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template
export ZSH="$HOME/local/opt/oh-my-zsh"
plugins=(
    git
)

# powerlevel9k theme
# https://github.com/bhilburn/powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE=nerdfont-complete
export DEFAULT_USER="$USER"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ssh anaconda time)
POWERLEVEL9K_ANACONDA_BACKGROUND=green
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# oh-my-zsh init
source "$ZSH"/oh-my-zsh.sh

# miniconda
# https://docs.conda.io/projects/conda/en/latest/release-notes.html#id105
. "$(brew --prefix)"/miniconda3/etc/profile.d/conda.sh
conda activate base

# direnv
eval "$(direnv hook zsh)"
