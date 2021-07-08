variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet1" {
  default = "lab01-subnet1"
}


variable "subnet1_space" {
  default = ["10.0.2.0/24"]
}

variable "subnet_id" {
  description = " The default subnet id "
}

variable "nsg1" {
  default = "lab01-nsg1"
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    Contactemail = "n01476258@humbermail.ca"
    Environment  = "lab"
  }

}

variable "rg_name" {
  default = "group8-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}

