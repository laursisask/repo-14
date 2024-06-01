#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "sshd exists" which sshd
check "/etc/sv/openssh/run exists and is executable" test -x /etc/sv/openssh/run
check "/etc/service/openssh is a symlink" test -L /etc/service/openssh

if [[ "$(id -u || true)" -eq 0 ]]; then
    check "/etc/ssh/sshd_config.d/permit_root_login.conf exists" test -f /etc/ssh/sshd_config.d/permit_root_login.conf
fi

reportResults
