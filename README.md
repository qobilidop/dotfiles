# dotfiles
My dotfiles bootstrapped by [Dotbot](https://github.com/anishathalye/dotbot)

## Usage

For the first time:
```bash
git clone --recurse-submodules https://github.com/qobilidop/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.py -p {profile}
```
where `{profile}` could be `hpc`, `macos` etc.

Later on, simply use:
```bash
./install.py
```
