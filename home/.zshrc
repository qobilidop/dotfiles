# oh-my-zsh init
# https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template
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
. "$SPACK_ROOT"/share/spack/setup-env.sh

# nvm
# https://github.com/nvm-sh/nvm#git-install
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
