variable "public_key_path" {
  description = "local public ssh key used for  aws key pair resource creation"
  type = string
  default     = ""
}
variable "key_name" {
    type = string
    default = ""
  
}