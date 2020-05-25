variable "amis" {
  type = map

  default ={
      "us-east-1" = "ami-085925f297f89fce1"
      "us-east-2" = "ami-0f7919c33c90f5b58"
  }
}

variable "cidrs_blocks_remoto" {
  type = list
  default = ["191.162.57.30/32"]
  
}

variable "key_name" {
  type = string
  default = "terraform-aws"
}

variable "instance_type" {
  default = "t2.micro"  
}


