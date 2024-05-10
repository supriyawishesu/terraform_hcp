# main.tf

# Namespace Setup
resource "vault_namespace" "dev" {
  path = var.namespacename
}


#To generate static credentials with a username/password for accessing specific secrets in Vault,is to use the Transit Secret Engine in Vault to encrypt and decrypt data, including usernames and passwords
# Mount for AWS secrets

resource "vault_mount" "transit_aws" {
  namespace = var.namespacename
  path                      = var.transitmount
  type                      = "aws"
}

#For Azure  secrets

resource "vault_mount" "transit_azure" {
  namespace = var.namespacename
  path                      = var.transitmount
  type                      = "azure"
}

# Enable the transit secret engine (if not already enabled)
resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"
}
# Create a named encryption key within the transit secret engine
resource "vault_transit_secret_backend_key" "key" {
  backend = vault_mount.transit.path
  name    = var.transit_secret_backend_key
}

# Use data source to encrypt the password
data "vault_transit_encrypt" "test" {
  backend   = vault_mount.transit.path
  key       = var.transit_secret_backend_key
  plaintext = var.password
}

# Store the encrypted password in Vault
resource "vault_generic_secret" "credentials" {
  namespace = var.namespacename
  path = "secret/data/credentials"

  data_json = jsonencode({
    username = var.username,
    password = var.password,
  })
}

# Setting up the Vault Policies to have read write access to specific secrets
resource "vault_policy" "example" {
  name = "dev-team"

  policy = <<EOF
path "secret/data/dev" {
  capabilities = ["read", "create"]
}

path "secret/data/aws/dev" {
  capabilities = ["read", "create"]
}
path "secret/data/azure/dev" {
  capabilities = ["read", "create"]
}
EOF
}
