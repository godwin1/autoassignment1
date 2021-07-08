variable "manageddisk" {
    default ="managedisk"
}
variable "rg_name" {
  default = "group8-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}
variable "linuxdiskname" {
  default = 2
}

variable "vm-linux-name" {
  type = list(string)
  default = [
    "group8-linux-vm1",
    "group8-linux-vm2"
  ]
}

variable "windows_name" {
  type = list(string)
  default = [
    "group8-windows-vm1"
  ]
}

locals {
  common_tags = {
    Name              = "Terraform Group Project"
    GroupMembers      = "Fathima and Godwin"
    ExpirationDate    ="2021-07-31"
    Environment       = "assignment1 1"
  }

}