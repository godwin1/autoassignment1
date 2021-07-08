variable "rg_name" {
  default = "group8-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}

locals {
  common_tags = {
    Name         = "Terraform Group Project"
    GroupMembers      = "Fathima and Godwin"
    ExpirationDate        ="2021-07-31"
    Environment  = "Lab"
  }

}

