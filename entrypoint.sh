#!/bin/sh
set -eu

export TGNAS_LISTEN=":${PORT:-10000}"
echo "tgnas boot: listen=${TGNAS_LISTEN} metadata_driver=postgres"
for name in TGNAS_SECRET_KEY TGNAS_TELEGRAM_BOT_TOKEN TGNAS_TELEGRAM_CHAT_ID TGNAS_POSTGRES_URL; do
	if [ -n "$(eval "printf '%s' \"\${$name:-}\"")" ]; then
		echo "tgnas boot: ${name}=set"
	else
		echo "tgnas boot: ${name}=missing"
	fi
done

exec tgnas -debug -c /app/config.yaml
