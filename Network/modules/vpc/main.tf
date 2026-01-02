## VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
      Name = "${var.env}-main-vpc"
    }
  
}

## IGW for public subnets
resource "aws_internet_gateway" "public" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "${var.env}-public"
    }
  
}

data "aws_availability_zones" "main" {
    state = "available"
  
}

## Public subnets

resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr[count.index]

    availability_zone = data.aws_availability_zones.main.names[count.index]
    map_public_ip_on_launch = true

    tags = {
      Name = "${var.env}-public-${count.index + 1}"
    }
    
  
}

## Route Table for public subnets
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.public.id
    }

    tags = {
      Name = "${var.env}-public-rt"
    }
  
}

resource "aws_route_table_association" "public" {
    count = length(var.public_subnet_cidr)
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public.id

  
}



## Private subnets

resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr[count.index]

    availability_zone = data.aws_availability_zones.main.names[count.index]

    tags = {
      Name = "${var.env}-private-${count.index + 1}"
    }
  
}

## Elastic IP for NAT
resource "aws_eip" "nat" {
    domain = "vpc"

    tags = {
      Name = "${var.env}-eip-nat"
    }
  
}

## NAT Gateway
resource "aws_nat_gateway" "main" { 
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.public]
}

## Route Table for Private Subnets
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main.id
    }

    tags = {
      Name = "${var.env}-private-rt"
    }
  
}

resource "aws_route_table_association" "private" {
    count = length(var.private_subnet_cidr)
    subnet_id = aws_subnet.private[count.index].id
    route_table_id = aws_route_table.private.id

  
}





