variable "ami_id" {
    description = "passing ami values"
    default = "ami-0601422bf6afa8ac3"
    type = string
  
}
variable "type" {
    description = "passing values to instance type"
    default = "t3.micro"
    type = string
  
}