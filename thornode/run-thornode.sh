#!/bin/sh

set -o pipefail

. "$(dirname "$0")/core.sh"

if [ ! -f ~/.thornode/config/genesis.json ]; then
  init_chain
  rm -rf ~/.thornode/config/genesis.json # set in thornode render-config
fi

# render tendermint and cosmos configuration files
thornode render-config

export SIGNER_NAME
export SIGNER_PASSWD
exec thornode start
