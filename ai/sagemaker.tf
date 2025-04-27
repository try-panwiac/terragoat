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
    yor_trace = "57b98508-9754-47a2-ae37-5b68deda93f0"
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
    yor_trace = "b7b84273-4d7d-45c5-8406-8797ce114033"
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
    yor_trace = "66141230-3db8-4f93-89ea-7a1ce6830e82"
  }
}

resource "aws_iam_role" "example" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "919359b5-f2d4-4c56-ba2e-89550411b36e"
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
