resource "aws_s3_bucket" "example" {
  bucket_prefix = "my-prefix-"

  # AWS_ACCESS_KEY = AKIAIOSFODNN7EXAMAA2
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    AccessKey   = "AKIAIOSFODNN7EXAMAAA"
  }
}
