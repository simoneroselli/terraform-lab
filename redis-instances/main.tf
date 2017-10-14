// Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

// Redis instance 01
module "<name_01>" {
  source = "../modules/redis-instance"

  ami                    = "${var.ami}"
  subnet_id              = "${var.subnet_id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${module.sg_<name>.security_group_id}","${var.devops_access}"]
  redis_instance_name    = "${var.redis_instance_name}-01"
  volume_size            = "${var.volume_size}"
  serverrole             = "${var.serverrole}"
  environment            = "${var.environment}"
}

// Redis instance 02
module "<name_02>" {
  source = "../modules/redis-instance"

  ami                    = "${var.ami}"
  subnet_id              = "${var.subnet_id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${module.sg_<name>.security_group_id}","${var.devops_access}"]
  redis_instance_name    = "${var.redis_instance_name}-02"
  volume_size            = "${var.volume_size}"
  serverrole             = "${var.serverrole}"
  environment            = "${var.environment}"
}

// Firc security group
module "sg_my_redis_instance_name" {
  source = "../modules/sg/sg_<name>"

  name              = "${var.environment}-<name>"
  vpc_id            = "${var.vpc_id}"
  source_cidr_block = ["${var.source_cidr_block}"]
}
