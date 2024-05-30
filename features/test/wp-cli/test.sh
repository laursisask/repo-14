#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "wp-cli exists" test -x /usr/local/bin/wp

reportResults
