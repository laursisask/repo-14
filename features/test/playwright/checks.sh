#!/bin/bash

check "playwright-core exists and is executable" which playwright-core
check "node exists and is executable" which node
check "npm exists and is executable" which npm

check "Smoke test" playwright-core --version

# Microsoft's base images contain zsh. We don't want to run this check for MS images because we have no control over the installed services.
if test -d /etc/rc2.d && ! test -e /usr/bin/zsh; then
    dir="$(ls -1 /etc/rc2.d)"
    check "/etc/rc2.d is empty" test -z "${dir}"
fi
