provider "google" {
  project = "my-sandbox-357703"
}

data "archive_file" "source" {
  type        = "zip"
  source_dir  = "./src"
  output_path = "/tmp/function-code.zip"
}


resource "google_storage_bucket_object" "zip" {
  # Append file MD5 to force bucket to be recreated
  name   = "source.zip#${data.archive_file.source.output_md5}"
  bucket = "cloud-function-codes"
  source = data.archive_file.source.output_path
}

resource "google_cloudfunctions_function" "function" {
  name        = "hello-terraform"
  description = "Creating a cloud function using terraform"
  runtime     = "python38"

  available_memory_mb   = 128
  source_archive_bucket = "cloud-function-codes"
  source_archive_object = google_storage_bucket_object.zip.name
  trigger_http          = true
  entry_point           = "hello_terraform"
  region                = "us-east1"
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}