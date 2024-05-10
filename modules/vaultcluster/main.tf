# Retrieve secrets from Vault

data "vault_generic_secret" "hcp" {
  path = "secret/vault_cluster"
}

# Retrieve Datadog API key from Vault
data "vault_generic_secret" "datadog_secrets" {
  path = "secret/datadog"
}

resource "hcp_hvn" "example" {
  hvn_id         = "hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = var.cidr_block
}

resource "hcp_vault_cluster" "example" {
  cluster_id = var.cluster_id
  hvn_id     = hcp_hvn.example.hvn_id
  tier       = var.tier
  metrics_config {
    datadog_api_key = data.vault_generic_secret.datadog_secrets.data["test_datadog"]
    datadog_region  = "us1"
  }
  audit_log_config {
    datadog_api_key = data.vault_generic_secret.datadog_secrets.data["test_datadog"]
    datadog_region  = "us1"
  }
  lifecycle {
    prevent_destroy = true
  }
}