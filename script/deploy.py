#!/usr/bin/python3
from argparse import ArgumentParser
from pathlib import Path
from subprocess import run

ROOT = Path(__file__).parent.parent.absolute()
STOW_CMD = 'stow --no-folding --ignore=install.sh'

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('target_dir', type=Path)
    args = parser.parse_args()

    target_dir = args.target_dir.expanduser().absolute()
    target_dir.mkdir(parents=True, exist_ok=True)

    for group in sorted((ROOT / 'package').iterdir()):
        print(f'Deploy {group.name}:')
        for package in sorted(group.iterdir()):
            if not package.is_dir():
                continue
            print(f'  {package.name}')
            cmd = f'{STOW_CMD} -t {target_dir} {package.name}'
            run(cmd, cwd=package.parent, shell=True, check=True)
