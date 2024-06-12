
provider "local" {
  # No configuration options required for basic usage
}

resource "null_resource" "dnsmasq" {


  provisioner "local-exec" {
    command = "${file("dnsmasq.sh")}"
  }
}
resource "null_resource" "dnsmasqsetup" {
depends_on = [null_resource.dnsmasq]


  provisioner "local-exec" {
    command = "${file("dnsmasqsetup.sh")}"
  }
}
resource "null_resource" "hostssetup" {
depends_on = [null_resource.dnsmasq]


  provisioner "local-exec" {
    command = "${file("hosts.sh")}"
  }
}
resource "null_resource" "CasaOS" {
depends_on = [null_resource.dnsmasqsetup]

  provisioner "local-exec" {
    command = "curl -fsSL https://get.casaos.io | sudo bash"
    
  }

}
resource "null_resource" "zrok" {
depends_on = [null_resource.CasaOS]

  provisioner "local-exec" {
    command = "${file("zrok.sh")}"
  }
}
resource "null_resource" "onlyoffice" {
depends_on = [null_resource.zrok]

  provisioner "local-exec" {
    command = "sudo docker run -i -t -d -p 85:80 onlyoffice/documentserver"
  }
}


##provisioner "local-exec" {
    ##when = destroy  # This attribute specifies the provisioner runs only on destroy
    ##command = "sudo apt-get remove dnsmasq -y"
  ##}
##}



