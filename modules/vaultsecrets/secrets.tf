#----------------------------------------------------------
# Enable secrets engines
#----------------------------------------------------------
# Enable kv-v2 secrets engine in the Dev namespace
resource "vault_mount" "kv-v2" {
  namespace = vault_namespace.hcp_dev.path
  path = var.mountpath
  type = var.mountpath
}