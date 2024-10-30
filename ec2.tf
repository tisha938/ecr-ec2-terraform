terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.16.0"
   }
 }
}
provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "public" {
   ami                          = var.ami
  instance_type                = var.instance_type
  subnet_id                    = var.subnet_id
  security_groups        = [aws_security_group.sg.id] 
  key_name               = aws_key_pair.my_key1.key_name 
  
  associate_public_ip_address = true
  iam_instance_profile    = aws_iam_instance_profile.ecr_profile1.name
  depends_on = [aws_security_group.sg] 

  tags = {
    Name = "ec2-ecr"
  }
}