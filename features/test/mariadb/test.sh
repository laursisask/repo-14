#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "mysqld exists" which mysqld
check "/etc/sv/mariadb/run exists and is execuatble" test -x /etc/sv/mariadb/run
check "/etc/service/mariadb is a symlink" test -L /etc/service/mariadb

reportResults
