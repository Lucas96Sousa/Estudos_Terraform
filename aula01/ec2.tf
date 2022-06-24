resource "aws_instance" "web" {
  ami           = "ami-0454207e5367abf01"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}