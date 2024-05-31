#!/bin/bash

check "memcached is running" sudo sh -c 'sv status memcached | grep -E ^run:'
sudo sv stop memcached
check "memcached is stopped" sudo sh -c 'sv status memcached | grep -E ^down:'
sudo sv start memcached
check "memcached is running" sudo sh -c 'sv status memcached | grep -E ^run:'
