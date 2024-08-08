#!/bin/bash

check "playwright-core exists and is executable" which playwright-core
check "node exists and is executable" which node
check "npm exists and is executable" which npm

check "Smoke test" playwright-core --version
