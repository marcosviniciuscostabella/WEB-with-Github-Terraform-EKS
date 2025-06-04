terraform {
  backend "s3" {
    bucket = "mi-terraform-state"
    key    = "env/terraform.tfstate"
    region = "us-east-1"   # <-- PON LA REGION CORRECTA DEL BUCKET
  }
}
