data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  #instance_type = count.index < 1 ? "t2.micro" : "t3.medium"
  # for_each = {
  #   dev = "t2.micro"
  #   prod = "t3.medium"
  # }
  for_each = toset( ["t2.micro", "t3.medium"] )
  instance_type = each.value
  

  tags = {
    Name = "HelloWorld"
  }
}