resource "aws_instance" "web" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  count = 2

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  count = 2

  tags = {
    Name = "HelloWorld"
  }
}

