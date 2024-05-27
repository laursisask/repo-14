#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

check "su-exec exists" which su-exec

reportResults
