provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = ["${aws_s3_bucket.dev4}"] #cria uma dependencia com o recurso s3 Bucket
}

resource "aws_instance" "dev5" {
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"] #vinculando por referencia
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    description = "acesso-ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["191.162.57.30/32"]
  }


  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "thiago-dev4"
  acl    = "private"

  tags = {
    Name = "thiago-dev3"
  }
}
