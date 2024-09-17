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

Voici les étapes d'installation de Terraform sous Linux, formatées en Markdown :

# Installation de Terraform sous Linux

## 1. Mettre à jour votre système et vos packages

Exécutez les commandes suivantes pour mettre à jour vos packages :

```bash
sudo apt update -y && sudo apt upgrade -y
```

## 2. Installer wget et unzip

Si `wget` et `unzip` ne sont pas encore installés, vous pouvez les installer avec cette commande :

```bash
sudo apt install -y wget unzip
```

## 3. Télécharger Terraform

Téléchargez le fichier zip de Terraform pour Linux depuis le site officiel. Voici la commande pour télécharger la version 0.12.24 de Terraform :

```bash
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
```

## 4. Décompresser l'archive de Terraform

Décompressez l'archive téléchargée dans le dossier `/usr/local/bin/` afin que Terraform soit accessible par tous les utilisateurs :

```bash
sudo unzip ./terraform_0.12.24_linux_amd64.zip -d /usr/local/bin
```

## 5. Vérifier l'installation de Terraform

Vérifiez que Terraform est installé avec succès en exécutant la commande suivante :

```bash
terraform -v
```

**Résultat attendu :**

```bash
Terraform v0.12.24
```

## 6. Générer une paire de clés SSH (optionnel)

Cette étape est facultative, mais vous pouvez déjà générer une paire de clés SSH pour vous connecter à vos machines virtuelles via SSH. Utilisez la commande suivante en spécifiant le chemin de votre paire de clés sans phrase secrète :

```bash
ssh-keygen -t rsa
```

**Exemple de retour de commande :**

```bash
Generating public/private rsa key pair.
Enter file in which to save the key (/home/hatim/.ssh/id_rsa): ~/terraform/terraform
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
```

Après cela, vous aurez une clé publique `terraform.pub` et une clé privée `terraform` :

```bash
ls ~/terraform/
```

**Résultat :**

```bash
terraform.pub  terraform
```

## 7. Sécuriser la clé privée

Mettez à jour les permissions de votre clé privée pour la sécuriser :

```bash
chmod 400 terraform
```

## Conclusion

L'installation de Terraform sous Linux est désormais terminée. Vous êtes prêt à commencer à utiliser Terraform ! Dans la prochaine partie, nous aborderons l'installation sur Windows.


# Installation sous Windows
Cette fois si je vais vous montrer comment installer terraForm sur Windows sous forme de deux méthodes, une installation manuelle et une installation avec le gestionnaire de paquets windows Chocolatey.