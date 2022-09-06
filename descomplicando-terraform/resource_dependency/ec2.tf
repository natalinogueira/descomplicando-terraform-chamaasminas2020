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
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_eip" "ip" {
  vpc = true
  instance = aws_instance.web.id
  
}

### Exemplo de dependencia implicita
## Elastic IP depende da instancia:
# No apply: a instancia é criada primeiro, depois EIP;
# No destroy: é o inverso.

### Exemplo dependencia explicita: depends_on

resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
  depends_on = [aws_instance.web]
}