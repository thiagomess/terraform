provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

#Por usar conta aws educate, so posso utilizar a regiao us-east-1
provider "aws" {
  alias = "us-east-2" #Alias para os recursos usarem aws.us-east-2
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 1
  ami = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "dev${count.index}"
  }
  root_block_device {
      volume_size  = 8
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "dev4"
  }
  root_block_device {
      volume_size  = 8
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.dev4] #cria uma dependencia com o recurso s3 Bucket
}

resource "aws_instance" "dev5" {
  ami = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "dev5"
  }
  root_block_device {
      volume_size  = 8
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"] #vinculando por referencia
}

resource "aws_instance" "dev6" {
  # provider = aws.us-east-2 #usando o alias do provider
  # ami = var.amis["us-east-2"]
  ami = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "dev6"
  }
  root_block_device {
      volume_size  = 8
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"] #vinculando por referencia
  depends_on = [aws_dynamodb_table.dynamodb-homolog]
}


