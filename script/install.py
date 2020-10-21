#!/usr/bin/python3
from argparse import ArgumentParser
from pathlib import Path
from subprocess import run

ROOT = Path(__file__).parent.parent.absolute()

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('group_dir', type=Path)
    args = parser.parse_args()

    group_dir = args.group_dir.expanduser().absolute()

    brewfile = (group_dir / 'Brewfile').absolute()
    if brewfile.exists():
        cmd = f"brew bundle -v --file={brewfile.name}"
        run(cmd, cwd=brewfile.parent, shell=True, check=True)

    for package in sorted(group_dir.iterdir()):
        install_script = (package / 'install.sh').absolute()
        if not install_script.exists():
            continue
        print(f'Install {package.name}')
        cmd = f'zsh {install_script.name}'
        run(cmd, cwd=install_script.parent, shell=True, check=True)
