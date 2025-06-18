const { test, expect } = require('@playwright/test');

test('basic test - should pass', async ({ page }) => {
  // Just a simple passing test
  expect(1 + 1).toBe(2);
});

test('basic test - should fail', async ({ page }) => {
  // This test intentionally fails
  expect(1 + 1).toBe(3);
});

