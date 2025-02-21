variable "ami" {
  type = map
  default = {
    Ubuntu_22 = "ami-0198a868663199764"
    Ubuntu_24 = "ami-0672fd5b9210aa093"
  }
}

variable "os" {
  default = "Ubuntu_22"
}