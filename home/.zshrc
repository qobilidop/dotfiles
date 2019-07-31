export EDITOR="code"
export LOCAL="$HOME/.local"
export PATH="$LOCAL/bin:$PATH"

# oh-my-zsh init
# https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template
export ZSH="$LOCAL/opt/oh-my-zsh"
plugins=(
    git
)
ZSH_THEME="spaceship-prompt/spaceship"
source "$ZSH"/oh-my-zsh.sh

# conda init
# https://docs.conda.io/projects/conda/en/latest/release-notes.html#recommended-change-to-enable-conda-in-your-shell
. "$(brew --prefix)"/miniconda3/etc/profile.d/conda.sh
conda activate lab

# spack init
# https://spack.readthedocs.io/en/latest/getting_started.html#add-spack-to-the-shell
export SPACK_ROOT="$LOCAL/opt/spack"
. "$SPACK_ROOT"/share/spack/setup-env.sh

# nvm
# https://github.com/nvm-sh/nvm#git-install
export NVM_DIR="$LOCAL/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
