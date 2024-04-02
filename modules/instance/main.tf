data "aws_ami" "dojo_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_default_vpc" "vpc_dojo" {
}

resource "aws_instance" "dojo" {
  ami           = data.aws_ami.dojo_image.id
  instance_type = var.instance_type

  tags = {
    Name = "dojo"
  }
}
