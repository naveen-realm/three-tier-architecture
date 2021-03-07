compute_instance_type = "t2.micro"
compute_key_name = "sample_app_key"
compute_instance_tag = {
  Project = "Sample-App"
  Label   = "dev"
}
compute_image_name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
database_identifier = "dbpost1"
database_instance_class = "m1.medium"
database_allocated_storage = 10
database_engine = "mysql"
database_name = "myapp_db"
database_password = "dbpassword"
database_username =  "terraform"
database_engine_version = "5.7.00"
database_skip_final_snapshot = true
