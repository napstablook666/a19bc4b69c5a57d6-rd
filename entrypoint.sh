#!/bin/sh
set -eu

export TGNAS_LISTEN=":${PORT:-10000}"
exec tgnas -c /app/config.yaml
