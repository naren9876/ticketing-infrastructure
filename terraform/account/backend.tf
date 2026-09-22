terraform {
  backend "s3" {
    bucket  = "ticketing-terraform-state-840080485121"
    key     = "account/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
