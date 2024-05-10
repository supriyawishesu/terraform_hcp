# dtcc_hcp
For Storing HCP modules.
There are 3 modules that exists here
1. Is to create HashiCorp Cloud Vault Cluster. So before doing this, we need to automate the entire process of pushing the code to github , once code pushes to Github, it should automatically trigger the VCS run that is connected to github repo.
 Right now i have Dev HashiCorp Cloud Platform, which is a free version and i set it up locally.

vault server -dev
==> Vault server configuration:

Administrative Namespace: 
             Api Address: http://127.0.0.1:8200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
   Environment Variables: HOME, LANG, LOGNAME, OLDPWD, PATH, PS1, PWD, SHELL, SHLVL, SSH_AUTH_SOCK, TERM, TERM_PROGRAM, TERM_PROGRAM_VERSION, TERM_SESSION_ID, TMPDIR, USER, VAULT_ADDR, VIRTUAL_ENV, VIRTUAL_ENV_PROMPT, XPC_FLAGS, XPC_SERVICE_NAME, _, __CFBundleIdentifier
              Go Version: go1.21.9
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", disable_request_limiter: "false", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: 
                   Mlock: supported: false, enabled: false
           Recovery Mode: false
                 Storage: inmem
                 Version: Vault v1.16.2, built 2024-04-22T16:25:54Z
             Version Sha: c6e4c2d4dc3b0d57791881b087c026e2f75a87cb

==> Vault server started! Log data will stream in below:


2024-05-08T14:40:09.699-0400 [INFO]  core: successful mount: namespace="" path=secret/ type=kv version="v0.17.0+builtin"
WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
and starts unsealed with a single unseal key. The root token is already
authenticated to the CLI, so you can immediately begin using Vault.

You may need to set the following environment variables:

    $ export VAULT_ADDR='http://127.0.0.1:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: ""
Root Token: ""

Development mode should NOT be used in production installations!

Then i created a new project, under project, a new workspace

supriya/Workspaces/dtcc_hcp
Version Control, provided the github URL and repository name. created .github CI/CD pipeline. which is under ./github/workflows/terraform.yml file

so when we push the code to the github and the setting that we have to Just push the event, that automatiicaly triggers the run on HCP.

2. The second module is to create namespace, configuring the static key value and ensuring the only have access to certain namespaces not to everything. WE create namespaces to differentiate between different environments, and different applications and each namespaces will have secrets.  so making sure only have access to specifc namespaces and secrets.

3. The third module is 


