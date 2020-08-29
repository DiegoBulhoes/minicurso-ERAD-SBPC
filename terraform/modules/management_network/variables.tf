variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "ip_cidr_range_public" {
  type = string
}

variable "ip_cidr_range_private" {
  type = string
}

variable "pub_net_firewall_port_UDP" {
  type = list
}

variable "pub_net_firewall_port_TCP" {
  type = list
}

variable "pvt_net_firewall_port_UDP" {
  type = list
}

variable "pvt_net_firewall_port_TCP" {
  type = list
}

