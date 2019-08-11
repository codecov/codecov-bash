#!/bin/bash

# Run Tests
./tests/test

# Run tests though kcov
./kcov --include-path=./codecov coverage/ tests/test

# Save report as a file for troubleshooting
bash <(curl -s https://codecov.io/bash) -s coverage -d > upload.txt

# Upload report to Codecov
bash <(curl -s https://codecov.io/bash) -s coverage