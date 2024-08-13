#!/bin/sh

PATH=/bin:/sbin:/usr/bin:/usr/sbin

set -eu
exec 2>&1

# shellcheck disable=SC2154
export USER="${_REMOTE_USER}"
export LOGNAME="${USER}"
# shellcheck disable=SC2155
export HOME="$(getent passwd "${USER}" | cut -d: -f6)"

exec chpst -u "${USER}:${USER}" \
    /usr/local/bin/easy-novnc -a :5800 -h 127.0.0.1 --no-url-password
