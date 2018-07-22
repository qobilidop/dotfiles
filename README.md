# dotfiles
My dotfiles bootstrapped by [Dotbot](https://github.com/anishathalye/dotbot)

## Usage

The first, a profile needs to be specified:
```bash
git clone --recurse-submodules https://github.com/qobilidop/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.py -p {profile}
```
where `{profile}` could be `hpc`, `macos` etc.

Later on, since the local profile is recorded, simply do:
```bash
./install.py
```
