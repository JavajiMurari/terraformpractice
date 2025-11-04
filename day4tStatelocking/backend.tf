terraform {
  backend "s3" {
    bucket = "day4terraformbucket"
    key    = "terraform.tfstate"
    use_lockfile = true # to use s3 native locking 1.13.4 version above
    region = "us-east-1"
    dynamodb_table = "murari" # any version we can use dynamodb locking 
    encrypt = true
  }
}