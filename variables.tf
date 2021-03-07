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
