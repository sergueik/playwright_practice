#!/bin/bash

set -e

cd ~/playwright-project

# Initialize project if not already
if [ ! -f package.json ]; then
  npm init -y
fi

# Install Playwright Test
npm install -D @playwright/test
npx playwright install

# Create config if missing
if [ ! -f playwright.config.js ]; then
  npx playwright test --init
fi

# Add a sample test if none exist
if [ ! -d tests ]; then
  mkdir tests
fi

# TODO: patch the directory - Playwright is sensitive to refernce match 

if [ ! -f tests/example.spec.js ]; then
  cat <<EOF > tests/example.spec.js
const { test, expect } = require('@playwright/test');

test('basic test', async ({ page }) => {
  await page.goto('https://example.com');
  await expect(page).toHaveTitle('Example Domain');
});
EOF
fi

# Done
echo "✅ Playwright initialized and test scaffolded successfully."
