resource "aws_db_instance" "my-db" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       =  var.engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  multi_az = true 
  iam_database_authentication_enabled = true 
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "main-rds"
  subnet_ids = var.aws_private_subnet_id

  tags = {
    Name = "My DB subnet group"
  }
}

