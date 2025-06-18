#!/bin/sh
pushd  /root/playwright-project
cp package.json package.json.SAVED
# jq '.scripts.test = "playwright test"' package.json  \
> /tmp/package.json && mv /tmp/package.json /root/playwright-project
popd
