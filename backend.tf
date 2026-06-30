terraform {
  backend "s3" {
    bucket         = "chaithanya-terraform-state-2027"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}