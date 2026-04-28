
resource "google_notebooks_instance" "pass1" {
  name         = "pass1-instance"
  location     = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }

  # This configures a private Vertex AI instance
  no_public_ip = true
  labels = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "ddaa9031-d5fd-4b6a-9991-b9c78508c971"
  }
}


resource "google_notebooks_instance" "fail1" {
  name         = "fail1-instance"
  location     = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }

  # This configures a public Vertex AI instance
  no_public_ip = false
  labels = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "ca8cf6b7-b6d5-4e8e-b18a-2efd3b5e3666"
  }
}

# This configures a public Vertex AI instance
# b/c there is no "no_public_ip" setting configured
resource "google_notebooks_instance" "fail2" {
  name         = "fail2-instance"
  location     = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }
  labels = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "d7ea0250-1c29-41b5-9836-fa3c2f5afcef"
  }
}
