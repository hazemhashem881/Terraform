#----rds subnet group
resource "aws_db_subnet_group" "rds-subnet" {
  name       = "subnet-group"
  subnet_ids = [module.network.private1_subnet_id, module.network.private2_subnet_id]

  tags = {
    Name = "My DB subnet group"
  }
}



#---------- rds instance

resource "aws_db_instance" "rds" {
  allocated_storage             = 10
  db_name                       = "mydb"
  engine                        = "mysql"
  engine_version                = "5.7"
  instance_class                = "db.t2.micro"
  parameter_group_name = "default.mysql5.7"
  username                      = var.db_User
  password             = var.db_Pass  # ---> should be variable
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.rds-subnet.name
  vpc_security_group_ids = [aws_security_group.DB-test.id]
}