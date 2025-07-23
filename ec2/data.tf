



# data "aws_vpc" "vpc" {
#   filter {
#     name   = "tag:Name"
#     values = ["${var.vpc_name}"]
#   }
# }
data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.vm_info.subnet_name}"]
  }
}
data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = ["${var.vm_info.security_group_name}"]
  }
}


# data "aws_ami" "ubuntu" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#   owners = ["099720109477"] # Canonical 
# }
