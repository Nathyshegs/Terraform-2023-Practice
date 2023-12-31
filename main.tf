# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
# }

#main.tf
#defining the provider as aws


#create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine               = "mysql"
  identifier           = "myrdsinstance"
  allocated_storage    =  20
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "myrdsuser"
  password             = "myrdspassword"
  parameter_group_name = "default.mysql5.7"
#   timezone = "Pacific Standard Time"
#   maintenance_window = "Tue:16:45-Tue:17:15"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
#   ca_cert_identifier = "${var.ca_cert_identifier}"
#   ca_cert_identifier   = "rds-ca-rsa4096-g1"
  ca_cert_identifier = local.ca_cert_identifier
#   apply_immediately      =  true
 apply_immediately      =  local.apply_immediately
#   ca_cert_identifier   = "rds-ca-2019"

  tags = {
    Name = "MyRDS"
  }
}