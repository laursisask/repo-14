#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

# shellcheck disable=SC2016
check "PAGER is set" sh -c 'echo "${PAGER}" | grep -q "less"'
check "${HOME}/.local/share/vip-codespaces exists" test -d "${HOME}/.local/share/vip-codespaces"
check "${HOME}/.local/share/vip-codespaces/login exists" test -d "${HOME}/.local/share/vip-codespaces/login"
check "${HOME}/.local/share/vip-codespaces/login/001-welcome.sh exists" test -f "${HOME}/.local/share/vip-codespaces/login/001-welcome.sh"

reportResults
