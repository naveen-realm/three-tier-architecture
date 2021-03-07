# Create db instance 1
resource "aws_db_instance" "dbinst1" {
  identifier = var.database_identifier
  instance_class = var.database_instance_class
  allocated_storage = var.database_allocated_storage
  engine = var.database_engine
  name = var.database_name
  password = var.database_password
  username = var.database_username
  engine_version = var.database_engine_version
  skip_final_snapshot = var.database_skip_final_snapshot
  db_subnet_group_name = "${aws_db_subnet_group.dbsubnet.name}"
}
