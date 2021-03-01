#!/usr/bin/env sh
set -eu

export RPC_PORT="${RPC_PORT:-8545}"
export TM_PORT="${TM_PORT:-9001}"
export AUTHORIZATION=$(echo -n "${USERNAME}:${PASSWORD}" | base64 | tr -d \\n)

envsubst '${RPC_PORT} ${RPC_ENDPOINT} ${TM_PORT} ${TM_ENDPOINT} ${AUTHORIZATION}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
