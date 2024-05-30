#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

# shellcheck disable=SC2016
check "mailpit exists and is executable" test -x /usr/local/bin/mailpit
check "/etc/sv/mailpit/run exists and is execuatble" test -x /etc/sv/mailpit/run
check "/etc/service/mailpit is a symlink" test -L /etc/service/mailpit

reportResults
