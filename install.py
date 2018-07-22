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
    if args.profile is None:
        local_profile_record = path.join(BASE_DIR, 'profile', 'local')
        with open(local_profile_record) as f:
            local_profile = f.read()
    else:
        local_profile = args.profile
        local_profile_record = path.join(BASE_DIR, 'profile', 'local')
        with open(local_profile_record, 'w') as f:
            f.write(local_profile)

    # Run dotbot
    print('Install profile:', local_profile)
    configs = collect(local_profile)
    final_config = path.join(BASE_DIR, 'profile', 'final.yaml')
    combine(configs, final_config)
    install(final_config)


def collect(profile):
    """Collect all configuration files belong to a profile."""
    configs = []
    while profile:
        to_consider = path.join(BASE_DIR, 'profile', profile + '.yaml')
        if path.exists(to_consider):
            print('Add', path.basename(to_consider))
            configs.insert(0, to_consider)
        profile = profile[:profile.rfind('+')]
    print('All configs collected')
    return configs


def combine(configs, final_config):
    """Combine individual configuration files into a single final one."""
    with open(final_config, 'w+') as fc:
        for config in configs:
            with open(config, 'r') as c:
                # Comment the origin of following configurations
                fc.write('# ' + path.basename(config) + '\n')
                # Copy the configurations
                fc.writelines(c.readlines())
                fc.write('\n')
    print('Combine into', path.basename(final_config))


def install(config):
    """Use Dotbot to install according to configuration."""
    print('Install')
    call([DOTBOT, '-d', BASE_DIR] + PLUGINS + ['-c', config])


if __name__ == '__main__':
    main()
