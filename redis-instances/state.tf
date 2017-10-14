terraform {
  backend "s3" {
    bucket = "<my_bucket_name>"
    key    = "production/redis-instance/terraform.tfstate"
    region = ""
    access_key = ""
    secret_key = ""
  }
}
