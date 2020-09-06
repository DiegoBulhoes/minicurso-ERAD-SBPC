variable "zone" {
  type = string
}

variable "region" {
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

variable "project" {
  type = string
}

variable "subnet" {
  type = string
}

variable "ip_cidr_range_public" {
  type = string
}

variable "ip_cidr_range_private" {
  type = string
}

variable "key_ssh" {
  type = string
}

variable "pub_net_firewall_port_UDP" {
  type = map
}

variable "pub_net_firewall_port_TCP" {
  type = map
}

variable "pvt_net_firewall_port_UDP" {
  type = map
}

variable "pvt_net_firewall_port_TCP" {
  type = map
}
