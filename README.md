# dotfiles

## Philosophy

I agree with @[anishathalye] that ["Dotfiles Are Not Meant to Be Forked"](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/). Most likely my personal preferences may not suit you. And even if it does, it's recommended to draw inspirations from my dotfiles rather than forking directly.

## Constraints

- My dotfiles shall take care of both initial installation of core packages and day-to-day backup of configurations.
- It should be as easy as possible to set up a brand new machine.
- I need a profile system to specify different configurations for different hosts.

## Design

Not only do I agree with @[anishathalye]'s philosophy, I also find the tool [Dotbot] created by him suitable for my needs. My system is built on top of [Dotbot] with a modified install script to support a profile system.

### Profile system

There are several files named like `pf.a.b._.yaml` in subdirectories, which are the profile files. In this example, the profile name is `pf.a.b`. It's parent profile is `pf.a`, whose parent profile is `pf`, which is the root profile. All configurations in a parent profile goes into the child profiles automatically. When given a profile name, [`install.py`](install.py) would combine all the relevant profile files into a single final configuration file named `final.pf.a.b.yaml` in this example. Then [Dotbot] takes over to process this final configuration file.

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

## Notes

### Linking failures

The install script tries to link dotfiles to the home directory. When there are already dotfiles in the home directory, the install script would say:

```
{some dotfile} already exists but is a regular file or directory
```

In this case, it is up to you to backup or remove the previous dotfiles and run the install script again.

[anishathalye]: https://github.com/anishathalye
[Dotbot]: https://github.com/anishathalye/dotbot
