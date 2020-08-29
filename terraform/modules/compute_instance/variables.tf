variable "project" {
  type = string
}

variable "user_name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "n1-standard-1"
}

variable "count_manager" {
  type = string
}

variable "count_worker" {
  type = string
}

variable "private_subnetwork" {
  type = string
}

variable "public_subnetwork" {
  type = string
}

variable "key_ssh" {
  type = string
}
