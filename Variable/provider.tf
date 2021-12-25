provider "aws" {
  region     = "ap-south-1"
  shared_credentials_file = "/home/pankaj/.aws/credentials"
  profile = "default"
}
resource "aws_security_group" "myvarsg" {
  name        = "mysg"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.sgip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.sgip]
  }

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [var.sgip]
  }
}
