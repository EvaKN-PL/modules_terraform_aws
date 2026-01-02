data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = [ "amazon" ]
    filter {
      name = "name"
      values = [ "al2023-ami-2023*-x86_64" ]

    }
}

## Security Group

data "aws_vpc" "selected" {
    id = var.vpc_id
  
}

resource "aws_security_group" "main" {
    name = "${var.env}-sg-ec2"
    description = "Security group for internal AWS communication"
    vpc_id = var.vpc_id

    tags = {
      Name = "${var.env}-SG"
    }
  
}
## ingress
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = var.my_ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = data.aws_vpc.selected.cidr_block
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 0
}

## egress
resource "aws_vpc_security_group_egress_rule" "allow" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "main" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [ aws_security_group.main.id ]

    tags = {
      Name = "${var.env}-myEC2"
    }
  
}
