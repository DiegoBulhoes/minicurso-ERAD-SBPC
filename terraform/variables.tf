variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "count_manager" {
  type = string
}

variable "count_worker" {
  type = string
}

variable "user_name" {
  type = string
}


variable "key_ssh" {
  type = string
}


variable "firewall_port_UDP" {
  type = map
}

variable "firewall_port_TCP" {
  type = map
}