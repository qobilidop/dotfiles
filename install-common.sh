set -e

BASE_CONFIG="base"
CONFIG_SUFFIX=".yaml"

META_DIR="meta"
CONFIG_DIR="configs"
PROFILES_DIR="profiles"

DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PLUGIN="--plugin-dir meta/dotbot-brewfile"


cd "${BASE_DIR}"
git submodule update --init --recursive
