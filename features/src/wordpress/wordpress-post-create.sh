#!/bin/sh


if [ -f composer.json ] && [ -x /usr/local/bin/composer ]; then
    MY_UID="$(id -un)"
    if [ 0 -eq "${MY_UID}" ]; then
        export COMPOSER_ALLOW_SUPERUSER=1
    fi

    /usr/local/bin/composer install -n || true
fi

if [ ! -f "${HOME}/.local/share/vip-codespaces/login/010-wplogin.sh" ]; then
    /usr/local/bin/setup-wordpress.sh
fi
