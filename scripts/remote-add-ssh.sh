#!/bin/bash
# http://www.linuxproblem.org/art_9.html

# TODO: Validate input
test -z "$1" && {
  echo "Usage: $0 <username@server>"
  echo "Example: $0 root@google.com"
}

test -e ~/.ssh/id_rsa.pub || {
  echo "No public key found. Generating one now!"
  echo
  ssh-keygen -t rsa
}

chmod 700 ~/.ssh

cat ~/.ssh/id_rsa.pub | ssh "$1" 'mkdir -p .ssh && cat >> ~/.ssh/authorized_keys'
