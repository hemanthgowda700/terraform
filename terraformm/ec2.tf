#key_pair
resource "aws_key_pair" "my_key" {
    key_name = "terra-key-for-ec2"
    public_key = file("terra-key-for-ec2.pub")
}

#default vpc

resource "aws_default_vpc" "default" {
  
}

#security group
resource "aws_security_group" "my_sg" {
    name = "my_sg"
    description = "this is my sg for ec2"
    vpc_id = aws_default_vpc.default.id        #interpolation
#inbound rules
ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"

}
ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http open"
}
egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}

#ec2 instance
resource "aws_instance" "my_instance" {
    # count = 2
    for_each = tomap({
        terraform-instance1 = "t3.micro"
        terraform-instance-2 = "t3.small"
        terraform-instance-3 = "t3.small"
    })
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_sg.name]
    instance_type = each.value
    ami = var.ec2_ami  #ubuntu
    user_data = file("ngnix_install.sh")

    root_block_device {
      volume_size = var.env == "prod" ? 20 : var.ec2_root_block_device
      volume_type = "gp3"
    }

tags = {
    name = each.key
}

}
# to import ec2 instance
# resource "aws_instance" "my_new_instance" {
#     ami = "unknown"
#     instance_type = "unknown"

  
# }

# resource "aws_key_pair" "my_new_key" {
#     key_name = "unknown"
#     public_key = "unknown"
  
# }
