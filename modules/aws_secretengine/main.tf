# main.tf

#The admin policy grants read access to all secret paths (secret/*), but explicitly denies access to system paths (secret/sys/*, secret/auth/*).
#The application policy grants read access to all secret paths (secret/*).
# The user policy grants create, update, delete access to all secret paths (secret/*) but does not grant read access to secret values.

#Creates an AWS Secret Backend for Vault. AWS secret backends can then issue AWS access keys and secret keys, once a role has been added to the backend.
resource "vault_aws_secret_backend" "aws" {
  path                   = "aws"   # Namespace path within Vault
  access_key             = var.aws_access_key
  secret_key             = var.aws_secret_key
  region                 = "us-east-1"
  default_lease_ttl_seconds = var.ttl  # Maximum TTL for generated credentials
  max_lease_ttl_seconds     = var.sts_ttl    # Default STS token TTL
}

resource "vault_policy" "admin" {
  name   = "admin"
  policy = <<EOF
path "secret/*" {
  capabilities = ["list", "read"]
}

path "secret/sys/*" {
  capabilities = []
}

path "secret/auth/*" {
  capabilities = []
}
EOF
}

resource "vault_policy" "application" {
  name   = "application"
  policy = <<EOF
path "secret/*" {
  capabilities = ["list", "read"]
}
EOF
}

resource "vault_policy" "user" {
  name   = "user"
  policy = <<EOF
path "secret/*" {
  capabilities = ["list", "create", "update", "delete"]
}
EOF
}
