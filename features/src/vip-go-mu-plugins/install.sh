#!/bin/sh

set -e

PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

if [ "$(id -u || true)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

: "${_REMOTE_USER:?"_REMOTE_USER is required"}"
: "${ENABLED:=}"
: "${BRANCH:=staging}"
: "${DEVELOPMENT_MODE:=false}"

if [ "${ENABLED}" != "false" ]; then
    echo '(*) Installing VIP Go mu-plugins...'

    mkdir -p /wp/wp-content/mu-plugins
    git clone --depth=1 --recurse-submodules --shallow-submodules https://github.com/Automattic/vip-go-mu-plugins.git /tmp/mu-plugins --branch "${BRANCH}" --single-branch -j4
    git clone --depth=1 https://github.com/Automattic/vip-go-mu-plugins-ext.git /tmp/mu-plugins-ext --single-branch
    if [ "${DEVELOPMENT_MODE}" != 'true' ]; then
        rsync -a /tmp/mu-plugins/ /tmp/mu-plugins-ext/ /wp/wp-content/mu-plugins --exclude-from="/tmp/mu-plugins/.dockerignore" --exclude-from="/tmp/mu-plugins-ext/.dockerignore"
        find /wp/wp-content/mu-plugins \( -name .svn -o -name .github -o -name ".git*" \) -type d -exec rm -rfv {} \; 2> /dev/null
    else
        rsync -a /tmp/mu-plugins/ /tmp/mu-plugins-ext/ /wp/wp-content/mu-plugins
    fi

    rm -rf /tmp/mu-plugins /tmp/mu-plugins-ext

    chown -R "${_REMOTE_USER}:${_REMOTE_USER}" /wp/wp-content/mu-plugins
    echo 'Done!'
fi
