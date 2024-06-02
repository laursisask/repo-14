#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "rsync is executable" which rsync
check "git is executable" which git
check "/wp/wp-content/mu-plugins is a directory" test -d /wp/wp-content/mu-plugins

if [ -d /etc/rc2.d ] && ! test -e /usr/bin/zsh; then
    dir="$(ls -1 /etc/rc2.d)"
    check "/etc/rc2.d is empty" test -z "${dir}"

    if ! test -z "${dir}" ; then
        ls -1 /etc/rc2.d
    fi
fi

reportResults
