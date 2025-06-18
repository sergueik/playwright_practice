const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({


  testDir: '.',  // relative to the config file location
  // optional: specify test match pattern if needed
  // testMatch: '**/*.spec.js',
});
