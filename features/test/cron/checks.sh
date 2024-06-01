#!/bin/bash

check "cron is running" sudo sh -c 'sv status cron | grep -E ^run:'
sudo sv stop cron
check "cron is stopped" sudo sh -c 'sv status cron | grep -E ^down:'
sudo sv start cron
check "cron is running" sudo sh -c 'sv status cron | grep -E ^run:'

check "/var/log/messages has 'started' records" grep -E 'crond .* started' /var/log/messages

echo "* * * * * touch /tmp/cron-test" | crontab -
ME=$(whoami)
check "crontab for ${ME} exists" test -f "/var/spool/cron/crontabs/${ME}"
