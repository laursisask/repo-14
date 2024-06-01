#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

source /etc/os-release
check 'crond exists' which crond
check "crontab exists" which crontab
check "crontab has setuid or setgid bit" sh -c "stat -L -c %A /usr/bin/crontab | grep -F s"

reportResults
