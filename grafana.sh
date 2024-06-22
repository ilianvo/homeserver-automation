sudo mkdir /home/grafana
sudo mkdir -p /DATA/AppData/grafana/data
sudo chmod 777 /home/grafana
cd /home/grafana
sudo touch docker-compose.yml
sudo chmod 777 /home/grafana/docker-compose.yml
sudo cat << EOF > /home/grafana/docker-compose.yml
name: grafana
services:
  grafana:
    container_name: grafana
    image: grafana/grafana-oss:latest
    ports:
      - "3000:3000"
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/grafana/data
        target: /grafana-data:/var/lib/grafana
EOF
sudo docker-compose up -d