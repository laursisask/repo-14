#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "subversion is installed" which svn
check "unzip is installed" which unzip
check "jq is installed" which jq
check "curl is installed" which curl

check "/usr/src/wordpress exists and is a directory" test -d /usr/src/wordpress
check "/usr/local/bin/setup-wptl exists and is executable" test -x /usr/local/bin/setup-wptl
check "/usr/local/bin/use-wptl exists and is executable" test -x /usr/local/bin/use-wptl

# Microsoft's base images contain zsh. We don't want to run this check for MS images because we have no control over the installed services.
if test -d /etc/rc2.d && ! test -e /usr/bin/zsh; then
    dir="$(ls -1 /etc/rc2.d)"
    check "/etc/rc2.d is empty" test -z "${dir}"
fi

reportResults
