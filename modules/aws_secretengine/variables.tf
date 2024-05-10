variable "username" {
  description = "Username to encrypt the data"
  type = string
}

variable "password" {
  description = "Password to encrypt the data"
  type = string
}

variable "profile" {
  description = "AWS Profile name to authenticate against AWS"
  type = string
}
variable "vault_token" {
  description = "Vault token"
}

variable "secret_test" {
  description = "name of the secrets manager"
  type = string
}

variable "ttl" {
    description = "Maximum TTL for generated credentials"
    type = string
    default = "24"
}
variable "sts_ttl" {
    description = "Default STS token TTL"
    type = string
    default = "1h"
  
}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}