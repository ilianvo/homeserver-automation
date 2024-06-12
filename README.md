# homeserver-automation

This is my automated solution for my server at home.
I use DNSmasq for DNS server for my home network, Grafana and Prometheus for monitoring the server, Nextcloud as my personal cloud storage that is exposed to the internet via Zrok.

# How to deploy
1. Install terraform localy for Ubuntu:
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install terraform
 ```
2. Clone my repository:
```
git clone https://github.com/ilianvo/homeserver-automation
```

3.Initialize and run terraform:
```
cd homeserver-automation
terraform init 
terraform plan
terraform apply -auto-approve
```
# Schema
![Blank diagram](https://github.com/ilianvo/homeserver-automation/assets/119301418/112d9f73-445f-4ae4-8ff1-a0cb175d026a)
