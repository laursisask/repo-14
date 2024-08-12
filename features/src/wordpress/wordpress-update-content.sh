#!/bin/sh

if [ -f composer.json ] && [ -x /usr/local/bin/composer ]; then
    /usr/local/bin/composer install -n || true
fi

if [ -f package.json ] && hash npm > /dev/null 2>&1; then
    if [ ! -d node_modules ] && [ -f package-lock.json ]; then
        npm ci
    else
        npm install
    fi
fi
