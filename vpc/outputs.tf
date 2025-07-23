output "vpc_id" {
  value = aws_vpc.base.id
}
output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}
output "private_subnets_ids" {
  value = aws_subnet.private.*.id
}

output "public_subnets_cidrs" {
  value = aws_subnet.public.*.cidr_block
}
output "private_subnets_cidrs" {
  value = aws_subnet.private.*.cidr_block
}
