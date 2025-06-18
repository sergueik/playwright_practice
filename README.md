### Info

This project covers installing __PlayWright__ and optional __Visual Studio Code__ apps on Ubuntu LTE bionic __18.04__ or later.

Ubuntu 18.04 is officially supported by Node.js and Playwright as of 2024 (Xenial 16.04 is deprecated, but Bionic 18.04 is okay).

Playwright can be installed and run on Linux (including Ubuntu 18.04) and Windows 7, with limitations. 

Playwright itself can run on Windows 7, but it is not officially supported.

Major issue: latest Chrome/Chromium no longer run on Windows 7, even manually — which directly impacts browser testing.

📌 Why Chrome Is No Longer Supported:
Google ended Chrome support for Windows 7 in January 2023.

Reason: Chrome switched to a newer Windows API set (especially around Windows GDI+, sandboxing, kernel-mode DLLs), which aren't available in Windows 7.

DLLs like api-ms-win-core-path-l1-1-0.dll are missing in Windows 7.

Chromium now requires Windows 10+ libraries that are not backportable.

🧪 Workarounds (Not recommended for production):
Use Playwright's bundled Chromium (older compatible version).

Run tests in headless mode to avoid rendering/driver issues.

But even then, reliability and compatibility are sketchy on Windows 7.

### Steps

* install playwright via shell script
```shell
./install_playwright.sh
```
* install VS Code via shell script (these two can be run in parallel)
```shell
./install_vscode.sh
```

* modify the configuration 
```shell
./fix_package_json.sh
./after_install.sh
```
* start Visual Studio Code and open the project folder and test

![vscode](https://github.com/sergueik/playwright_practice/blob/main/screenshots/vscode.png)

![test](https://github.com/sergueik/playwright_practice/blob/main/screenshots/test-explorer2.png)
###

### See Also
### Author
[Serguei Kouzmine](kouzmine_serguei@yahoo.com)
