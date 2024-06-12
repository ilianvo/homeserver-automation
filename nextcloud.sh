sudo mkdir /home/nextcloud
sudo mkdir -p /DATA/AppData/nextcloud/var/www/html
sudo chmod 777 /home/nextcloud
cd /home/nextcloud
sudo touch docker-compose.yml
sudo chmod 777 /home/nextcloud/docker-compose.yml
sudo cat << EOF > /home/nextcloud/docker-compose.yml
name: nextcloud
services:
  nextcloud:
    container_name: nextcloud
    image: nextcloud:29.0.0
    ports:
      - target: 80
        published: "10081"
        protocol: tcp
      - target: 443
        published: "10443"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/nextcloud/var/www/html
        target: /nextcloud:/var/www/html
EOF
sudo docker-compose up -d