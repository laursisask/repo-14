#!/bin/bash

check "mariadb is running" sudo sh -c 'sv status mariadb | grep -E ^run:'
sudo sv stop mariadb
check "mariadb is stopped" sudo sh -c 'sv status mariadb | grep -E ^down:'
sudo sv start mariadb
