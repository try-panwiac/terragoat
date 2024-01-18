# ./variables.tf

variable "bucket_name" {
  default = "MyBucket"
}

variable "acl" {
  default = "private"
}

variable "region" {
  default = "us-west-2"
}

### CLI output
