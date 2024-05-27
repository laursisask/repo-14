#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "VIP CLI exists" which vip
check "vip-sync-db exists" test -x /usr/local/bin/vip-sync-db
check "VIP CLI can run" vip --version

reportResults
