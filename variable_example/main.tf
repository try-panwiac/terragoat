# ./main.tf
resource "aws_s3_bucket" "my_bucket" {
  region        = var.region
  bucket        = local.bucket_name
  acl           = var.acl
  force_destroy = true
  tags = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "1d587670-952a-4393-8913-d9e3bbc05606"
  }
}
