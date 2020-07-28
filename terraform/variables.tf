variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "project" {
  type    = string
  default = "erad-samble"
}

variable "subnet" {
  type    = string
  default = "subnetwork"
}

variable "ip_cidr_range_public" {
  type    = string
  default = "10.10.0.0/24"
}

variable "ip_cidr_range_private" {
  type    = string
  default = "10.20.10.0/24"
}

variable "key_ssh" {
  type    = string
  default = "~/.ssh/id_rsa_gcp_erad.pub"
}
