#!/bin/sh
set -euxo pipefail

if [ -n "${GENESIS_FILE-}" ]; then
	geth init "$GENESIS_FILE"
fi

exec geth $@
