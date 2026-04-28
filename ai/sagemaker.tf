resource "aws_sagemaker_model" "model_pass" {
  name               = "my-model"
  execution_role_arn = aws_iam_role.example.arn

  primary_container {
    image = data.aws_sagemaker_prebuilt_ecr_image.test.registry_path
  }
  enable_network_isolation = true
  tags = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "be41a625-cb14-4fe8-b18b-4c907f54a934"
  }
}

resource "aws_sagemaker_model" "model_fail_1" {
  name               = "my-model"
  execution_role_arn = aws_iam_role.example.arn

  primary_container {
    image = data.aws_sagemaker_prebuilt_ecr_image.test.registry_path
  }
  enable_network_isolation = false
  tags = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "d8f07a4b-faa1-4a9d-be00-154a4219f730"
  }
}

resource "aws_sagemaker_model" "model_fail_2" {
  name               = "my-model"
  execution_role_arn = aws_iam_role.example.arn

  primary_container {
    image = data.aws_sagemaker_prebuilt_ecr_image.test.registry_path
  }
  tags = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "dbf2cd33-8bd9-4a27-bced-9ba891fc97d9"
  }
}

resource "aws_iam_role" "example" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "ab10c88e-2ae5-43dd-9978-596366a96661"
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

data "aws_sagemaker_prebuilt_ecr_image" "test" {
  repository_name = "kmeans"
}
