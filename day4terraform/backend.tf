terraform {
  backend "s3" {
    bucket = "day4terraformbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}