terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.16.0"
   }
 }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "public" {
  ami                    = "ami-04a37924ffe27da53" 
  instance_type          = "t3a.medium"
subnet_id              = "subnet-02a7d5b89e62fa594"
  security_groups        = [aws_security_group.sg.id] 
  key_name               = aws_key_pair.my_key1.key_name 
  
  associate_public_ip_address = true
  iam_instance_profile    = aws_iam_instance_profile.ecr_profile1.name
  depends_on = [aws_security_group.sg] 

  tags = {
    Name = "ec2-ecr"
  }
}