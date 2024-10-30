resource "tls_private_key" "my_key1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "my_key1" {
  key_name   = "my-key-pair1"  
  public_key = tls_private_key.my_key1.public_key_openssh
}