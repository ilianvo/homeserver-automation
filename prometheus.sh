sudo chmod 777 /home/
sudo mkdir /home/prometheus
cd /home/prometheus/
sudo chmod 777 /home/prometheus/
sudo touch docker-compose.yml
sudo chmod 777 /home/prometheus/docker-compose.yml
sudo cat << EOF > /home/prometheus/docker-compose.yml
version: "3"
services:
  prometheus:
    network_mode: host
    image: prom/prometheus:latest
    container_name: prometheus
    volumes:
      - ./prometheus:/etc/prometheus
      - ./prometheus-data:/prometheus
    command: "--config.file=/etc/prometheus/prometheus.yml"
    restart: unless-stopped
EOF
sudo mkdir prometheus
sudo chmod 777 /home/prometheus/prometheus
sudo mkdir prometheus-data
sudo chmod -R 777 prometheus-data
cd /home/prometheus/prometheus
sudo touch prometheus.yml
sudo chmod 777 /home/prometheus/prometheus/prometheus.yml
sudo cat << EOF > /home/prometheus/prometheus/prometheus.yml
global:
  scrape_interval: 15s 

scrape_configs:
   - job_name: 'Node Exporter'
     scrape_interval: 5s
     static_configs:
             - targets: ['localhost:9100']
EOF

cd /home/prometheus/
sudo curl -SL https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose up -d