#!/bin/bash

check "/tmp/wordpress exists and is a directory" test -d /tmp/wordpress
check "/tmp/wordpress-tests-lib exists and is a directory" test -d /tmp/wordpress-tests-lib

dir="$(ls -1 /usr/src/wordpress)"
check "/usr/src/wordpress is not empty" test -n "${dir}"
