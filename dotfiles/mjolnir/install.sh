#!/bin/bash
brew update
brew cask install mjolnir
brew install lua
echo 'rocks_servers = { "http://rocks.moonscript.org" }' >> /usr/local/etc/luarocks52/config-5.2.lua

installall() {
    cat init.lua | grep 'require "mjolnir.*"' | awk -F'"' '{print $2}' | sort -u | xargs -n1 luarocks install
}

installall
