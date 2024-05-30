#!/bin/bash

check "mailpit is running" sudo sh -c 'sv status mailpit | grep -E ^run:'
sudo sv stop mailpit
check "mailpit is stopped" sudo sh -c 'sv status mailpit | grep -E ^down:'
sudo sv start mailpit
check "mailpit is running" sudo sh -c 'sv status mailpit | grep -E ^run:'
check "127.0.0.1:1025 is open" sh -c 'netstat -lnt | grep :1025 '
check "127.0.0.1:8025 is open" sh -c 'netstat -lnt | grep :8025 '
