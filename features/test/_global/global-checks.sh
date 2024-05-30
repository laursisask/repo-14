#!/vin/bash

check 'php-fpm is running' sh -c 'ps aux | grep php-fpm'
check 'mailpit is running' sh -c 'ps aux | grep mailpit'
check 'memcached is running' sh -c 'ps aux | grep memcached'
check 'mysql is running' sh -c 'ps aux | grep mysqld'
check 'nginx is running' sh -c 'ps aux | grep nginx'
