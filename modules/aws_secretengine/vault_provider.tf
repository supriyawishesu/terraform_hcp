# Differntating providers all in a seperate providers.tf file

# The Vault provider allows Terraform to read from, write to, and configure HashiCorp Vault.

provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = var.vault_token
}
