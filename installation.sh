#!/bin/sh

opkg install openssh-client openssh-keygen autossh socat redsocks ipset

# Install libustream tls
# opkg list | grep libustream | grep tls

tls_line=$(opkg list | grep libustream | grep tls)
tls_package=$(echo "$tls_line"  | head -n1 | cut -d " " -f1)
opkg install ${tls_package}

cp etc/rc.local /etc/rc.local
cp etc/redsocks.conf /etc/redsocks.conf

ssh-keygen
