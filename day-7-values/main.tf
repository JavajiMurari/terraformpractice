module "vpc" {
  source              = "../day-7-modules"   # Path to your VPC module folder
  vpc_name            = "dev-vpc"            # Name for your VPC
  cidr_block          = "10.0.0.0/16"        # CIDR range for the VPC
}
