
variable "region" {
  description = "AWS region to deploy the VPC"
  type        = string
  default     = ""
  
}

variable "vm_info" {
  type = object({
    name                = string
    instance_ami        = string
    instance_type       = string
    subnet_name         = string
    security_group_name = string
    server_private_ip   = string
    key_name            = string
    root_block_device = object({
      volume_size           = number
      volume_type           = string
      delete_on_termination = bool
    })



  })
  default = {
    name                = "web server 1"
    instance_ami        = "ami-0b0af3577fe5e3532" #RHEL 8.6
    instance_type       = "t2.micro"
    subnet_name         = "ntier-primary-Public-us-east-1a"
    security_group_name = "web"
    server_private_ip   = "192.168.0.10"
    key_name            = "from-secret-store"
    root_block_device = {
      volume_size           = 15
      volume_type           = "gp2"
      delete_on_termination = true
    }

  }

}

