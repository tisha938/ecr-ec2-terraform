terraform {
  backend "s3" {
    bucket = "terraform-state-s3-testing"  
    key    = "terraform/state.tfstate"  
    region = "ap-south-1"  
    
  }
}