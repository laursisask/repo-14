#!/bin/bash

check "/var/log/sshd.log exists and is not empty" test -s /var/log/sshd.log
check "ssh is running" sudo sh -c 'sv status openssh | grep -E ^run:'
sudo sv stop openssh
check "ssh is stopped" sudo sh -c 'sv status openssh | grep -E ^down:'
sudo sv start openssh
check "ssh is running" sudo sh -c 'sv status openssh | grep -E ^run:'
sudo sv reload openssh
check "ssh has been reloaded" sudo sh -c 'cat /var/log/sshd.log | grep -F "Received SIGHUP; restarting."'
check "ssh is running" sudo sh -c 'sv status openssh | grep -E ^run:'
