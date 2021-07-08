variable "log_analytic"{
 default = "log-analytics"
}
variable "rg_name" {
  default = "group8-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}

variable "recoveryvault" {
    default        ="linux-recovery-vault"
}
variable "storage-blob" {
    default = "storage_account_blob"
}
variable "storageaccount"{
  default ="group8storage"
}
variable "storagecontainer"{
default ="storage-container"
}