#!/bin/bash

check "mariadb is running" sudo sh -c 'sv status mariadb | grep -E ^run:'
sudo sv stop mariadb
check "mariadb is stopped" sudo sh -c 'sv status mariadb | grep -E ^down:'
sudo sv start mariadb

# Microsoft's base images contain zsh. We don't want to run this check for MS images because we have no control over the installed services.
if test -d /etc/rc2.d && ! test -e /usr/bin/zsh; then
    dir="$(ls -1 /etc/rc2.d)"
    check "/etc/rc2.d is empty" test -z "${dir}"
fi
