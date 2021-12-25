resource "aws_instance" "web" {
  ami           = "ami-0002bdad91f793433"
  instance_type = "t2.micro"

  tags = {
    Name = "Webserver"
  }
}
