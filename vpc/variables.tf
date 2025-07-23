##########
## VPC
##########




############
## Subnets
############

# variable "public_subnets" {
#   type    = list(string)
#   default = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]

# }
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "ntier-primary"
  
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
  
}
variable "network_info" {
  description = "Network information for the VPC"
  type = object({
    public_subnets = list(object({
      name = string
      cidr = string
      az   = string
    }))
    private_subnets = list(object({
      name = string
      cidr = string
      az   = string
    }))
  })
  default = {

    public_subnets = [{
      name = "web1"
      cidr = "192.168.0.0/24"
      az = "us-east-2a" },
      {
        name = "web2"
        cidr = "192.168.1.0/24"
      az = "us-east-2b" },
      {
        name = "app1"
        cidr = "192.168.2.0/24"
      az = "us-east-2c" },
      {
        name = "app2"
        cidr = "192.168.3.0/24"
      az = "us-east-2c" }
    ]
    private_subnets = [{
      name = "db1"
      cidr = "192.168.4.0/24"
      az = "us-east-2a" },
      {
        name = "db2"
        cidr = "192.168.5.0/24"
      az = "us-east-2b" }

    ]
  }

}


###############
## Security Group
###############



###########
### TAGS
###########


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

