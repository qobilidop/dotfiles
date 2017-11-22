# dotfiles

## Constraints

Below are the constraints for my dotfiles:
- There are two tasks: initial installation of core packages and day-to-day configuration tweaking.
- To set up a brand new machine (Linux or maxOS) for work should be just one command.
- Natually I would need a profile system to specify different configuration for different host.

## Solution

[Dotbot] comes to the rescue. It's versatile enough to tackle both the installation and the configuration. It's neat enough to run as a single command. I have tweaked the install script to support a profile system. And all the constaints are satisfied!

## Disclaimer

This repository is meant to work out-of-the-box only for myself. It's recommended that you draw inspirations from this repo rather than using it directly.

## Usage

```bash
git clone --recursive https://github.com/qobilidop/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.py pf.local.macos  # or other profile defined
```

## Notes

### Linking failures

The install script tries to link dotfiles to the home directory. When there are already dotfiles in the home directory, the install script will say:

```
{some dotfile} already exists but is a regular file or directory
```

In this case, it is up to you to backup or remove the previous dotfiles and run the install script again.

### Local configurations

I have separated out my local configurations such as my GitHub username and email into a [separate repository](https://github.com/qobilidop/dotfiles-local). Here I use it in an example. Remember to replace it by your own.

```bash
cd ~/.dotfiles
git clone https://github.com/qobilidop/dotfiles-local.git local
./install.py pf.local.macos  # or other profile defined
```

### Optional procedures

For servers I have access to, I would do

```sh
authorize_github_key qobilidop
```

to add my public ssh key.

[Dotbot]: https://github.com/anishathalye/dotbot
