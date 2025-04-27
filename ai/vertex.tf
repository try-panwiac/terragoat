
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
    yor_trace = "2009b4d9-9a1c-42ec-874e-124cb2becc2a"
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
    yor_trace = "d88b4ffe-99af-43c6-a86e-eab707b41fa1"
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
    yor_trace = "adfe0e3b-a827-4b94-b49e-e5aab50381ba"
  }
}
