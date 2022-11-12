resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform tips"
  }
}

resource "aws_instance" "web2" {
  ami = var.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform Tips 2"
  }
  depends_on = [
    aws_instance.web
  ]
}

resource "aws_eip" "ip" {
  vpc= true
  instance = aws_instance.web.id
  }
