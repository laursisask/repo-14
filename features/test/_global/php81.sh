#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "Built successfully" sh -c "exit 0"

reportResults
