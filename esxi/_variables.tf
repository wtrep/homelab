variable "esxi_hostname" {
  type = string
}

variable "esxi_user" {
  type    = string
  default = "root"
}

variable "esxi_password" {
  type      = string
  sensitive = true
}