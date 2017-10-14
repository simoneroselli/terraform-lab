// Redis instance
resource "aws_instance" "redis" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  

  tags {
    Name        = "${var.redis_instance_name}"
    Serverrole  = "${var.serverrole}"
    Environment = "${var.environment}"
  }

  ebs_block_device {
      device_name           = "/dev/sda1"
      volume_type           = "gp2"
      volume_size           = "${var.volume_size}"
      delete_on_termination = "true"
      encrypted             = "false"
  }

  // Workaround for https://github.com/hashicorp/terraform/issues/10625
  lifecycle {
        ignore_changes = [ "ebs_block_device" ]
  }

}

// Elastic IP
resource "aws_eip" "redis_eip" {
  instance = "${aws_instance.redis.id}"
  vpc      = true
}


