#!/bin/sh

set -e

PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

if [ "$(id -u || true)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

: "${_REMOTE_USER:?"_REMOTE_USER is required"}"
: "${ENABLED:=}"

if [ "${ENABLED}" = "true" ]; then
    echo '(*) Installing Mailpit...'

    # shellcheck source=/dev/null
    . /etc/os-release

    : "${ID:=}"
    : "${ID_LIKE:=${ID}}"
    PHP_INI_DIR=
    NEED_ENMOD=

    case "${ID_LIKE}" in
        "debian")
            PACKAGES=""
            if ! hash curl >/dev/null 2>&1; then
                PACKAGES="${PACKAGES} curl"
            fi

            if ! hash update-ca-certificates >/dev/null 2>&1; then
                PACKAGES="${PACKAGES} ca-certificates"
            fi

            if ! hash envsubst >/dev/null 2>&1; then
                PACKAGES="${PACKAGES} gettext"
            fi

            if [ -n "${PACKAGES}" ]; then
                apt-get update
                # shellcheck disable=SC2086
                apt-get install -y --no-install-recommends ${PACKAGES}
            fi

            apt-get clean
            rm -rf /var/lib/apt/lists/*

            if hash php >/dev/null 2>&1; then
                PHP_INI_DIR="/etc/php/$(php -r 'echo PHP_MAJOR_VERSION, ".", PHP_MINOR_VERSION;')/mods-available"
                NEED_ENMOD=1
            fi
        ;;

        "alpine")
            PACKAGES=""
            if ! hash curl >/dev/null 2>&1; then
                PACKAGES="${PACKAGES} curl"
            fi

            if ! hash envsubst >/dev/null 2>&1; then
                PACKAGES="${PACKAGES} gettext"
            fi

            if [ -n "${PACKAGES}" ]; then
                # shellcheck disable=SC2086
                apk add --no-cache ${PACKAGES}
            fi

            if hash php >/dev/null 2>&1; then
                PHP_INI_DIR="/etc/php$(php -r 'echo PHP_MAJOR_VERSION, PHP_MINOR_VERSION;')/conf.d"
            fi
        ;;

        *)
            echo "(!) Unsupported distribution: ${ID}"
            exit 1
        ;;
    esac

    ARCH="$(arch)"
    LATEST=$(curl -w '%{url_effective}' -I -L -s -S https://github.com/axllent/mailpit/releases/latest -o /dev/null | sed -e 's|.*/||')
    if [ "${ARCH}" = "arm64" ] || [ "${ARCH}" = "aarch64" ]; then
        ARCH="arm64"
    elif [ "${ARCH}" = "x86_64" ] || [ "${ARCH}" = "amd64" ]; then
        ARCH="amd64"
    else
        echo "(!) Unsupported architecture: ${ARCH}"
        exit 1
    fi

    mkdir -p /tmp/mailpit
    ( \
        cd /tmp/mailpit && \
        curl -SL "https://github.com/axllent/mailpit/releases/download/${LATEST}/mailpit-linux-${ARCH}.tar.gz" | tar -xz && \
        install -m 0755 -o root -g root mailpit /usr/local/bin/mailpit && \
        rm -rf /tmp/mailpit \
    )

    if [ -n "${PHP_INI_DIR}" ]; then
        install -m 0644 php-mailpit.ini "${PHP_INI_DIR}/mailpit.ini"
        if [ -n "${NEED_ENMOD}" ]; then
            phpenmod mailpit
        fi
    fi

    install -D -m 0755 -o root -g root service-run /etc/sv/mailpit/run
    install -d -m 0755 -o root -g root /etc/service
    ln -sf /etc/sv/mailpit /etc/service/mailpit

    # shellcheck disable=SC2016
    envsubst '$_REMOTE_USER' < conf-mailpit.tpl > /etc/conf.d/mailpit

    echo 'Done!'
fi
