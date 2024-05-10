# Refernecing the vaultsecrets module here, and providing those variable values
module "onbarding_module" {
  source = "../vaultsecrets"

  vault_token = var.vault_token
  password   =  var.password
  namespacename             = var.namespacename
  mountpath                 = var.mountpath
  transit_secret_backend_key = var.transit_secret_backend_key
  username = var.username
  transitmount = var.transitmount
}

