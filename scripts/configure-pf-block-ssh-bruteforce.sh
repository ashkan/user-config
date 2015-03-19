#!/bin/bash

./check-sudo.sh "$0" || exit 1

tee -a /etc/pf.conf <<EOF
table <bruteforce> persist file "/etc/assholes"
block quick from <bruteforce>
# pass inet proto tcp from any to any port ssh \
#        flags S/SA keep state \
#        (max-src-conn 5, max-src-conn-rate 5/30, \
#         overload <bruteforce> flush global)
# pass inet proto tcp from any to \$localnet port \$tcp_services \
#        flags S/SA keep state \
#        (max-src-conn 100, max-src-conn-rate 15/5, \
#         overload <bruteforce> flush global)
EOF

pfctl -f /etc/pf.conf

tee -a ~/.zshrc <<EOF
alias pfexpire="sudo pfctl -t bruteforce -T expire 86400"
alias pfshow="sudo pfctl -Tshow -tbruteforce"
EOF

echo You can have pfctl dump tables periodically by running the following:
echo
echo pfctl -t bruteforce -T expire 86400

echo Show blocked entries with this command:
echo
echo pfctl -Tshow -tbruteforce
