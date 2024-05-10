# dtcc_hcp
creating a Terraform module with the following components:

Namespace Setup: Defining a namespace resource using the appropriate provider. This namespace will be used to organize and isolate your secrets.

Static K/V Mount: Configuring a static key-value (K/V) mount within the namespace. This mount will define where your secrets will be stored and managed.

Static Credentials Generation: Generating static credentials (username/password) with specific access policies. These credentials will be used to access and manage secrets within the specified paths.

By using Vault to manage your passwords, we can ensure better security and control over sensitive information, and Terraform provides seamless integration to access these passwords within your infrastructure provisioning workflow.

After completing writing the code,

1. Ensure Vault is up and running and to create namspace, we need HashiCorp Vault Enterprise version. Right now i dont have it to test this code.

2. Ensure  you have environment variables has created 
export VAULT_ADDR=""   --> Vault Server address
export VAULT_TOKEN=""   --> To authenticate to vault, i am using token, there are different ways to authenticate it
export HCP_TOKEN=""  --> To authenticates to HCP in which we can access to the organization. organization-->workspace

3. Push the code github, once we pushed the code based, the VCS code runs automatically once the code is pushed to github

Can also be run the code locally, make sure you dont have any errors.

1. terraform init
2. terraform plan
3. terraform apply