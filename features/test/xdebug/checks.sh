#!/bin/bash

check "XDebug is available" sh -c 'php -m | grep -i xdebug'
check "xdebug-set-mode is executable" test -x /usr/local/bin/xdebug-set-mode
check "xdebug-disable is executable" test -x /usr/local/bin/xdebug-disable

sudo xdebug-set-mode develop
check "xdebug.mode is develop (cli)" sh -c 'php -i | grep -E "^xdebug\.mode => develop => develop"'
check "xdebug.mode is develop (fpm)" sh -c 'php-fpm -i | grep -E "^xdebug\.mode => develop => develop"'

sudo xdebug-set-mode trace,profile
check "xdebug.mode is trace,profile (cli)" sh -c 'php -i | grep -E "^xdebug\.mode => trace,profile => trace,profile"'
check "xdebug.mode is trace,profile (fpm)" sh -c 'php-fpm -i | grep -E "^xdebug\.mode => trace,profile => trace,profile"'

sudo xdebug-set-mode off
check "xdebug.mode is off (cli)" sh -c 'php -i | grep -E "^xdebug\.mode => off => off"'
check "xdebug.mode is off (fpm)" sh -c 'php-fpm -i | grep -E "^xdebug\.mode => off => off"'
