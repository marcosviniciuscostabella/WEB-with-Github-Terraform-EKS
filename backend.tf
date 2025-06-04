terraform {
  backend "s3" {
    bucket = "terraformeksgithubbackup" # <-- CAMBIA ESTO con el nombre de tu bucket
    key    = "terraform/state/eks.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
