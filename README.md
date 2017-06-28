# dotfiles

[![Build Status](https://travis-ci.org/qobilidop/dotfiles.svg?branch=master)](https://travis-ci.org/qobilidop/dotfiles)

## Installation

Installation is powered by [Dotbot], which is called in [install.py]()

### Main procedure

```
git clone --recursive git@github.com:qobilidop/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.py config.macos  # or other profile defined
```

#### Notes on linking failures

The install script tries to link dotfiles to the home directory. When there are already dotfiles in the home directory, the install script will say:

```
{some dotfile} already exists but is a regular file or directory
```

In this case, it is up to you to backup or remove the previous dotfiles and run the install script again.

### Local configurations

I have separated out my local configurations such as my GitHub username and email into a [separate repository](https://github.com/qobilidop/dotfiles-local). Here I use it in an example. Remember to replace it by your own.

```
cd ~/.dotfiles
git clone git@github.com:qobilidop/dotfiles-local.git local
./install.py config.macos  # or other profile defined
```

## Organization

### Topics

Configurations are grouped into topics, including the following:
- [editor]()
- [os]()
- [pm](): package manager
- [shell]()
- [terminal]()
- [vcs](): version control system

### Profiles

Within each topic directory, there are configuration files named `{profile_name}.yaml`. `profile_name` is hierarchical, such `config.macos`. For this profile, its parent profile is `config`. Configurations in the parent profiles go into the child profile automatically. And child profile overwrites parent profile.

I have defined the following profiles:
- `config`
- `config.linux`
- `config.linux.tscc`: for my account on [TSCC](http://www.sdsc.edu/support/user_guides/tscc.html)
- `config.macos`

If you want to understand the configuration files or define new ones, go read some [Dotbot] documentation.

### Other directories

- [bin]() will be added into `PATH`.
- [tool]() contains [Dotbot]() as a submodule.

## Acknowledgement

I have drawn inspirations and learned from many people's dotfiles including (in alphabetical order):

- [alrra/dotfiles](https://github.com/alrra/dotfiles)
- [anishathalye/dotfiles](https://github.com/anishathalye/dotfiles)
- [holman/dotfiles](https://github.com/holman/dotfiles)
- [vsund/dotfiles](https://github.com/vsund/dotfiles)
- [ooJerryLeeoo/dotfiles](https://github.com/ooJerryLeeoo/dotfiles)

Most importantly, [Dotbot] makes it much easier to install and maintain dotfiles.

[Dotbot]: https://github.com/anishathalye/dotbot
