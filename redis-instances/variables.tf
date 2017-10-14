// Shared values
variable "redis_instance_name" { default = "" }
variable "source_cidr_block"   { default = ""}

// Redis instance
variable "region"              { default = "" }
variable "ami"                 { default = "" }
variable "subnet_id"           { default = ""}
variable "instance_type"       { default = "r3.large" }
variable "volume_size"         { default = "80" }
variable "environment"         { default = "production"}
variable "ops_access"          { default = [""]}

// Security groups
variable "security_group_name" { default = ""}
variable "vpc_id"              { default = ""}
