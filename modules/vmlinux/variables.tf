variable "vm_linux_name" {
  default = "group8-linux-vm"
}
variable "nb_count" {
  default = "2"
}

variable "avs" {
  default = "linux_avs"
}


variable "vm_size" {
  default = "Standard_B1s"
}

variable "username" {
  default = "auto"
}

variable "password" {
  default = "P@$$w0rd123"
}

variable "public_key" {
  default = "/home/auto/.ssh/id_rsa.pub"
}

variable "os_disk_attributes" {
  type = map(string)
  default = {
    los_storage_account_type = "Premium_LRS"
    los_disk_size            = "32"
    los_disk_caching         = "ReadWrite"
  }
}

variable "os_info" {
  type = map(string)
  default = {
    los_publisher = "OpenLogic"
    los_offer     = "CentOs"
    los_sku       = "7.5"
    los_version   = "latest"
  }
}

variable "rg_name" {
  default = "group8-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}

locals {
  common_tags = {
    Name              = "Terraform Group Project"
    GroupMembers      = "Fathima and Godwin"
    ExpirationDate    ="2021-07-31"
    Environment       = "assignment1 1"
  }

}

variable "subnet1" {
  default = "lab01-subnet1"
}

variable "subnet1_space" {
  default = ["10.0.2.0/24"]
}

variable "subnet2" {
  default = "lab01-subnet2"
}

variable "subnet2_space" {
  default = ["10.0.3.0/24"]
}


variable "subnet_id" {
  description = " The default subnet id "
}
// managedisk
variable "manageddisk" {
  default ="linux-vm-disk"
}