variable "ec2_instance_type" {
    default = "t3.micro"
    type = string
  
}

variable "ec2_root_block_device" {
    default = 10
    type = number  
}

variable "ec2_ami" {
    default = "ami-020cba7c55df1f615"
    type = string
}

variable "env" {
    default = "prod"
    type = string
  
}