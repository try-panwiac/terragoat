provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "6078188b4f20b97eb7b8b5625c6feba5a9838040"
    git_file             = "terraform/drift/s3.tf"
    git_last_modified_at = "2022-06-07 16:02:00"
    git_last_modified_by = "93744932+try-panwiac@users.noreply.github.com"
    git_modifiers        = "93744932+try-panwiac"
    git_org              = "try-panwiac"
    git_repo             = "terragoat"
    yor_trace            = "d23faa0f-b532-4c9b-89fc-40ae91253634"
  }
}


resource "aws_s3_bucket_versioning" "docking_bay" {
  bucket = aws_s3_bucket.docking_bay.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "destination" {
  bucket = aws_s3_bucket.docking_bay.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_iam_role" "replication" {
  name = "aws-iam-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_replication_configuration" "docking_bay" {
  depends_on = [aws_s3_bucket_versioning.docking_bay]
  role   = aws_iam_role.docking_bay.arn
  bucket = aws_s3_bucket.docking_bay.id
  rule {
    id = "foobar"
    status = "Enabled"
    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
  }
}