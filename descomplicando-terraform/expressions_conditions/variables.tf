variable "image_id" {
  default = "ami-05f3141013eebdc12"
  type = string
  description = "The id of the machine image (AMI) to use for the server."
}
variable "environment" {
  default = "prod"
  
}

variable "count_extra" {
  default = 2
}

variable "value" {
  type = string
  default = "teste"
  
}