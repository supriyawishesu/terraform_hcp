variable "vault_token" {
  description = "Vault token"
}
variable "namespacename" {
  description  = "Name of the namespace"
  type = string
}

variable "mountpath" {
    description = "The Mount path"
    type = string
}

variable "transitmount" {
    description = "The path the transit secret backend is mounted at"
    type = string
    default     = "/"
}

variable "transit_secret_backend_key" {
  description = "Name of the transit secret backend key"
  type = string
  
}
variable "username" {
  description = "The Username to authenticate namespace"
}

# Generating Static Credentials

variable "password" {
  description = "The password that we generated using random password"
  type        = string
  sensitive   = true
}