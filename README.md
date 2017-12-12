# dotfiles

## Usage

On my Mac:
```bash
git clone --recursive https://github.com/qobilidop/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/qobilidop/dotfiles-local.git local
./install.py pf.local.macos
```

On a remote server:
```bash
git clone --recursive https://github.com/qobilidop/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/qobilidop/dotfiles-local.git local
./install.py pf.remote
```
