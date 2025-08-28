variable "env" {
  description = "this is environment for infra"
  type = string

}

variable "bucket_name" {
    description = "this is the bucket name for infra"
    type = string
}

variable "instance_count" {
    description = "this is instance count for ec2 infra"
    type = number
  
}

variable "instance_type" {
    description = "this is instance type for ec2 infra"
    type = string  
}

variable "ami" {
    description = "this is ami for ec2 infra"
    type = string
    
}

variable "hash_key" {
    description = "this is hashkey for dynamodb infra"
    type = string  
  
}