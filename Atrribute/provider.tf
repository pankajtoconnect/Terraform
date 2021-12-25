provider "aws" {
  region     = "ap-south-1"
  shared_credentials_file = "/home/pankaj/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "web" {
  ami           = "ami-0002bdad91f793433"
  instance_type = "t2.micro"

  tags = {
    Name = "Webserver"
  }
}
resource "aws_eip" "lb" {
  vpc      = true
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.lb.id
}
output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "techopsfc"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}
