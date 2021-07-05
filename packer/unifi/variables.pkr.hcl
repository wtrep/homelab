variable "cpus" {
  type    = number
  default = 1
}

variable "cores" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 2048
}

variable "network_name" {
  type    = string
  default = "VM Network"
}

variable "remote_host" {
  type    = string
  default = "root"
}

variable "remote_username" {
  type    = string
  default = "root"
}

variable "remote_password" {
  type      = string
  sensitive = true
}

variable "vm_password_hash" {
  type      = string
  sensitive = true
}