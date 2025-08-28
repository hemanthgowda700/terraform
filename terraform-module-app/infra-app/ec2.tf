#key_pair
resource "aws_key_pair" "my_key" {
    key_name = "${var.env}-infra-app-key"
    public_key = file("terra-key-for-ec2.pub")

    tags = {
        Environment = var.env
    }
}

#default vpc

resource "aws_default_vpc" "default" {
  
}

#security group
resource "aws_security_group" "my_sg" {
    name = "${var.env}-infra-app-sg"
    description = "this is my sg for ec2"
    vpc_id = aws_default_vpc.default.id       
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
tags = {
  Name = "${var.env}-infra-app-sg"
}
}

#ec2 instance
resource "aws_instance" "my_instance" {
    count = var.instance_count
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_sg.name]
    instance_type = var.instance_type
    ami = var.ami
    

    root_block_device {
      volume_size = var.env == "prod" ? 20 : 10
      volume_type = "gp3"
    }

tags = {
    name = "${var.env}-instance-infra"
    Environment = var.env
}
}