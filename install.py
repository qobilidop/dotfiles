#!/usr/bin/env python
"""Install script."""

from __future__ import print_function

from argparse import ArgumentParser
from glob import glob
from os import path
from subprocess import call

# Dotbot Configurations
DOTBOT = 'extern/dotbot/bin/dotbot'
PLUGINS = ['-p', 'extern/dotbot-env/env.py']

# Path Processing
BASE_DIR = path.dirname(path.realpath(__file__))
DOTBOT = path.join(BASE_DIR, DOTBOT)


def main():
    """Main logic."""
    parser = ArgumentParser()
    parser.add_argument('--profile', '-p', type=str, default=None)
    args = parser.parse_args()

    # Determine local profile
    local_profile_record = path.join(BASE_DIR, 'profile.local')
    if args.profile is None:
        with open(local_profile_record) as f:
            local_profile = f.read()
    else:
        local_profile = args.profile
        with open(local_profile_record, 'w') as f:
            f.write(local_profile)

    # Assemble final config
    print('Use profile:', local_profile)
    profile_file = path.join(BASE_DIR, 'profile', local_profile)
    configs = []
    with open(profile_file) as f:
        for line in f:
            config = line.strip()
            if config and not config.startswith('#'):
                print('Add config:', config)
                configs.append(config)
    final_config_file = path.join(BASE_DIR, 'config.yaml')
    with open(final_config_file, 'w') as f_out:
        for config in configs:
            config_file = path.join(BASE_DIR, 'config', config, 'config.yaml')
            with open(config_file) as f_in:
                f_out.write('# ' + config + '\n')
                f_out.writelines(f_in.readlines())
                f_out.write('\n')

    # Install
    print('Install')
    call([DOTBOT, '-d', BASE_DIR] + PLUGINS + ['-c', final_config_file])


if __name__ == '__main__':
    main()
