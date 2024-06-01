#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "memcached exists" which memcached
check "/etc/sv/memcached/run exists and is executable" test -x /etc/sv/memcached/run
check "/etc/service/memcached is a symlink" test -L /etc/service/memcached

reportResults
