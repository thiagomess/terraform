resource "aws_s3_bucket" "dev4" {
  bucket = "thiago-dev4"
  acl    = "private"

  tags = {
    Name = "thiago-dev4"
  }
}