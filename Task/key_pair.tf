resource "tls_private_key" "terra_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh1_key"
  public_key = tls_private_key.terra_key.public_key_openssh
}