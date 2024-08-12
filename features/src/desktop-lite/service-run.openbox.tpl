#!/bin/sh

PATH=/bin:/sbin:/usr/bin:/usr/sbin

set -eu
exec 2>&1

sv start tigervnc || true

export DISPLAY=:0
# shellcheck disable=SC2154
exec chpst -u "${_REMOTE_USER}:${_REMOTE_USER}" /usr/bin/openbox
