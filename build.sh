#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev

# Run Tests
./tests/test || echo "Tests failed"

# Run tests though kcov
./kcov --include-path=./codecov coverage/ tests/test

# Save report as a file for troubleshooting
bash <(curl -s https://codecov.io/bash) -s coverage -d > upload.txt

# Upload report to Codecov
bash <(curl -s https://codecov.io/bash) -s coverage