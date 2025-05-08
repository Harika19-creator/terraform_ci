provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "frontend" {
  ami           = "ami-06fe18c7144382cfb"
  instance_type = "t2.micro"
  key_name      = "k8s"

  tags = {
    Name = "c8.local"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/frontend_ip.txt"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-04f7a54071e74f488"
  instance_type = "t2.micro"
  key_name      = "k8s"

  tags = {
    Name = "u21.local"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/backend_ip.txt"
  }
}
