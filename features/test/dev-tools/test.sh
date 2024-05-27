#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

# shellcheck disable=SC2016
check "/wp/wp-content/mu-plugins/dev-env-plugin.php exists" test -f /wp/wp-content/mu-plugins/dev-env-plugin.php

reportResults
