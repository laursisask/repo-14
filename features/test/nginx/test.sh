#!/bin/bash

# shellcheck source=/dev/null
source dev-container-features-test-lib

ME=$(whoami)

check "nginx exists" which nginx
check "nginx can run" nginx -V
if [[ "${ME}" = 'root' ]]; then
    check "nginx configuration is valid" nginx -t
else
    check "nginx configuration is valid" sudo nginx -t
fi

check "/etc/sv/nginx/run exists and is executable" test -x /etc/sv/nginx/run
check "/etc/service/nginx is a symlink" test -L /etc/service/nginx

reportResults
