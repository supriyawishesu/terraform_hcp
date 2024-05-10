# The HCP provider provides resources to manage HashiCorp Cloud Platform (HCP) resources.
terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.88.0"
    }
  }
}


// Use the cloud provider AWS to provision resources that will be connected to HCP
provider "aws" {
  region = var.region
}

