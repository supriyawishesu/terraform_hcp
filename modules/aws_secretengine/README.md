To accomplish this task using AWS, I used AWS Secrets Manager service along with AWS IAM for managing access policies. Here's how i did it:

In Vault, secrets engines are components responsible for managing and controlling access to secrets, such as database credentials, API keys, or AWS IAM credentials. For AWS, Vault provides an AWS secrets engine that dynamically generates AWS access keys and secret keys with IAM policies attached, enabling secure access to AWS services

Application Policy: This policy should allow read access to both keys and values of the secrets.
User Policy: This policy should allow users to manipulate the values of the secrets, but not view them.
accessing namespaces typically refers to managing access to resources within a system like Vault.

Admin Policy:
Admins should have broad access but limited to viewing only the metadata of secrets, not the values.
They should also be restricted from certain system paths like /sys/ and /auth/.
This can be achieved by creating a Vault policy that grants read access to paths containing secrets but not their values, and excludes access to system paths.

Application Policy:
Applications need access to both keys and values of secrets.
They should have read-only access to all paths including secret values.
This can be accomplished by defining a policy that grants read access to all paths within the namespace.

User Policy:
Users should be able to manipulate the values of secrets but not view them.
They should have read and write access to secret keys, but no access to secret values.
This requires a policy that grants write access to all paths but read access only to metadata, not values.

After completing writing the code, 

1. Ensure Vault is up and running and to create namspace, we need HashiCorp Vault Enterprise version. Right now i dont have it to test this code.

2. Ensure  you have environment variables has created 
export VAULT_ADDR=""   --> Vault Server address
export VAULT_TOKEN=""   --> To authenticate to vault, i am using token, there are different ways to authenticate it
export HCP_TOKEN=""  --> To authenticates to HCP in which we can access to the organization. organization-->workspace

3. Push the code github, once we pushed the code based, the VCS code runs automatically once the code is pushed to github

Can also be run the code locally:

1. terraform init
2. terraform plan
3. terraform apply
