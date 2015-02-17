#!/bin/bash

read -r -d '' content <<EOF
Host *
ServerAliveInterval 120
EOF

if grep -Fxq "$content" ~/.ssh/config; then
  echo -n "$content" >> ~/.ssh/config
fi
