provider "aws" {
  region     = "ap-south-1"
  shared_credentials_file = "/home/pankaj/.aws/credentials"
  profile = "default"
}
resource "aws_instance" "web" {
  ami           = "ami-0002bdad91f793433"
  instance_type = var.instancetype

  tags = {
    Name = "Webserver"
  }
}
