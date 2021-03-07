variable "compute_instance_type" {
  type        = string
  description = "Type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "compute_key_name" {
  type        = string
  description = "Key name of the Key Pair to use for the instance"
}

variable "compute_instance_tag" {
  type        = map(string)
  description = "A map of tags to assign to the resource. Note that these tags apply to the instance"
  default     = {}
}

variable "compute_image_name" {
  type        = string
  description = "The name of the parameter. This should be the instance image name present in aws ssm paramter store"
}

variable "database_identifier" {
  type        = string
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}

variable "database_instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
}

variable "database_allocated_storage" {
  type        = number
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs."
}

variable "database_engine" {
  type        = string
  description = "The database engine to use"
}

variable "database_name" {
  type = string
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance."
 }

variable "database_password" {
  type        = string
  description = "Password for the master DB user"
}

variable "database_username" {
  type        = string
  description = "Username for the master DB user"
}

variable "database_engine_version" {
  type        = string
  description = "The database engine version"
}

variable "database_skip_final_snapshot" {
  type = bool
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created"
}
