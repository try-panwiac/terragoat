provider "aws" {
  region = "us-east-1"
}

variable "bucket_names" {
  type    = set(string)
  default = ["my-bucket-1", "my-bucket-2", "my-bucket-3"]
}

resource "aws_s3_bucket" "example" {
  for_each = var.bucket_names

  bucket = each.key

  tags = {
    Name = each.key
  }
}
