// Variables
variable "ami"                    { default = "" }
variable "subnet_id"              { default = "" }
variable "instance_type"          { default = "" }
variable "vpc_security_group_ids" { type    = "list"} 
variable "volume_size"            { default = "" }
variable "redis_instance_name"    { default = "" }
variable "serverrole"             { default = "" }
variable "environment"            { default = "" }
