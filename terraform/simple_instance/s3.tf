resource "aws_s3_bucket" "docking_bay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "69496a416399cad4975e5d315d20ebbd2b6fcfe2"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-01-05 06:50:26"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "e4b6daad-49f4-4662-823b-e64469f2f379"
  }
}
