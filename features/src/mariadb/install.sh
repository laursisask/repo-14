#!/bin/sh

set -e

PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

if [ "$(id -u || true)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

echo '(*) Installing MariaDB...'

: "${_REMOTE_USER:?"_REMOTE_USER is required"}"
: "${INSTALLDATABASETOWORKSPACES:=}"

if [ "${_REMOTE_USER}" = "root" ]; then
    MARIADB_USER=mysql
    INSTALLDATABASETOWORKSPACES=false

    echo '(!) Cannot install databases to the workspace when remoteUser is root.'
else
    MARIADB_USER="${_REMOTE_USER}"
fi

if [ "${INSTALLDATABASETOWORKSPACES}" != 'true' ]; then
    MARIADB_DATADIR=/var/lib/mysql
else
    MARIADB_DATADIR=/workspaces/mysql-data
    install -d -D -m 02755 -o "${MARIADB_USER}" -g "${MARIADB_USER}" "${MARIADB_DATADIR}"
fi

# shellcheck source=/dev/null
. /etc/os-release
: "${ID:=}"
: "${ID_LIKE:=${ID}}"

case "${ID_LIKE}" in
    "debian")
        PACKAGES="mariadb-client mariadb-server"
        if ! hash envsubst >/dev/null 2>&1; then
            PACKAGES="${PACKAGES} gettext"
        fi

        apt-get update
        # shellcheck disable=SC2086
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ${PACKAGES}
        apt-get clean
        rm -rf /var/lib/apt/lists/*
        update-rc.d -f mariadb remove

        if [ "${INSTALLDATABASETOWORKSPACES}" = 'true' ]; then
            mv /var/lib/mysql/debian-*.flag "${MARIADB_DATADIR}"
        fi
    ;;

    "alpine")
        PACKAGES="mariadb-client mariadb"
        if ! hash envsubst >/dev/null 2>&1; then
            PACKAGES="${PACKAGES} gettext"
        fi

        # shellcheck disable=SC2086
        apk add --no-cache ${PACKAGES}
    ;;

    *)
        echo "(!) Unsupported distribution: ${ID}"
        exit 1
    ;;
esac

if [ "${INSTALLDATABASETOWORKSPACES}" = 'true' ]; then
    usermod -d /workspaces/mysql mysql
    rm -rf /var/lib/mysql
fi

export MARIADB_USER
export MARIADB_DATADIR

install -D -d -m 0755 -o root -g root /etc/service /etc/sv/mariadb
# shellcheck disable=SC2016
envsubst '$MARIADB_USER $MARIADB_DATADIR' < service-run.tpl > /etc/sv/mariadb/run && chmod 0755 /etc/sv/mariadb/run
ln -sf /etc/sv/mariadb /etc/service/mariadb

echo 'Done!'
