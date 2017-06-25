# dotfiles

## Features

- [Installation](#installation-method) powered by [Dotbot]. 
- [Flat topical structure](#flat-topical-structure) inspired by [holman/dotfiles].
- [Hierarchical profile structure](#hierarchical-profile-structure)

[Dotbot]: https://github.com/anishathalye/dotbot
[holman/dotfiles]: https://github.com/holman/dotfiles

### Installation method

[Dotbot] is a tool that bootstraps your dotfiles. Basically it enables you to specify how to set up your dotfiles using YAML or JSON formatted configuration files. Read its documentation for details.

In my dotfiles, the configuration files are distributed under each [topic directory](#flat-topical-structure). During installation, all the relevant configuration files of a [profile](#hierarchical-profile-structure) are combined into a single one and installed using [Dotbot].

### Flat topical structure

Like [holman/dotfiles](https://github.com/holman/dotfiles), each directory is a topic (except for some special ones). But instead of [specifying tasks according to special files](https://github.com/holman/dotfiles#components), YAML configuration files are used. Each topic could have several of those configuration files according to different [profiles](#hierarchical-profile-structure). This is a more flexible approach in the cost of having to write the configuration files explicitly. Special non-topic directories could be specified explicitly in the [install script](install.py). It would also be ignored automatically if there are not configuration files in it.

### Hierarchical profile structure

A profile is represented by a `.`-separated multi-part string. Let's use `h1.h2.h3` as an example:

- Its parent profile is `h1.h2`.
- Its configuration file is `h1.h2.h3.yaml`.
- During installation, each topic directories' configuration files will be combined into a single one first. In this case, `h1.yaml`, `h1.h2.yaml` and `h1.h2.h3.yaml` will be combined in this order. Then, configurations of different topics are combined into the final configuration file, named `final.h1.h2.h3.yaml`.

## Usage

To install a profile

```
./install.py {profile_name}
```

## My Settings

### Special directories

- [`tools`](tools)

### Global assumptions

- `~/.bash-it/custom/` is for custom bash configurations.
- `~/.gitignore/` is for individual global gitignore files.

### Profiles

- `init`: one-shot tasks, might take a while to run, like installing brew or conda
- `init.macos`
- `config`: day-to-day maintenance, should be quick to run, like linking dotfiles
- `config.macos`

### Examples

For a vanilla Mac, I would do
```
git clone --recursive https://github.com/qobilidop/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.py init.macos
./install.py config.macos
```

For day-to-day maintenance, I would do
```
./~/.dotfiles/install.py config.macos
```
