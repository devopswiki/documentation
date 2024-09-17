# TERRAFORM INSTALLATION :

## ------------ STEP: Installing on Debian 10
SRC:  https://developer.hashicorp.com/terraform/install
	
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

## ------------ STEP: Install Azure CLI
SRC:  https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

## Terraform is a declarative  =W define what end result you want (vs imperative = define exact steps - HOW)

1. Tool for infrastructure provisionning : prepare infrastructure all we need to deploy application 
2. Deploy application 

