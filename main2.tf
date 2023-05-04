variable "public" {
  default = {
    "key1": true,
    "key2": false
  }
}

resource "aws_instance" "public_foreach" {
  for_each = var.public
  ami           = "ami-12345"
  instance_type = "t3.micro"

  associate_public_ip_address = each.value
}
