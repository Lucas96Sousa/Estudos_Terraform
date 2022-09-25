resource "aws_instance" "web" {
  count         = var.servers
  ami           = var.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform tips"
  }
}
