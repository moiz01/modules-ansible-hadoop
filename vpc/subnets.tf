
################
# DMZ Subnet
################

################
# Public subnet
################
# Create Public Subnet
resource "aws_subnet" "public" {
  count                   = length(var.network_info.public_subnets)
  vpc_id                  = aws_vpc.base.id
  cidr_block              = var.network_info.public_subnets[count.index].cidr
  map_public_ip_on_launch = true
  availability_zone       = var.network_info.public_subnets[count.index].az

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-Public-${var.network_info.public_subnets[count.index].az}"


  })
  depends_on = [aws_vpc.base]
}
#################
# Private subnet
#################
resource "aws_subnet" "private" {
  count                   = length(var.network_info.private_subnets)
  vpc_id                  = aws_vpc.base.id
  cidr_block              = var.network_info.private_subnets[count.index].cidr
  map_public_ip_on_launch = true
  availability_zone       = var.network_info.private_subnets[count.index].az

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-Private-${var.network_info.private_subnets[count.index].az}"
   


  })
  depends_on = [aws_vpc.base]
}
##################
# Subnet Groups
##################