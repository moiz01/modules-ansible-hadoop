

# terraform {
#   required_version = ">= 1.0.0, < 2.0.0"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
#   # backend "s3" {

#   #   # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
#   #   # manually, uncomment and fill in the config below.

#   #   bucket         = "happynewyear2024-stage-state"
#   #   key            = "stage/data-stores/mysql/terraform.tfstate"
#   #   region         = "us-east-2"
#   #   dynamodb_table = "happynewyear2024-stage-locks"
#   #   encrypt        = true

#   # }
# }

# provider "aws" {
#   region = "us-east-1"
# }


# Create Security group
resource "aws_security_group" "base" {
  name        = var.security_group_info.name
  description = var.security_group_info.description
  vpc_id      = data.aws_vpc.vpc.id
  tags = merge(var.tags, {
    Name = "${var.security_group_info.name}"

  })
  depends_on = [ data.aws_vpc.vpc ]

}

// fetch security group from rules input
resource "aws_vpc_security_group_ingress_rule" "base" {
  count             = length(var.security_group_info.ingress_rules) //TODO
  security_group_id = aws_security_group.base.id                     //TODO
  from_port         = var.security_group_info.ingress_rules[count.index].from_port
  to_port           = var.security_group_info.ingress_rules[count.index].to_port
  ip_protocol       = var.security_group_info.ingress_rules[count.index].protocol
  cidr_ipv4         = var.security_group_info.ingress_rules[count.index].cidr_ipv4
  depends_on        = [data.aws_vpc.vpc, aws_security_group.base]
}

resource "aws_vpc_security_group_egress_rule" "base" {
  count             = length(var.security_group_info.egress_rules) //TODO
  security_group_id = aws_security_group.base.id                    //TODO
  from_port         = var.security_group_info.egress_rules[count.index].from_port
  to_port           = var.security_group_info.egress_rules[count.index].to_port
  ip_protocol = var.security_group_info.egress_rules[count.index].protocol
  cidr_ipv4   = var.security_group_info.egress_rules[count.index].cidr_ipv4
  depends_on  = [aws_security_group.base]
}




