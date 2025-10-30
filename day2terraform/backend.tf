terraform {
  backend "s3" {
    bucket = "s3terraformnewbucket"
    key="day2/terraform.tfstate"
    region = "us-east-1"
  }
}