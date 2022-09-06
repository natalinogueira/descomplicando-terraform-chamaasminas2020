variable "image_id" {
  default = "ami-05f3141013eebdc12"
  type = string
  description = "The id of the machine image (AMI) to use for the server."
}

variable "blocks" {
  type = list(object({
      device_name = string
      volume_size = string
      volume_type = string
  }))
}
variable "name" {
  default = ""
  type = string
}