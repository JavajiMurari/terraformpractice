terraform {
  backend "s3" {
    bucket = "day4terraformbucket"
    key    = "terraform.tfstate"
    #use_lockfile = true # to use s3 native locking
    region = "us-east-1"
    dynamodb_table = "veera" # any version we can use dynamodb locking 
    encrypt = true
  }
}