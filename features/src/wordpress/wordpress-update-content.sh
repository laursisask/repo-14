#!/bin/sh

if [ -f composer.json ] && [ -x /usr/local/bin/composer ]; then
    MY_UID="$(id -un)"
    if [ 0 -eq "${MY_UID}" ]; then
        export COMPOSER_ALLOW_SUPERUSER=1
    fi

    /usr/local/bin/composer install -n || true
fi

if [ -f package.json ] && hash npm >/dev/null 2>&1; then
    if [ ! -d node_modules ] && [ -f package-lock.json ]; then
        npm ci
    else
        npm install
    fi
fi
