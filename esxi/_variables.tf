variable "esxi_hostname" {
  type = string
}

variable "esxi_password" {
  type      = string
  sensitive = true
}