#!/bin/bash
systemsetup -setremotelogin on
launchctl load -w /System/Library/LaunchDaemons/ssh.plist

dseditgroup -o create -q com.apple.access_ssh
dseditgroup -o edit -a admin -t group com.apple.access_ssh
dseditgroup -o edit -a $(whoami) -t user com.apple.access_ssh
