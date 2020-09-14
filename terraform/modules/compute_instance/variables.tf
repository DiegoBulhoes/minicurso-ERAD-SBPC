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

variable "key_ssh" {
  type = string
}
variable "network" {
  type = string
}
