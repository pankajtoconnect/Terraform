resource "aws_instance" "web" {
  ami           = "ami-0002bdad91f793433"
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
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
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ "${aws_eip.lb.public_ip}/32" ]

  }
}
