provider "aws" {
  region     = "ap-south-1"
  shared_credentials_file = "/home/pankaj/.aws/credentials"
  profile = "default"
}
resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0002bdad91f793433"
  instance_type = "t2.micro"

  tags = {
    Name = "Webserver-${count.index}"
  }
}
output "myip" {
value = "aws_instance.web.public_ip.id"
}
