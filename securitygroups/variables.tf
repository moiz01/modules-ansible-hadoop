

variable "vpc_name" {
  description = "VPC name to be used on all the resources as identifier"
  type        = string
  default     = ""
}
variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = ""

}

variable "security_group_info" {
  type = object({
    name        = string
    description = string
    ingress_rules = list(object({
      from_port = number
      to_port   = number
      protocol  = string
      cidr_ipv4 = string
    }))
    egress_rules = list(object({
      from_port = number
      to_port   = number
      protocol  = string
      cidr_ipv4 = string
    }))
  })

  default = {
    name        = "web"
    description = "web security group"
    ingress_rules = [{
      cidr_ipv4 = "0.0.0.0/0"
      from_port = 22
      protocol  = "tcp"
      to_port   = 22
      },
      {
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 443
        protocol  = "tcp"
        to_port   = 443
      },
      {
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 80
        protocol  = "tcp"
        to_port   = 80
      }
    ]
    egress_rules = [
      {
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 0
        to_port   = 0
        protocol  = "-1"
      },
      {
        cidr_ipv4 = "192.168.0.0/16"
        from_port = 3000
        to_port   = 3000
        protocol  = "tcp"
      }
    ]
  }
}

variable "tags" {
  type = map(string)
  description = "A map of tags to add to all resources"
  default = {
    environment = ""
    Terraform   = ""
    CreatedOn   = ""
    Project     = ""
    Owner       = ""
    Version     = ""

  }
  
}


