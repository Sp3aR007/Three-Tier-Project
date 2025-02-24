
# RDS PostgreSQL Instance
resource "aws_db_instance" "postgres_db" {
  allocated_storage    = 5
  db_name              = "urlshortenerdb" # Database name
  engine               = "postgres"
  engine_version       = 17.2 # Specify your desired PostgreSQL version
  instance_class       = "db.t3.micro"
  username             = "postgres" # Database username
  password             = "postgres" # Replace with a secure password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  multi_az             = false
  publicly_accessible  = false # Ensure it is not publicly accessible
  skip_final_snapshot  = true # Modify as needed for production
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  tags = {
    Name = "PostgreSQL RDS Instance"
  }
}