variable "api_token" {
  description = "Digital ocean token"
  type        = string
  default     = env("DIGITALOCEAN_TOKEN")
}

variable "droplet_name" {
  description = "Name of vm (droplet)"
  type        = string
  default     = "ubuntu-nginx-test"
}

variable "region" {
  description = "Desired region"
  type        = string
  default     = "nyc1"
}

variable "image" {
  description = "Desired image for packer to create"
  type        = string
  default     = "ubuntu-20-04-x64"
}

variable "size" {
  description = "Desired size"
  type        = string
  default     = "s-1vcpu-1gb-amd"
}

variable "snapshot_name" {
  description = "Naming after packer jobs finished"
  type        = string
  default     = "ubuntu-nginx-std"
}

variable "snapshot_regions" {
  description = ""
  type        = list(string)
  default     = ["nyc1", "nyc3"]
}

variable "ssh_username" {
  description = "Digigtal ocean default user is root"
  type        = string
  default     = "root"
}

variable "tags" {
  description = ""
  type        = list(string)
  default     = ["dev", "ubunutu", "terminal"]
}