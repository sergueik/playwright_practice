#!/bin/bash

set -e

# Print basic info
echo "Installing Playwright on Ubuntu $(lsb_release -rs)..."

# 1. Update packages
sudo apt update && sudo apt upgrade -y

# 2. Install dependencies required by Chromium and Playwright
sudo apt install -y \
  wget curl gnupg lsb-release \
  libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 \
  libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2 \
  libpangocairo-1.0-0 libxshmfence1 libxfixes3 libxext6 \
  libx11-xcb1 libgtk-3-0 xvfb

# 3. Install Node.js 20.x via Nodesource (compatible with Playwright)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# 4. Verify Node/NPM installed
node -v
npm -v

# 5. Create a new project folder
mkdir -p ~/playwright-project && cd ~/playwright-project
npm init -y

# 6. Install Playwright Test Runner
npm install -D @playwright/test

# 7. Download browser binaries

echo "Updating package list and installing Playwright dependencies..."

sudo apt-get update

# Install Playwright browser dependencies recommended by Playwright itself
sudo apt-get install -y libgtk-4-1 libavif13

# Alternatively, run playwright install-deps to cover all required dependencies
npx playwright install-deps

echo "Playwright dependencies installed successfully."

# Existing Playwright install commands below
npx playwright install

echo "Playwright browsers installed successfully."

npx playwright install

# 8. Optional: Create a sample test
cat << 'EOF' > example.spec.ts
import { test, expect } from '@playwright/test';

test('homepage has title', async ({ page }) => {
  await page.goto('https://example.com');
  await expect(page).toHaveTitle(/Example/);
});
EOF

# 9. Optional: Add test script to package.json
npx npm set-script test "playwright test"

# 10. Run test (headless)
echo "Running sample test..."
npx playwright test

echo "✅ Playwright setup complete."

