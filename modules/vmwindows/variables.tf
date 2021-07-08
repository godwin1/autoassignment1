locals {
  common_tags = {
    Name              = "Terraform Group Project"
    GroupMembers      = "Fathima and Godwin"
    ExpirationDate    ="2021-07-31"
    Environment       = "assignment1 1"
  }

}

variable "nb_count" {
  default = "1"
}
variable "windows_name" {
  type = map(string)
  default = {
    group8-w-vm = "Standard_B1s"

  }
}
variable "windows_av_set" {
  default = "windows-avs"
}
# variable for OS disk 
variable "windows_disk" {
  type = map(string)
  default = {
    publisher                = "MicrosoftWindowsServer"
    Offer                    = "WindowsServer"
    SKU                      = "2016-Datacenter"
    Version                  = "latest"
    DiskSize                 = "127"
    wos_storage_account_type = "StandardSSD_LRS"
  }
}
variable "rg_name" {
  default = "group8-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}

variable "wsubnet1" {
  default = "lab01-subnet1"
}

variable "subnet1_space" {
  default = ["10.0.2.0/24"]
}

variable "subnet1" {
  default = "lab01-subnet2"
}

variable "subnet2_space" {
  default = ["10.0.3.0/24"]
}


variable "subnet_id" {
  description = " The default subnet id "
}
variable "vmantivirus"{
  default="vmantivirus"
}
variable "win_vm_var" {
  default ="group8-windows-vm"
}

variable "manageddisk" {
  default = "windiskname"
}