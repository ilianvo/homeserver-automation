
provider "local" {
  
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
depends_on = [null_resource.dnsmasqsetup]


  provisioner "local-exec" {
    command = "${file("hosts.sh")}"
  }
}
resource "null_resource" "CasaOS" {
depends_on = [null_resource.zrok]

  provisioner "local-exec" {
    command = "curl -fsSL https://get.casaos.io | sudo bash"
    
  }

}
resource "null_resource" "zrok" {
depends_on = [null_resource.hostssetup]

  provisioner "local-exec" {
    command = "${file("zrok.sh")}"
  }
}
resource "null_resource" "onlyoffice" {
depends_on = [null_resource.disk_resize]

  provisioner "local-exec" {
    command = "sudo docker run -d -p 85:80 --restart=unless-stopped onlyoffice/documentserver"
  }
}
resource "null_resource" "disk_resize" {
depends_on = [null_resource.CasaOS]

  provisioner "local-exec" {
    command = "${file("disk_resize.sh")}"
  }
}
resource "null_resource" "tmux" {
depends_on = [null_resource.onlyoffice]

  provisioner "local-exec" {
    command = "sudo apt install tmux"
  }
}

resource "null_resource" "prometheus" {
depends_on = [null_resource.tmux]

  provisioner "local-exec" {
    command = "${file("prometheus.sh")}"
  }
}
resource "null_resource" "node_exporter" {
depends_on = [null_resource.prometheus]

  provisioner "local-exec" {
    command = "${file("node_exporter.sh")}"
  }
}

resource "null_resource" "grafana" {
depends_on = [null_resource.node_exporter]

  provisioner "local-exec" {
    command = "${file("grafana.sh")}"
  }
}

resource "null_resource" "nextcloud" {
depends_on = [null_resource.grafana]

  provisioner "local-exec" {
    command = "${file("nextcloud.sh")}"
  }
}

