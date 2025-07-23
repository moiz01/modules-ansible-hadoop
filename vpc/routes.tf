################
# DMZ routes
################



################
# Publiс routes
################
# Create Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.base.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-public-rt"

  })
}

#################
# Private routes
#################
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.base.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-private-rt"
  })
}


##########################
# Route table association
##########################

# Create Route Association 
resource "aws_route_table_association" "public" {
  count          = length(var.network_info.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
  depends_on     = [aws_subnet.public]
}

resource "aws_route_table_association" "private" {
  count          = length(var.network_info.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
   depends_on     = [aws_subnet.private]
}

