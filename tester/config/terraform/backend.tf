terraform {
  backend "gcs" {
    bucket = "<%= expansion(':PROJECT-tfstate') %>"
    prefix = "<%= expansion(':REGION/:BUILD_DIR') %>"
  }
}
