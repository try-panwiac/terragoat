variable "awsprops" {
  type = "map"
  default = {
    region       = "us-east-1"
    vpc          = "vpc-5234832d"
    ami          = "ami-0c1bea58988a989155"
    itype        = "t2.micro"
    subnet       = "subnet-81896c8e"
    publicip     = true
    keyname      = "myseckey"
    secgroupname = "IAC-Sec-Group"
  }
}

provider "aws" {
  region = lookup(var.awsprops, "region")
}

resource "aws_security_group" "project-iac-sg" {
  name        = lookup(var.awsprops, "secgroupname")
  description = lookup(var.awsprops, "secgroupname")
  vpc_id      = lookup(var.awsprops, "vpc")

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port   = 80
    protocol    = ""
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
  tags = {
    git_commit           = "a5ea3efef6a80e43523627a032aad74d5419f80c"
    git_file             = "tag_test/main.tf"
    git_last_modified_at = "2023-05-09 07:41:12"
    git_last_modified_by = "93744932+try-panwiac@users.noreply.github.com"
    git_modifiers        = "93744932+try-panwiac"
    git_org              = "try-panwiac"
    git_repo             = "terragoat"
    yor_trace            = "59eacfaf-3f78-46c7-b630-12d6c8c90ea1"
  }
}


resource "aws_instance" "project-iac" {
  ami                         = lookup(var.awsprops, "ami")
  instance_type               = lookup(var.awsprops, "itype")
  subnet_id                   = lookup(var.awsprops, "subnet") #FFXsubnet2
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name                    = lookup(var.awsprops, "keyname")


  vpc_security_group_ids = [
    aws_security_group.project-iac-sg.id
  ]
  root_block_device {
    delete_on_termination = true
    iops                  = 150
    volume_size           = 50
    volume_type           = "gp2"
  }
  tags = {
    Name                 = "SERVER01"
    Environment          = "DEV"
    OS                   = "UBUNTU"
    Managed              = "IAC"
    git_commit           = "a5ea3efef6a80e43523627a032aad74d5419f80c"
    git_file             = "tag_test/main.tf"
    git_last_modified_at = "2023-05-09 07:41:12"
    git_last_modified_by = "93744932+try-panwiac@users.noreply.github.com"
    git_modifiers        = "93744932+try-panwiac"
    git_org              = "try-panwiac"
    git_repo             = "terragoat"
    yor_trace            = "80f08af6-4629-43ff-8057-be8201caf496"
  }

  depends_on = [aws_security_group.project-iac-sg]
}


output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}
