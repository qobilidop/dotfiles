#!/usr/bin/env python

from __future__ import print_function
from argparse import ArgumentParser
from glob import glob
from os import path
from subprocess import call
from tempfile import NamedTemporaryFile


# User Configurations
non_components = ['tools']

# Dotbot Configurations
dotbot = 'tools/dotbot/bin/dotbot'
plugins = [
    '--plugin-dir', 'tools/dotbot-brewfile'
]

# Path Processing
base_dir = path.dirname(path.realpath(__file__))
dotbot = path.join(base_dir, dotbot)


def main():
    parser = ArgumentParser()
    parser.add_argument('profile', type=str, default='config.macos')
    args = parser.parse_args()

    configs = collect(args.profile)
    final_config = path.join(base_dir, 'final.' + args.profile + '.yaml')
    combine(configs, final_config)
    install(final_config)


def collect(profile):
    """Collect all configuration files belong to a profile."""
    configs = []
    for component in get_components():
        configs += get_configs(component, profile)
    return configs


def get_components():
    components = ['.'] + [path.basename(p) for p in
                          glob(path.join(base_dir, '*')) if path.isdir(p)]
    components = [c for c in components if c not in non_components]
    return sorted(components)


def get_configs(component, profile):
    print('Process', component)
    configs = []
    while profile:
        to_consider = path.join(base_dir, component, profile + '.yaml')
        if path.exists(to_consider):
            print('Add', path.basename(to_consider))
            configs += [to_consider]
        profile = profile[:profile.rfind('.')]
    print()
    return configs


def combine(configs, final_config):
    """Combine individual configuration files into a single final one."""
    with open(final_config, 'w+') as fc:
        for config in configs:
            with open(config, 'r') as c:
                # Comment the origin of following configurations
                fc.write('# ' + path.relpath(config, base_dir) + '\n')
                # Copy the configurations
                fc.writelines(c.readlines())
                fc.write('\n')
    print('Combine into', path.basename(final_config))


def install(config):
    """Use Dotbot to install according to configuration."""
    print('Install')
    call([dotbot, '-d', base_dir] + plugins + ['-c', config])

if __name__ == '__main__':
    main()
