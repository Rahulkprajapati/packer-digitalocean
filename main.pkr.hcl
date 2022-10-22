packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.4"
      source  = "github.com/digitalocean/digitalocean"
    }
  }
}

locals {
  timestamp = formatdate("YYYY-MM", timestamp())
}

source "digitalocean" "machine" {
  api_token        = "${var.api_token}"
  droplet_name     = "${var.droplet_name}-${local.timestamp}"
  region           = "${var.region}"
  image            = "${var.image}"
  size             = "${var.size}"
  snapshot_name    = "${var.snapshot_name}-${local.timestamp}"
  snapshot_regions = "${var.snapshot_regions}"
  ssh_username     = "${var.ssh_username}"
  tags             = "${var.tags}"
}

build {
  sources = [
    "source.digitalocean.machine"
  ]

  provisioner "shell" {
    inline = [
      "groupadd -g 1001 ubuntu",
      "useradd ubuntu -m -g 1001 -u 1001",
      "apt-get update"
    ]
  }

  provisioner "shell" {
    script = "./scripts/bootstrap.sh"
  }
}
