#!/bin/bash
git clone --depth 1 https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

tee -a ~/.zshrc <<EOF
# Base16 Shell
BASE16_SHELL="\$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s \$BASE16_SHELL ]] && source \$BASE16_SHELL
EOF

