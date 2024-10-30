output "private_key" {
  value     = tls_private_key.my_key1.private_key_pem
  sensitive = true
}