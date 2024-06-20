
provider "aws" {
  profile = var.profile
  region  = var.region
}

provider "aws" {
  alias      = "plain_text_access_keys_provider"
  region     = "us-west-1"
  access_key = "AKIAIOSFODNN7EXAMPL3"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEK33"
}

terraform {
  backend "s3" {
    encrypt = true
  }
}
