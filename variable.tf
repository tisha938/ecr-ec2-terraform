variable "aws_region" {
  
  type        = string
  default     = "ap-south-1"
}

variable "ami" {
  
  type        = string
  default     = "ami-04a37924ffe27da53"
}

variable "instance_type" {
 
  type        = string
  default     = "t3a.medium"
}
variable "vpc_id" {
  
  type        = string
  default     = "vpc-0bec741f8f09ff4fd"  
}

variable "subnet_id" {
  
  type        = string
  default     = "subnet-02a7d5b89e62fa594"
}

variable "iam_role_name" {
 
  type        = string
  default     = "ecr_access_role1"
}

variable "iam_policy_name" {
  
  type        = string
  default     = "ecr_access_policy1"
}

variable "iam_instance_profile_name" {
  
  type        = string
  default     = "ecr_instance_profile1"
}
variable "s3_bucket_name" {
 
  type        = string
  default     = "terraform-state-s3-testing"  
}
