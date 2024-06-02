#!/bin/bash

check "nginx is running" sudo sh -c 'sv status nginx | grep -E ^run:'
sudo sv stop nginx
check "nginx is stopped" sudo sh -c 'sv status nginx | grep -E ^down:'
sudo sv start nginx
check "nginx is running" sudo sh -c 'sv status nginx | grep -E ^run:'
check "Port 80 is open" sh -c 'netstat -lnt | grep :80 '

sudo install -d /wp
echo Test | sudo tee /wp/test.txt
echo '<?php echo "Test"; ?>' | sudo tee /wp/test.php

check "nginx serves /test.txt" sh -c "curl -s http://localhost/test.txt | grep Test"
check "nginx serves /test.php" sh -c "curl -s http://localhost/test.php | grep Test"
