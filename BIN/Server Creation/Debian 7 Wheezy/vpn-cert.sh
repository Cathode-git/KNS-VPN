#!/bin/bash
#OpenVpn certificats
# Start Path -> /etc/openvpn/easy-rsa/2.0
chmod 755 /etc/openvpn/easy-rsa/2.0/*
source /etc/openvpn/easy-rsa/2.0/vars
/etc/openvpn/easy-rsa/2.0/vars
/etc/openvpn/easy-rsa/2.0/clean-all
/etc/openvpn/easy-rsa/2.0/build-ca
/etc/openvpn/easy-rsa/2.0/build-key-server server
/etc/openvpn/easy-rsa/2.0/build-dh
