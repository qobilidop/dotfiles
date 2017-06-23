# dotfiles

- General structure inspired by [holman/dotfiles](https://github.com/holman/dotfiles).
- Installation powered by [Dotbot](https://github.com/anishathalye/dotbot), with the [brewfile plugin](https://github.com/sobolevn/dotbot-brewfile). 
- Idea of profiles borrowed from [vsund/dotfiles](https://github.com/vsund/dotfiles), and modified to my personal taste.

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
