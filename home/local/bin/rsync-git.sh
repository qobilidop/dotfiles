#!/usr/bin/env bash
# 
# Rsync a git repository
#
# Usage:
#
# $ rsync-git.sh SRC DST
#
set -e

src="$1"
dst="$2"

cmd="rsync -amvzK --update --delete-after --filter=':- .gitignore' --exclude='.git' '$src' '$dst'"
echo "$cmd"
eval "$cmd --dry-run"
echo "Run?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) eval "$cmd"; break;;
        No ) exit;;
    esac
done
