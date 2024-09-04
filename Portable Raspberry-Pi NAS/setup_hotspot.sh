#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root or with sudo."
  exit 1
fi

# Update and install required packages using nala
echo "Updating system and installing necessary packages..."
nala update
nala install -y hostapd dnsmasq

# Stop services while configuring
systemctl stop hostapd
systemctl stop dnsmasq

# Backup and configure dnsmasq
echo "Configuring dnsmasq..."
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
cat <<EOF > /etc/dnsmasq.conf
interface=wlan0
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h
EOF

# Configure hostapd
echo "Configuring hostapd..."
cat <<EOF > /etc/hostapd/hostapd.conf
interface=wlan0
driver=nl80211
ssid=My_RPi3_Hotspot
hw_mode=g
channel=7
ieee80211n=1
wmm_enabled=1
ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=YourSecurePassword
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
EOF

# Link hostapd config
sed -i 's|#DAEMON_CONF="|DAEMON_CONF="/etc/hostapd/hostapd.conf|' /etc/default/hostapd

# Configure static IP and disable wpa_supplicant for wlan0
echo "Configuring static IP and disabling wpa_supplicant for wlan0..."
cat <<EOF >> /etc/dhcpcd.conf
interface wlan0
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant
EOF

# Enable IP forwarding
echo "Enabling IP forwarding..."
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf
sysctl -p

# Configure NAT with iptables
echo "Configuring NAT with iptables..."
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

# Save iptables rules
sh -c "iptables-save > /etc/iptables.ipv4.nat"

# Ensure iptables rules are applied on boot
echo "Restoring iptables rules on boot..."
sed -i '/^exit 0/i iptables-restore < /etc/iptables.ipv4.nat' /etc/rc.local

# Start and enable services
echo "Starting and enabling hostapd and dnsmasq..."
systemctl start hostapd
systemctl start dnsmasq
systemctl enable hostapd
systemctl enable dnsmasq

# Reboot to apply all changes
echo "Setup complete. Rebooting..."
reboot
