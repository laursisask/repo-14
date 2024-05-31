#!/vin/bash

check 'php-fpm is running' sudo sh -c 'sv status php-fpm | grep -E ^run:'
check 'mailpit is running' sudo sh -c 'sv status mailpit | grep -E ^run:'
check 'memcached is running' sudo sh -c 'sv status memcached | grep -E ^run:'
check 'mysql is running' sudo sh -c 'sv status mariadb | grep -E ^run:'
check 'nginx is running' sudo sh -c 'sv status nginx | grep -E ^run:'
check 'elasticsearch is running' sudo sh -c 'sv status elasticsearch | grep -E ^run:'
