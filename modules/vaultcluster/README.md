# dtcc_hcp
This code creates HCP vault Cluster On Hashi Corp Cloud Platform
Definition of each files:

1. I created 2 different provider files, because we are using secrets from vault and creating in HCP. so wanted to differentiate.
2. Created variables.tf and there not hardcoding any values, just specifed the definitions of each variable.
3 Added local.auto.tfvars file where we are specifying the vaules of variable, it automatically loads the value of the variable.

After completing writing the code,

1. Ensure Vault is up and running and to create namspace, we need HashiCorp Vault Enterprise version. Right now i dont have it to test this code.

2. Ensure  you have environment variables has created 
export VAULT_ADDR=""   --> Vault Server address
export VAULT_TOKEN=""   --> To authenticate to vault, i am using toke, there are different ways to authenticate it
export HCP_TOKEN=""  --> To authenticates to HCP in which we can access to the organization. organization-->workspace

To authenticate the Vault and HCP, i am placing it as ENV variables

Before this i created a service principal in HCP cloud in IAM and provided access to it.

To authenticate for HCP:

export HCP_CLIENT_ID=""
export HCP_CLIENT_SECRET=""

To authenticate to Vault:

export TF_VAR_vault_token=""

This is been placed in HCP UI as env variable and made it as sensitive value.

4. Run the terraform init, terraform apply. as this is VCS driven, when i push the code to github, it automaically triggers the run,

![alt text](<Screenshot 2024-05-08 at 4.23.27 PM.png>)

This created a new cluster

![alt text](<Screenshot 2024-05-09 at 5.32.01 AM.png>)