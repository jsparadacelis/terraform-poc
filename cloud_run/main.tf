provider "google" {
  project = "my-sandbox-357703"
}

resource "google_cloud_run_service" "default" {
  name     = "hello-terraform"
  location = "us-east1"

  template {
    spec {
      containers {
        image = "gcr.io/my-sandbox-357703/hello_terraform"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
