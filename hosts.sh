sudo chmod 777 /etc/hosts

cat << EOF > /etc/hosts
127.0.0.1 localhost
192.168.1.15 girosbg
192.168.1.7 desktop
192.168.1.3 asus
192.168.1.10 mint
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF

sudo chmod u+w /etc/hosts
<<<<<<< HEAD
sudo chmod u+w /etc/hosts
=======
>>>>>>> 285aa04 (new)
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo rm -v /etc/resolv.conf
sudo systemctl start dnsmasq
<<<<<<< HEAD
sudo systemctl enable dnsmasq
=======
sudo systemctl enable dnsmasq
>>>>>>> 285aa04 (new)
