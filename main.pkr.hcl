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
  snapshot_name    = "${var.snapshot_name}"
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
      "whoami"
    ]
  }
}