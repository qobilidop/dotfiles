# dotfiles

## About

- Personal information is included. Do not use out of the box.
- Install scripts are powered by [Dotbot](https://github.com/anishathalye/dotbot), with the [brewfile plugin](https://github.com/sobolevn/dotbot-brewfile).
- Inspirations for repository strcuture are drawn from [vsund/dotfiles](https://github.com/vsund/dotfiles) and [vbrandl/dotfiles](https://github.com/vbrandl/dotfiles).
- [Bash-it](https://github.com/Bash-it/bash-it) is used for bash configurations.

## Usage

### For a brand new Mac

```
./install-profile macos macos_init
```

### Update on a Mac

```
./install-profile macos
```

## Global Assumptions

- `~/.bash-it/custom/` is for custom bash configurations.
- `~/.gitignore/` is for individual global gitignore files.
