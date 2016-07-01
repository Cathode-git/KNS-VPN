-----------------------------------------------------
KNS-VPN Version 2.0
-----------------------------------------------------

Supported on Windows Systems
Windows 7   32/64 bit - Tested with Windows Management Framework 5.0 (works)
Windows 8   32/64 bit - Tested with Windows Management Framework 5.0 (works)
Windows 8.1 32/64 bit - Tested with Windows Management Framework 5.0 (works)
Windows 10  32/64 bit - Tested (works)

Supported on Android
M 6.0 - Not tested
Lollipop 5.1 - Tested (works) 
KitKat 4.4.4 - Not tested

-----------------------------------------------------

//Welcome to KNS-VPN\\

-----------------------------------------------------
* How to use KNS-VPN *
-----------------------------------------------------

[Connect] to start VPN
[Disconnect] to disconnect VPN
[Disconnect + Remove Tap Win32 checked] to disconnect from VPN and to remove the Tap Net Card
[Quit] to quit VPN
[IP Test] to show your actual IP address/location
[Show/Hide About] Shows information about VPN

-----------------------------------------------------
* How to create your custom theme *
-----------------------------------------------------

Edit the pictures in
\LauncherDATA\Theme\Custom

After that change the following lines in .\LauncherDATA\Config.xml

<themedir>Default</themedir> 
to 
<themedir>YourDirectory</themedir>

-----------------------------------------------------
* Android Installation Guide *
-----------------------------------------------------

1/ Download and Install "OpenVPN for Android"(by Arne Schwabe) on Google Playstore
2/ Download and Install "SSLDroid"(by BalintKovacs) on Google Playstore
3/ Open SSLDroid and create a new connection with these settings:
	Local Port: 1194
	Remote Host: vpn.x7sshme.com (nl) / srvus01.x7sshme.com (us)
	Remote Port: 10443
	PKCS12 file:
	PKCS12 pass:
4/ Import nl.ovpn/us.ovpn, nlpass.txt/uspass.txt and .crt to your phone
5/ Change the settings in OpenVPN for Android:
	OpenVPN Global Settings:
	Use System Proxy: ON

/Basic Settings/
	LZO Compression
	CA Cert: (import from ca.crt)
	Client Certificate: (import from client cert file)
	Client Certificate Key: (import from client key file)

/Server List/
	Server Address: 127.0.0.1
	Server Port: 1194
	Protocol: TCP
	Custom Options: OFF

/IP and DNS Settings/
	Pull Settings: Request IP Addresses, Routes.. ON
	No Local Binding: ON
	Override DNS Settings by Server: OFF

/Routing/
	Ignore Pushed Routes: OFF
	Bypass VPN for Local Network: ON
	IPv4 Use Default Route: ON
	IPv6 Use Default Route: ON

/Authentication/Encryption/
	Expect TLS Server Certificate: ON
	Certificate HostName Check: OFF
	Use TLS Authentication: OFF
	TLS Auth File:
	TLS Direction: 
	Encryption Cipher:
	Packet Authentication:

/Advanced Settings/
	Persistent Tun: ON
	Connection Retries: Five
	Seconds between Connections: 5s
	Random Host Prefix: OFF
	Allow Floating Server: OFF
	Override MSS Value of TCP

6/ Start SSL Tunnel in SSLDroid
7/ Start OpenVPN Tunnel

---------------------------------------------------------------------------------
* For more information, feedback or troubleshooting mail me @ cathode@black-cats.fr
---------------------------------------------------------------------------------

Thank you for using KNS-VPN!