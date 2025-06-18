#!/bin/sh


set -e
if [ "$(id -u)" -eq 0 ]; then
  echo "⚠️  Do not run this script as root."
    echo "Run it as the target user (e.g., sergueik)."
      exit 1
fi

cd ~
mkdir -p playwright-project
cd playwright-project
npm init -y
npm install -D @playwright/test
npx playwright install
npx playwright test --init
