
######
# VPC
######
# Create VPC
resource "aws_vpc" "base" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = "${var.vpc_name}"
    }
  )

}








