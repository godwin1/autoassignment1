variable "lb" {
    default ="azureLoadBalancer"
}
variable "rg_name" {
  default = "group8-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}
variable "vm_linux_name" {
  default = "group8-linux-vm"
}
variable "nb_count" {
  default = "2"
}

locals {
  common_tags = {
    Name              = "Terraform Group Project"
    GroupMembers      = "Fathima and Godwin"
    ExpirationDate    ="2021-07-31"
    Environment       = "assignment1 1"
  }

}
