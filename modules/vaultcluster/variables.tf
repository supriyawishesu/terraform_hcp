variable "vault_token" {
  description = "Vault token"
}

variable "hcp_token" {
  description = "HCP token"
}

variable "region" {
  description = "A region in which you want to create cluser"
  default = "us-east-1"
}

variable "cidr_block" {
  description = "A CIDR block region"
  type = string
}

variable "cluster_id" {
  description = "Name for cluster ID"
  type = string
}

variable "tier" {
  description = "The size of the cluster"
  type = string
}