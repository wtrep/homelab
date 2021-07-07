terraform {
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
  }

  backend "s3" {
    bucket = "584618484818-tfstates"
    key    = "aws"
    region = "us-east-1"
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_username = var.esxi_user
  esxi_password = var.esxi_password
}