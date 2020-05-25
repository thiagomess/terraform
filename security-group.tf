resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    description = "acesso-ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidrs_blocks_remoto
  }


  tags = {
    Name = "allow_ssh"
  }
}

#Security group para outra regiao
resource "aws_security_group" "acesso-ssh-us-east-2" {
#   provider = aws.us-east-2 # o provider que define a regiao de acordo com o alias
  name        = "acesso-ssh2"
  description = "acesso-ssh2"

  ingress {
    description = "acesso-ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidrs_blocks_remoto
  }


  tags = {
    Name = "allow_ssh2"
  }
}