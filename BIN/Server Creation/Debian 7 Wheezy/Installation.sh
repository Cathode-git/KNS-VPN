#!/bin/bash
#Software installation & update
sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install -y stunnel4 chkconfig openvpn openssl
cp -R /usr/share/doc/openvpn/examples/easy-rsa/ /etc/openvpn/
touch /etc/openvpn/server.conf
#OPENVPN config file
echo 'port 1194 #- port
proto tcp #- protocol
duplicate-cn
dev tun
tun-mtu 1500
tun-mtu-extra 32
mssfix 1450
ca /etc/openvpn/easy-rsa/2.0/keys/ca.crt
cert /etc/openvpn/easy-rsa/2.0/keys/server.crt
key /etc/openvpn/easy-rsa/2.0/keys/server.key
dh /etc/openvpn/easy-rsa/2.0/keys/dh1024.pem
plugin /usr/lib/openvpn/openvpn-auth-pam.so /etc/pam.d/login
client-cert-not-required
username-as-common-name
server 10.8.0.0 255.255.255.0
push "redirect-gateway def1"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status 1194.log
verb 3' > /etc/openvpn/server.conf
#Stunnel config file
touch /etc/stunnel/stunnel.conf
echo "chroot = var/lib/stunnel4
; PID is created insidethe chroot jail
pid = /stunnel4.pid
setuid = stunnel4
setgid = stunnel4
;compression = rle
cert = /etc/stunnel/server.pem
key = /etc/stunnel/server.key
[openvpn]
accept = 443
connect = 127.0.0.1:1194" > /etc/stunnel/stunnel.conf
#Stunnel cert gen
openssl genrsa -out /etc/stunnel/server.key 4096
openssl req -new -key /etc/stunnel/server.key -out /etc/stunnel/server.csr
openssl x509 -req -days 365 -in /etc/stunnel/server.csr -signkey /etc/stunnel/server.key -out /etc/stunnel/server.crt
cat /etc/stunnel/server.key > /etc/stunnel/server.pem && cat /etc/stunnel/server.crt >> /etc/stunnel/server.pem
#Start on boot
chkconfig stunnel4 on
chkconfig openvpn on
