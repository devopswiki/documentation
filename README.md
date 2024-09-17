# Documentation DevOps

Bienvenue dans la documentation des technologies DevOps. Cette documentation couvre diverses technologies et outils utilisés dans les environnements DevOps modernes, y compris le cloud, l'infrastructure as code (IAC), les outils CI/CD et les technologies de conteneurisation.

## Table des matières

- [Documentation DevOps](#documentation-devops)
  - [Table des matières](#table-des-matières)
  - [1. Introduction](#1-introduction)
  - [2. Cloud](#2-cloud)
    - [2.1 Azure](#21-azure)
    - [2.2 AWS](#22-aws)
    - [2.3 GCP](#23-gcp)
    - [2.4 IBM Cloud](#24-ibm-cloud)
  - [3. IAC (Infrastructure as Code)](#3-iac-infrastructure-as-code)
    - [3.1 Terraform](#31-terraform)
    - [3.2 Ansible](#32-ansible)
    - [3.3 CloudFormation](#33-cloudformation)
  - [4. Kubernetes](#4-kubernetes)
  - [5. GitLab](#5-gitlab)
  - [6. GitHub](#6-github)
  - [7. Docker](#7-docker)
  - [Sources](#sources)

## 1. Introduction

Cette documentation a pour objectif de fournir une vue d'ensemble des différentes technologies DevOps, avec des exemples pratiques et des tutoriels pour chaque outil. Vous y trouverez des informations sur le cloud, l'infrastructure as code, les outils CI/CD, la conteneurisation, et bien plus encore.

---

## 2. Cloud

### 2.1 [Azure](./cloud/azure/README.md)
Microsoft Azure est l'une des principales plateformes cloud, offrant une large gamme de services et de solutions pour héberger et gérer des applications.

### 2.2 [AWS](./cloud/aws/README.md)
Amazon Web Services (AWS) propose des services cloud de calcul, de stockage, et bien plus, pour répondre à tous les besoins d'infrastructure.

### 2.3 [GCP](./cloud/gcp/README.md)
Google Cloud Platform (GCP) est une plateforme cloud qui fournit des services d'infrastructure et de plateforme pour héberger et exécuter des applications.

### 2.4 [IBM Cloud](./cloud/ibm/README.md)
IBM Cloud offre des solutions de cloud computing pour entreprises, incluant l'IA et le machine learning.

---

## 3. IAC (Infrastructure as Code)
La gestion de l’infrastructure est l’un des process les plus importants du développement logiciel.
Contrairement à la gestion d’infrastructure traditionnelle, l’infrastructure programmable (ou Infrastructure as code IaC) consiste à automatiser le provisionnement, la configuration et le déploiement uniquement via du code, souvent sous forme de fichiers de configuration ou de scripts.
L’avantage de l’IaC est de réduire les interventions humaines, de minimiser les erreurs, ainsi que d’augmenter l’agilité de l’équipe en lui facilitant la création, le déploiement et la surveillance des applications.
Plusieurs solutions ont été développées pour automatiser le déploiement des serveurs d’une infrastructure, telles que Terraform ou AWS CDK pour la création des serveurs dans un environnement cloud, et puppet, chef ou Ansible pour la configuration.

### 3.1 [Terraform](./terraform/README.md)
Terraform est un outil d'infrastructure as code qui permet de gérer des environnements cloud en utilisant des fichiers de configuration.

### 3.2 [Ansible](./ansible/README.md)
Ansible est un outil d'automatisation open-source qui permet de gérer des configurations, déployer des applications et orchestrer des tâches sur plusieurs serveurs.

### 3.3 [CloudFormation](./iac/cloudformation/README.md)
AWS CloudFormation permet de modéliser et de configurer les ressources AWS en utilisant des templates JSON ou YAML.

---

## 4. [Kubernetes](./kubernetes/README.md)

Kubernetes est un système open-source pour automatiser le déploiement, la mise à l'échelle et la gestion des applications conteneurisées.

---

## 5. [GitLab](./gitlab/README.md)

GitLab est une plateforme DevOps complète qui permet de gérer l'intégration continue (CI), la livraison continue (CD) et d'autres aspects du cycle de vie DevOps.

---

## 6. [GitHub](./github/README.md)

GitHub est une plateforme de gestion de version qui permet de collaborer sur des projets de développement en utilisant Git.

---

## 7. [Docker](./docker/README.md)

Docker est une plateforme de conteneurisation qui permet de créer, déployer et exécuter des applications à l'intérieur de conteneurs.

---

## Sources

- Documentation officielle d'[Azure](https://docs.microsoft.com/en-us/azure/)
- Documentation officielle d'[AWS](https://docs.aws.amazon.com/)
- Documentation officielle de [Google Cloud](https://cloud.google.com/docs)
- Documentation officielle de [Terraform](https://www.terraform.io/docs)
- Documentation officielle de [Ansible](https://docs.ansible.com/)
- Documentation officielle de [Kubernetes](https://kubernetes.io/docs/)
- Documentation officielle de [GitLab](https://docs.gitlab.com/)
- Documentation officielle de [GitHub](https://docs.github.com/)
- Documentation officielle de [Docker](https://docs.docker.com/)

