#!/bin/sh

PATH=/bin:/sbin:/usr/bin:/usr/sbin

set -eu
exec 2>&1

# shellcheck disable=SC2154
exec chpst -u "${_REMOTE_USER}:${_REMOTE_USER}" \
    /usr/local/bin/easy-novnc -a :5800 -h 127.0.0.1 --no-url-password
