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

# Microsoft's base images contain zsh. We don't want to run this check for MS images because we have no control over the installed services.
if test -d /etc/rc2.d && ! test -e /usr/bin/zsh; then
    dir="$(ls -1 /etc/rc2.d)"
    check "/etc/rc2.d is empty" test -z "${dir}"
fi
