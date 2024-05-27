#!/bin/sh

set -e

PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

if [ "$(id -u || true)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

: "${_REMOTE_USER:?"_REMOTE_USER is required"}"

HOME_DIR="$(getent passwd "${_REMOTE_USER}" | cut -d: -f6)"

install -d -D -m 0755 -o "${_REMOTE_USER}" -g "${_REMOTE_USER}" "${HOME_DIR}/.local/share/vip-codespaces"
install -d -D -m 0755 -o "${_REMOTE_USER}" -g "${_REMOTE_USER}" "${HOME_DIR}/.local/share/vip-codespaces/login"

install -m 0644 -o "${_REMOTE_USER}" -g "${_REMOTE_USER}" .bashrc "${HOME_DIR}/.bashrc"
install -m 0644 -o "${_REMOTE_USER}" -g "${_REMOTE_USER}" 001-welcome.sh "${HOME_DIR}/.local/share/vip-codespaces/login/001-welcome.sh"
