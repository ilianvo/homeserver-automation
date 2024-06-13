sudo mkdir /home/node-exporter
sudo chmod 777 /home/node-exporter
cd /home/node-exporter
sudo touch docker-compose.yml
sudo chmod 777 /home/node-exporter/docker-compose.yml
sudo cat << EOF > /home/node-exporter/docker-compose.yml
version: '3.8'
services:
  node_exporter:
    image: quay.io/prometheus/node-exporter:latest
    container_name: node_exporter
    command:
      - '--path.rootfs=/host'
      - '--collector.systemd'
    network_mode: host
    pid: host
    restart: unless-stopped
    volumes:
      - '/:/host:ro,rslave'
      - '/var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket:ro'
EOF
sudo docker-compose up -d