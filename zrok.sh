curl -sSLf https://get.openziti.io/tun/package-repos.gpg \
| sudo gpg --dearmor --output /usr/share/keyrings/openziti.gpg;
sudo chmod a+r /usr/share/keyrings/openziti.gpg;

sudo tee /etc/apt/sources.list.d/openziti-release.list >/dev/null <<EOF;
deb [signed-by=/usr/share/keyrings/openziti.gpg] https://packages.openziti.org/zitipax-openziti-deb-stable debian main
EOF

sudo apt update;
sudo apt install zrok;
zrok version;