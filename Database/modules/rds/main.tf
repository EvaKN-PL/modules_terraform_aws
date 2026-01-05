## Security Group for RDS
resource "aws_security_group" "sg_rds" {
    name = "${var.env}-sg-rds"
    vpc_id = var.vpc_id

    tags = {
      Name = "${var.env}-sg-rds"
    }
  
}
## Subnet Group
resource "aws_db_subnet_group" "sub_group" {
  name = "${var.env}-sub-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.env}-sub-group"
  }
}

## DB instance (MYSQL)
resource "aws_db_instance" "main" {
  allocated_storage      = 10
  db_name                = var.db_name
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [ aws_security_group.sg_rds.id ]
  db_subnet_group_name   = aws_db_subnet_group.sub_group.id
  skip_final_snapshot    = true # only for test
  publicly_accessible    = false
  multi_az               = false
}
