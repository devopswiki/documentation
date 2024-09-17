## Table of contents

- [Table of contents](#table-of-contents)
- [1. Authenticating to Azure Active Directory](#1-authenticating-to-azure-active-directory)
  - [1.1 Authenticating using Azure CLI](#11-authenticating-using-azure-cli)
  - [1.2 Authenticating using Managed Identity](#12-authenticating-using-managed-identity)
  - [1.3 Authenticating using a Service Principal and a Client Certificate](#13-authenticating-using-a-service-principal-and-a-client-certificate)
- [1.4 Authenticating using a Service Principal and a Client Secret](#14-authenticating-using-a-service-principal-and-a-client-secret)
- [2. Steps](#2-steps)
- [REF](#ref)


## 1. Authenticating to Azure Active Directory
Terraform supports a number of different methods for authenticating to Azure Active Directory: (see https://registry.terraform.io/providers/hashicorp/azuread/latest/docs#authenticating-to-azure-active-directory)
1. Authenticating to Azure Active Directory using the Azure CLI
2. Authenticating to Azure Active Directory using Managed Identity
3. Authenticating to Azure Active Directory using a Service Principal and a Client Certificate
4. Authenticating to Azure Active Directory using a Service Principal and a Client Secret

### 1.1 Authenticating using Azure CLI

Terraform can authenticate using credentials from the Azure CLI, which is a convenient option for local development.

**Steps:**
1. Log in to Azure via the CLI:
    ```bash
    az login
    ```

2. Use the Azure CLI credentials in Terraform:

```hcl
provider "azurerm" {
    features = {}
}

provider "azuread" {}
```

**Explanation:**
Terraform automatically uses the credentials from the Azure CLI session for authentication.


### 1.2 Authenticating using Managed Identity

Managed Identity allows Azure resources like VMs or App Services to authenticate with Azure AD without needing credentials.

**Example:**
1. Assign a managed identity to a VM in Azure.
2. Configure Terraform to use this managed identity:
```hcl
provider "azurerm" {
    features = {}
    use_msi = true
}
provider "azuread" {
    use_msi = true
}
```
**Explanation:**
- The `use_msi = true` directive allows Terraform to authenticate using the managed identity associated with the VM.

### 1.3 Authenticating using a Service Principal and a Client Certificate

A Service Principal with a certificate is more secure than using a client secret and is often used in production environments.

**Example:**
1. Create a Service Principal and issue a certificate.
2. Configure Terraform to use the certificate for authentication:
```hcl
provider "azurerm" {
    features = {}
    client_id                    = "your-client-id"
    tenant_id                    = "your-tenant-id"
    client_certificate_path      = "path/to/certificate.pfx"
    client_certificate_password  = "your-certificate-password"
}

provider "azuread" {
    client_id               = "your-client-id"
    tenant_id               = "your-tenant-id"
    client_certificate_path = "path/to/certificate.pfx"
}
```

**Explanation:**
- The `client_certificate_path` and `client_certificate_password` allow Terraform to authenticate using a secure certificate.


## 1.4 Authenticating using a Service Principal and a Client Secret

This method uses a client secret for authentication, commonly used for automation and CI/CD pipelines.

**Example:**
1. Create a Service Principal with a client secret.
2. Configure Terraform to use the client secret:

```hcl
provider "azurerm" {
    features = {}
    client_id     = "your-client-id"
    client_secret = "your-client-secret"
    tenant_id     = "your-tenant-id"
}

provider "azuread" {
    client_id     = "your-client-id"
    client_secret = "your-client-secret"
    tenant_id     = "your-tenant-id"
}
```

**Explanation:**
- The `client_id`, `client_secret`, and `tenant_id` va


## 2. Steps

1. Terraform installation : https://developer.hashicorp.com/terraform/install
2. Install the Azure CLI on Linux :https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
3. Authenticating to Azure Active Directory using Azure CLI
    ```bash
    az login
    ```
	and than Select a subscription
	
4. Defining the provider

5. Creating a resource group

6. Useful Terraform commands :
    ```bash
        terraform init
        terraform plan
        terraform apply
        terraform destroy 
    ```

## REF

Terraform on AZURE FROM UDEMY (see https://www.udemy.com/course/terraform-on-azure-services/)
Terraform on AZURE FROM UDEMY (see https://www.udemy.com/course/terraform-on-azure/)


SRC: 
	- terraform url: https://www.terraform.io/
	- terraform edition: https://developer.hashicorp.com/terraform/intro/terraform-editions
	- GitHub SRC: https://github.com/devopswiki/documentation/tree/main/terraform-on-azure/src/code
