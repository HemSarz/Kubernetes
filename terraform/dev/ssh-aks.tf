resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

# Output the private key
output "aks_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

# Output the public key
output "aks_public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}