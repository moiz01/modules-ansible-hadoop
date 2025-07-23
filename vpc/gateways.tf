
###################
# Internet Gateway
###################
# Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.base.id

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-internet-gateway"

  })
}
##############
# VPN Gateway
##############





##############
# NAT Gateway
##############
resource "aws_eip" "main" {
  domain = "vpc"
  depends_on = [aws_internet_gateway.main]

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-nat-eip"
  })
}


resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-nat-gateway"
  })

  depends_on = [aws_internet_gateway.main]
}

#############################
# Transit Gateway Attachment
#############################