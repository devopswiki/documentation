## Table of contents

- [Table of contents](#table-of-contents)
- [1. Introduction](#1-introduction)
  - [**Concepts de Kubernetes** :](#concepts-de-kubernetes-)
    - [Haute disponibilité (hight availability)](#haute-disponibilité-hight-availability)
    - [Répartition de charge (load balancing)](#répartition-de-charge-load-balancing)
    - [Healthchecks](#healthchecks)
    - [Découverte de service (service discovery)](#découverte-de-service-service-discovery)
    - [Les stratégies de déploiement](#les-stratégies-de-déploiement)
  - [**L’écosystème Kubernetes** :](#lécosystème-kubernetes-)
- [2. Architecture de Kubernetes:](#2-architecture-de-kubernetes)
  - [**1. Worker Nodes (Cargo Ships):**](#1-worker-nodes-cargo-ships)
  - [**2. Master Node (Control Ships):**](#2-master-node-control-ships)
  - [ETCD](#etcd)
    - [Key Concepts](#key-concepts)
    - [Using etcd](#using-etcd)
    - [Why Use etcd?](#why-use-etcd)
  - [kube-apiserver](#kube-apiserver)
  - [Kube Controller Manager](#kube-controller-manager)
    - [Key Functions of Controllers:](#key-functions-of-controllers)
    - [**Kube Controller Manager** Overview:](#kube-controller-manager-overview)
    - [Configuration:](#configuration)
    - [Viewing and Managing:](#viewing-and-managing)
  - [Kube-Scheduler](#kube-scheduler)
    - [Key Functions:](#key-functions)
    - [Decision Factors:](#decision-factors)
    - [Installation and Configuration:](#installation-and-configuration)
    - [Customization:](#customization)
  - [Kubelet](#kubelet)
    - [Key Functions:](#key-functions-1)
    - [Installation and Configuration:](#installation-and-configuration-1)
    - [Advanced Topics:](#advanced-topics)
  - [Kube-Proxy](#kube-proxy)
    - [Key Functions:](#key-functions-2)
    - [How Kube-Proxy Works:](#how-kube-proxy-works)
    - [Installation:](#installation)
- [3. Objets Kubernetes](#3-objets-kubernetes)
  - [L’API et les Objets Kubernetes](#lapi-et-les-objets-kubernetes)
  - [La commande apply](#la-commande-apply)
  - [Syntaxe de base d’une description YAML Kubernetes](#syntaxe-de-base-dune-description-yaml-kubernetes)
  - [3.1 Les namespaces](#31-les-namespaces)
    - [Key Concepts](#key-concepts-1)
    - [Operational Aspects](#operational-aspects)
    - [Conclusion](#conclusion)
  - [3.2 Les Pods](#32-les-pods)
    - [Key Concepts of Pods:](#key-concepts-of-pods)
    - [Containers \& Pods in a Non-Kubernetes Environment:](#containers--pods-in-a-non-kubernetes-environment)
    - [Basic Pod Operations:](#basic-pod-operations)
    - [Kubernetes Pods with YAML:](#kubernetes-pods-with-yaml)
      - [Key Components of a Kubernetes YAML File:](#key-components-of-a-kubernetes-yaml-file)
      - [Example YAML File to Create a Pod:](#example-yaml-file-to-create-a-pod)
      - [Creating the Pod:](#creating-the-pod)
      - [Verifying the Pod:](#verifying-the-pod)
  - [3.3 Les ReplicaSet](#33-les-replicaset)
    - [Kubernetes Controllers: Replication Controller \& Replica Set](#kubernetes-controllers-replication-controller--replica-set)
      - [1. **Replication Controller**](#1-replication-controller)
      - [2. **Replica Set**](#2-replica-set)
        - [YAML Structure for Replication Controller \& Replica Set](#yaml-structure-for-replication-controller--replica-set)
        - [Replication Controller YAML Example:](#replication-controller-yaml-example)
        - [Replica Set YAML Example:](#replica-set-yaml-example)
        - [Differences:](#differences)
      - [Commands](#commands)
      - [Key Concepts:](#key-concepts-2)
  - [3.4 Les Deployments (deploy)](#34-les-deployments-deploy)
    - [Key Features of Kubernetes Deployments:](#key-features-of-kubernetes-deployments)
    - [Deployments vs. ReplicaSets](#deployments-vs-replicasets)
    - [YAML Example for Deployment:](#yaml-example-for-deployment)
    - [Key Sections:](#key-sections)
    - [Commands:](#commands-1)
    - [Key `kubectl` Commands for Creating Pods, Deployments, and YAML Files:](#key-kubectl-commands-for-creating-pods-deployments-and-yaml-files)
    - [1. **Create an NGINX Pod:**](#1-create-an-nginx-pod)
    - [2. **Generate a Pod YAML File (without creating the pod):**](#2-generate-a-pod-yaml-file-without-creating-the-pod)
    - [3. **Create a Deployment:**](#3-create-a-deployment)
    - [4. **Generate a Deployment YAML File (without creating the deployment):**](#4-generate-a-deployment-yaml-file-without-creating-the-deployment)
    - [5. **Generate and Save a Deployment YAML File:**](#5-generate-and-save-a-deployment-yaml-file)
    - [6. **Modify the YAML File (e.g., change replicas) and Apply It:**](#6-modify-the-yaml-file-eg-change-replicas-and-apply-it)
    - [7. **Create a Deployment with Specific Number of Replicas (in Kubernetes 1.19+):**](#7-create-a-deployment-with-specific-number-of-replicas-in-kubernetes-119)
    - [Benefits of Using `kubectl` Commands Instead of YAML:](#benefits-of-using-kubectl-commands-instead-of-yaml)
    - [Summary:](#summary)
  - [3.5 Les Services](#35-les-services)
    - [**Kubernetes Services Overview**](#kubernetes-services-overview)
    - [**Networking in Kubernetes**](#networking-in-kubernetes)
    - [**Types of Kubernetes Services**](#types-of-kubernetes-services)
    - [**NodePort Service in Detail**](#nodeport-service-in-detail)
    - [**Creating a NodePort Service**](#creating-a-nodeport-service)
    - [**Connecting Services to Pods**](#connecting-services-to-pods)
    - [**Load Balancing and High Availability**](#load-balancing-and-high-availability)
    - [**Service Flexibility and Adaptation**](#service-flexibility-and-adaptation)
  - [3.6 **ClusterIP Services**](#36-clusterip-services)
    - [Key Concepts:](#key-concepts-3)
    - [Creating a ClusterIP Service:](#creating-a-clusterip-service)
    - [Conclusion:](#conclusion-1)
  - [3.7 **LoadBalancer Services**](#37-loadbalancer-services)
    - [Key Concepts:](#key-concepts-4)
    - [Using LoadBalancer in Kubernetes:](#using-loadbalancer-in-kubernetes)
    - [Conclusion:](#conclusion-2)
    - [3.6.5 les Secrets](#365-les-secrets)
    - [3.6.6 Les CRD et Operators](#366-les-crd-et-operators)
    - [Jobs](#jobs)
    - [CronJobs](#cronjobs)
    - [Le Role-Based Access Control, les Roles et les RoleBindings](#le-role-based-access-control-les-roles-et-les-rolebindings)
- [4. Scheduling dans Kubernetes](#4-scheduling-dans-kubernetes)
  - [4. Qu'est-ce que le scheduling ?](#4-quest-ce-que-le-scheduling-)
  - [4.1 **Manual Scheduling**](#41-manual-scheduling)
    - [Two Methods for Manually Scheduling Pods:](#two-methods-for-manually-scheduling-pods)
    - [**Labels and Selectors Overview:**](#labels-and-selectors-overview)
      - [**Real-World Example:**](#real-world-example)
    - [**Labels and Selectors in Kubernetes:**](#labels-and-selectors-in-kubernetes)
    - [**Connecting Objects with Labels:**](#connecting-objects-with-labels)
      - [**Common Pitfall:**](#common-pitfall)
    - [**Annotations:**](#annotations)
    - [**Conclusion:**](#conclusion-3)
    - [4.3 **Taints and Tolerations :**](#43-taints-and-tolerations-)
    - [**Taints and Tolerations Overview:**](#taints-and-tolerations-overview)
      - [**Analogy:**](#analogy)
    - [**Taints in Kubernetes:**](#taints-in-kubernetes)
    - [**Tolerations in Kubernetes:**](#tolerations-in-kubernetes)
    - [**How Taints and Tolerations Work Together:**](#how-taints-and-tolerations-work-together)
    - [**Taint Effects and Pod Scheduling:**](#taint-effects-and-pod-scheduling)
    - [**Master Node and Taints:**](#master-node-and-taints)
    - [**Important Points to Remember:**](#important-points-to-remember)
- [4. Le stockage dans Kubernetes](#4-le-stockage-dans-kubernetes)
  - [4.1 StorageClasses](#41-storageclasses)
  - [4.2 StatefulSets](#42-statefulsets)
  - [4.3 DaemonSets](#43-daemonsets)
  - [4.4 Les ConfigMaps](#44-les-configmaps)
- [5 Le réseau dans Kubernetes](#5-le-réseau-dans-kubernetes)
  - [5.1 Les objets Services](#51-les-objets-services)
  - [5.2 Les network policies](#52-les-network-policies)
  - [5.3 Le loadbalancing](#53-le-loadbalancing)
  - [5.4 Les objets Ingresses](#54-les-objets-ingresses)
- [6. Sécurité dans Kubernetes](#6-sécurité-dans-kubernetes)
  - [6.1 Concepts de base de la sécurité](#61-concepts-de-base-de-la-sécurité)
  - [6.2 Authentification et autorisation](#62-authentification-et-autorisation)
  - [6.3 Secrets et ConfigMaps](#63-secrets-et-configmaps)
  - [6.4 Network Policies](#64-network-policies)
  - [6.5 RBAC (Role-Based Access Control)](#65-rbac-role-based-access-control)
- [7. Gestion de la configuration et des versions](#7-gestion-de-la-configuration-et-des-versions)
  - [7.1 Helm et gestion des packages](#71-helm-et-gestion-des-packages)
  - [7.2 GitOps et déploiement continu](#72-gitops-et-déploiement-continu)
- [8. Surveillance et Journalisation](#8-surveillance-et-journalisation)
- [9. Kubernetes dans le Cloud](#9-kubernetes-dans-le-cloud)
- [REF](#ref)


## 1. Introduction
Kubernetes, souvent abrégé en K8s, est un outil d'orchestration de conteneurs open source, initialement développé par Google. Il permet de gérer des applications conteneurisées, comme celles basées sur Docker, dans différents environnements de déploiement tels que des machines physiques, des machines virtuelles, le cloud ou des environnements hybrides. 

**Problèmes résolus par Kubernetes** :
Avec la transition des architectures monolithiques vers les microservices et l'usage accru des conteneurs, Kubernetes répond à la demande croissante d'une gestion efficace de centaines, voire de milliers de conteneurs. 

**Fonctionnalités clés de Kubernetes** :
- **Haute disponibilité** (hight availability) : garantit que les applications restent accessibles sans interruption.
- **Évolutivité** (Scalability or high performance) : permet d'ajuster rapidement la capacité de l'application en fonction de la demande.(scale your applications fast when you have more load on it ans more users are trying to access it and the same way you can easily scale it down when the load goes down)
- **Récupération** : assure des mécanismes de sauvegarde et de restauration des données en cas de problème infrastructurel.

### **Concepts de Kubernetes** :
#### Haute disponibilité (hight availability)
- Faire en sorte qu’un service ait un “uptime” élevé.
- On veut que le service soit tout le temps accessible même lorsque certaines ressources manquent :
  - elles tombent en panne
  - elles sont sorties du service pour mise à jour, maintenance ou modification
- Pour cela on doit avoir des ressources multiples…
  - Plusieurs serveurs
  - Plusieurs versions des données
  - Plusieurs accès réseau
- Il faut que les ressources disponibles prennent automatiquement le relais des ressources indisponibles. Pour cela on utilise généralement:
  - des “load balancers” : aiguillages réseau intelligents
  - des “healthchecks” : une vérification de la santé des applications
- Mais aussi :
  - des réseaux de secours
  - des IP flottantes qui fonctionnent comme des load balancers
  - etc.
- Nous allons voir que Kubernetes intègre automatiquement les principes de load balancing et de healthcheck dans l’orchestration de conteneurs
#### Répartition de charge (load balancing)

![image info](./src/imgs/k8s_loadbalancer.png){ width=40% }

- Un load balancer : une sorte d'“aiguillage” de trafic réseau, typiquement HTTP(S) ou TCP.
- Un aiguillage intelligent qui se renseigne sur plusieurs critères avant de choisir la direction.
- Cas d’usage :
  - Éviter la surcharge : les requêtes sont réparties sur différents backends pour éviter de les saturer.
- L’objectif est de permettre la haute disponibilité : on veut que notre service soit toujours disponible, même en période de panne/maintenance.
  - Donc on va dupliquer chaque partie de notre service et mettre les différentes instances derrière un load balancer.
  - Le load balancer va vérifier pour chaque backend s’il est disponible (healthcheck) avant de rediriger le trafic.
  - Répartition géographique : en fonction de la provenance des requêtes on va rediriger vers un datacenter adapté (+ proche).
- Solutions de load balancing externe
  - HAProxy : Le plus répandu en load balancing.
  - Traefik : Simple à configurer et se fond dans l’écosystème des conteneurs Docker et Kubernetes
  - NGINX : Serveur web central qui a depuis quelques années des fonctions puissantes de load balancing et TCP forwarding.
#### Healthchecks
Fournir à l’application une façon d’indiquer qu’elle est disponible, c’est-à-dire :
- qu’elle est démarrée (liveness)
- qu’elle peut répondre aux requêtes (readiness).

![image info](./src/imgs/k8s_healthchecks_1.png)
![image info](./src/imgs/k8s_healthchecks_2.png)
#### Découverte de service (service discovery)
Classiquement, les applications ne sont pas informées du contexte dans lequel elles tournent : la configuration doit être opérée de l’extérieur de l’application.
  - par exemple avec des fichiers de configuration fournie via des volumes
  - ou via des variables d’environnement
  
Mais dans un environnement hautement dynamique comme Kubernetes, la configuration externe ne suffit pas pour gérer des applications complexes distribuées qui doivent se déployer régulièrement, se parler et parler avec l’extérieur.
<u>La découverte de service désigne généralement les méthodes qui permettent à un programme de chercher autour de lui</u> (généralement sur le réseau ou dans l’environnement) ce dont il a besoin.
  - La mise en place d’un système de découverte de service permet de rendre les applications plus autonomes dans leur (auto)configuration.
  - Elles vont pouvoir récupérer des informations sur leur contexte (dev ou prod, Etats-Unis ou Europe ?)
  - Ce type d’automatisation permet de limiter la complexité du déploiement.
Concrètement, au sein d’un orchestrateur, un système de découverte de service est un serveur qui est au courant automatiquement :
  - de chaque conteneur lancé. 
  - du contexte dans lequel chaque conteneur a été lancé.
  
Ensuite il suffit aux applications de pouvoir interroger ce serveur pour s’autoconfigurer.
Un exemple historique de découverte de service est le DNS : on fait une requête vers un serveur spécial pour retrouver une adresse IP (on découvre le serveur dont on a besoin). Cependant le DNS n’a pas été pensé pour ça :
  - certaines application ne rafraichissent pas assez souvent leurs enregistrements DNS en cache
le DNS devient trop complexe à partir de quelques dizaines d’enregistrements

**Solutions de découverte de service**
- Consul (Hashicorp) : assez simple d’installation et fourni avec une sympathique interface web.
- etcd : a prouvé ses performances à plus grande échelle mais un peu plus complexe
#### Les stratégies de déploiement
SRC : https://blog.container-solutions.com/kubernetes-deployment-strategies

Il existe deux types de stratégies de rollout native à Kubernetes :
- Recreate : arrêter les pods avec l’ancienne version en même temps et créer les nouveaux simultanément
- RollingUpdate : mise à jour continue, arrêt des anciens pods les uns après les autres et création des nouveaux au fur et à mesure (paramétrable)

Mais il existe un panel de stratégies plus large pour updater ses apps :
- blue/green : publier une nouvelle version à côté de l’ancienne puis changer de trafic
- canary : diffuser une nouvelle version à un sous-ensemble d’utilisateurs, puis procéder à un déploiement complet
- A/B testing: diffusion d’une nouvelle version à un sous-ensemble d’utilisateurs de manière précise (en-têtes HTTP, cookie, région, etc.).
  - pas possible par défaut avec Kubernetes, implique une infrastructure plus avancée avec reverse proxy (Istio, Traefik, nginx/haproxy personnalisé, etc.).

### **L’écosystème Kubernetes** :

L'écosystème Kubernetes est constitué d'une variété de flavours qui implémentent les standards définis par Kubernetes, notamment pour les solutions réseau, le stockage, le loadbalancing, l'Ingress, l'autoscaling de clusters et le monitoring. Bien qu'il soit possible de créer un cluster Kubernetes personnalisé, cela demande une expertise technique et des choix complexes, ce qui pousse souvent les utilisateurs vers des solutions de fournisseurs de cloud, entraînant un vendor lock-in.

Voici quelques exemples d'écosystèmes Kubernetes populaires :
- **Google Kubernetes Engine (GKE)** : L’écosystème Kubernetes développé par Google. Très populaire car très flexible tout en étant l’implémentation de référence de Kubernetes.
- **Azure Kubernetes Services (AKS)** : Un écosystème Kubernetes axé sur l’intégration avec les services du cloud Azure (stockage, registry, réseau, monitoring, services de calcul, loadbalancing, bases de données…).
- **Elastic Kubernetes Services (EKS)** : Un écosystème Kubernetes assez standard à la sauce Amazon axé sur l’intégration avec le cloud Amazon (la gestion de l’accès, des loadbalancers ou du scaling notamment, le stockage avec Amazon EBS, etc.)
- **Rancher** : Un écosystème Kubernetes très complet, assez opinionated et entièrement open-source, non lié à un fournisseur de cloud. Inclut l’installation de stack de monitoring (Prometheus), de logging, de réseau mesh (Istio) via une interface web agréable. Rancher maintient aussi de nombreuses solutions open source, comme par exemple Longhorn pour le stockage distribué.
- **k3s** : Un écosystème Kubernetes fait par l’entreprise Rancher et axé sur la légèreté. Il remplace etcd par une base de données Postgres, utilise Traefik pour l’ingress et Klipper pour le loadbalancing.
- **Openshift** : Une version de Kubernetes configurée et optimisée par Red Hat pour être utilisée dans son écosystème. Tout est intégré donc plus guidé, avec l’inconvénient d’être un peu captif·ve de l’écosystème et des services vendus par Red Hat.
  

## 2. Architecture de Kubernetes:

Kubernetes adopte une architecture **master/worker**, où un cluster Kubernetes est composé d'au moins un nœud maître (master node) et de plusieurs nœuds de travail (worker nodes), également appelés simplement "nœuds". Ces nœuds peuvent être des machines physiques ou virtuelles; vous interagirez rarement directement avec les nœuds.

- **Nœud maître** : il orchestre l'ensemble du cluster. Il gère la planification des applications, la distribution des ressources et assure la communication entre les nœuds de travail.
    Le “master” fait référence à un ensemble de processus gérant l’état du cluster. Le master peut également être répliqué pour la disponibilité et la redondance.
- **Nœuds de travail** : ce sont les machines sur lesquelles les conteneurs d'applications s'exécutent. Chaque nœud de travail est sous la supervision du nœud maître et héberge des pods qui contiennent les conteneurs.
  
Cette architecture permet une gestion flexible et évolutive des applications, avec une séparation claire des rôles entre la gestion du cluster (nœud maître) et l'exécution des tâches (nœuds de travail).

![image info](./src/imgs/k8s_archi_basic.png)


We start with a basic overview of the **Kubernetes cluster architecture**.

At a high level, Kubernetes manages applications through containers in an automated manner, ensuring communication between services and scaling as required.

Let’s use an analogy of ships to understand the architecture.


### **1. Worker Nodes (Cargo Ships):**
Worker nodes host applications as containers. These nodes are like cargo ships, which do the actual work of carrying containers. Containers are loaded, managed, and executed here. Each worker node has:

- **Kubelet (The Captain)**: The kubelet is the node's agent, responsible for receiving instructions from the control plane (master node) and ensuring that containers are running correctly.
- **Container Runtime (Docker/ContainerD)**: This engine runs the containers.
- **Kube Proxy (Communication Manager)**: Manages network communication between containers across nodes, ensuring they can talk to each other.

**Worker Node In K8s Cluster:**

![image info](./src/imgs/k8s_worker_node.png)

En tant que développeur ou administrateur Kubernetes, vous interagirez principalement avec les nœuds de travail (worker nodes) pour déployer, mettre à jour ou autoscaler vos applications conteneurisées. Un nœud de travail exécute le travail réel du cluster et contient des pods, qui sont des abstractions de vos applications conteneurisées.

Chaque nœud de travail exécute trois processus clés :
1. **Container Runtime** : C'est l'environnement dans lequel les conteneurs sont exécutés. Exemples : containerd, CRI-O, Docker.
2. **kubelet** : Le kubelet est un agent principal qui s'exécute sur chaque nœud de travail. Il interagit à la fois avec le nœud et les conteneurs sur ce nœud. Il a plusieurs responsabilités clés :
   - **Gestion des Pods** : Il maintient un ensemble de pods (composés de un ou plusieurs conteneurs) sur le système local du nœud.
   - **Enregistrement et Rapport** : Il enregistre le nœud auprès du cluster Kubernetes, envoie des événements, des états des pods, et rapporte l'utilisation des ressources.
   - **Observation des PodSpecs** : Le kubelet surveille les PodSpecs (descriptions de pods en YAML ou JSON) via l'API Kubernetes et veille à ce que les conteneurs décrits dans ces PodSpecs soient en cours d'exécution et en bonne santé.
   - Lorsque Kubernetes veut planifer un pod, il envoie des PodSecs du pod au Kubelet. Le kubelet s’assure alors que les conteneurs sont sains et son conforme à la configuration déclarative.
3. **kube-proxy** : Kube proxy permet de mettre les nodes en réseau avec des règles qui assurent la communication entre les pods et et les entités extérieures au cluster.
  Kube-proxy peut fonctionner selon 3 modes : iptables, ipvs et userspace. Chaque mode est adapté en fonction de la taille du cluster.
    
Ces processus doivent être installés et fonctionnels sur chaque nœud de travail pour garantir une gestion efficace des applications conteneurisées. Cependant, la gestion des nœuds de travail et la planification des pods dépendent du nœud maître (Master Node).

### **2. Master Node (Control Ships):**
The master node is like a control ship, managing the entire fleet of worker nodes. It oversees which containers go where and ensures everything is running smoothly. Components on the master node include:

- **etcd (Data Storage)**: A distributed key-value store that holds information about the cluster's state.
- **Scheduler (The Crane)**: Assigns containers to nodes based on resource availability and scheduling policies.
- **Controllers (Operations and Cargo Teams)**: Handle different responsibilities:
  - **Node Controller**: Manages worker nodes.
  - **Replication Controller**: Ensures the desired number of containers are always running.
- **Kube API Server (The Orchestrator)**: The main control unit that orchestrates operations across the cluster. It exposes APIs for interaction between external users, nodes, and other components.

The **master node** ensures the health and management of the cluster, while the **worker nodes** handle running the containers.

In the upcoming sections, we will dive deeper into these components and how they work together to keep Kubernetes clusters running efficiently.

**Master Node in K8s cluster:**

![image info](./src/imgs/k8s_master_node.png)

Le nœud maître, également connu sous le nom de plan de contrôle (control plane), est chargé de gérer efficacement les nœuds de travail (ou nœuds esclaves). Ses principales responsabilités incluent :
   - Planification des Pods : Décider sur quels nœuds de travail les pods doivent être déployés.
   - Surveillance des Nœuds et Pods : Observer l'état des nœuds de travail et des pods.
   - Démarrage et Redémarrage des Pods : Assurer que les pods sont lancés et redémarrés si nécessaire.
   - Gestion des Nouveaux Nœuds de Travail : Intégrer les nouveaux nœuds de travail dans le cluster.

Les nœuds maîtres dans un cluster Kubernetes exécutent les processus clés suivants :
   - **kube-apiserver** : Le point d'entrée principal pour toutes les communications avec le cluster, traitant les requêtes API et coordonnant les interactions entre les différents composants Kubernetes.
   - **kube-controller-manager** (kubectl): Gère les contrôleurs qui surveillent l'état du cluster et apportent les modifications nécessaires pour maintenir l'état désiré (par exemple, redémarrage des pods en cas de défaillance).
   - **kube-scheduler** : Assigne les pods aux nœuds de travail en fonction des ressources disponibles et des contraintes de planification.
   - **etcd** : La base de données distribuée qui stocke l'état actuel du cluster, y compris les configurations et les métadonnées des objets Kubernetes.

![image info](./src/imgs/k8s_archi.png)

### ETCD

Etcd is a distributed, reliable, and fast **key-value store**. It is widely used in systems like Kubernetes to store critical configuration data, ensuring the system remains consistent even in distributed setups. Let’s break it down:

1. **Key-Value Store**: Unlike traditional relational databases (e.g., SQL), which store data in tables with rows and columns, a key-value store manages data as pairs (a key and its associated value). This is useful for storing configuration data where you just need to look up values quickly based on a unique key.

2. **Distributed System**: Etcd can run in a cluster with multiple nodes to ensure high availability and fault tolerance. This means if one node fails, others can still serve data.

3. **Reliability**: Etcd uses the **RAFT consensus algorithm** to make sure that all nodes in a cluster agree on the current state, ensuring consistent data even if nodes fail or are added.

#### Key Concepts

- **Keys and Values**: You store data using a unique key and retrieve it using the same key. For example:
  - Store: `etcdctl put key1 "value1"`
  - Retrieve: `etcdctl get key1`

- **Versioning**: Etcd has seen significant changes between versions:
  - **v2.x**: Earlier version, widely used but slower and less efficient than v3.
  - **v3.x**: Improved performance and API. Most modern systems, including Kubernetes, use Etcd v3.

#### Using etcd

1. **Installation**: Download the appropriate binaries from the [GitHub releases](https://github.com/etcd-io/etcd/releases), extract them, and run the etcd executable to start the service.
   - Etcd runs on port `2379` by default.
   
   1. Download Binaries
      curl -L https://github.com/etcd-io/etcd/releases/download/v3.3.11/etcd-
      v3.3.11-linux-amd64.tar.gz -o etcd-v3.3.11-linux-amd64.tar.gz
      tar xzvf etcd-v3.3.11-linux-amd64.tar.gz
      ./etcd
      Operate
  2. Extract
    tar xzvf etcd-v3.3.11-linux-amd64.tar.gz
  3. Run ETCD Service
    ./etcd

2. **etcdctl**: This is the command-line client to interact with etcd.
   - To set a key: `etcdctl set mykey "myvalue"`
   - To get a key: `etcdctl get mykey`
   - To check etcd version: `etcdctl version`

3. **API Versions**: etcdctl can operate in v2 or v3 API modes.
   - To use v3 API, set the environment variable: `ETCDCTL_API=3`

#### Why Use etcd?

- **Consistency**: Etcd ensures that data is consistent across distributed systems.
- **Kubernetes**: It plays a critical role as Kubernetes uses etcd to store all cluster data, making it essential for cluster state management.

**Next Steps**:
In future lessons, you'll explore how to set up etcd in a high-availability environment, the RAFT consensus algorithm, and how it integrates with Kubernetes for managing cluster state.

### kube-apiserver

We will discuss the **kube-apiserver**, the core management component in Kubernetes.

When you run a `kubectl` command, it communicates with the **kube-apiserver**, which handles the following key tasks:
1. **Authenticating and validating requests**.
2. **Retrieving and updating data** from the **etcd** cluster, the main data store for the cluster.

For example, when creating a pod:
- The API server **authenticates and validates** the request.
- It creates the **pod object** without assigning it to a node.
- It updates **etcd** with the pod information.
- The **scheduler** monitors the API server, detects the new pod, selects a node, and informs the API server.
- The API server updates **etcd** with the node assignment and passes this information to the **kubelet** on the assigned node.
- The **kubelet** then instructs the container runtime to deploy the pod and updates the API server once completed. The api server then updates the data in the etcd.
- The **kube-apiserver** is central to all actions in the cluster, handling **authentication, validation**, and **interaction with etcd**.

**In summary:**
- Other components, such as the **scheduler**, **kube-controller-manager**, and **kubelet**, communicate with the cluster via the **kube-apiserver**.

**Setup and Configuration:**
If you used **kubeadm** to bootstrap your cluster, the **kube-apiserver** runs as a pod in the **kube-system** namespace. The configuration is located in `/etc/kubernetes/manifests/kube-apiserver.yaml`. In non-kubeadm setups, you can find its configuration in `/etc/systemd/system/kube-apiserver.service`.

The **kube-apiserver** is run with many options, including **certificates** for secure communication between components and the **etcd servers**' location. You can inspect these options by viewing the respective configuration files or listing the processes on the master node.


### Kube Controller Manager 

The **Kube Controller Manager** manages various controllers in Kubernetes, each with specific responsibilities. Controllers are like departments that monitor the state of different components in the system and take actions to ensure the system operates as desired.

#### Key Functions of Controllers:
**Controllers** are processes that continuously monitor and adjust the state of the cluster. For example:
  - The **Node Controller** monitors the health of nodes, checking their status every 5 seconds. If a node becomes unreachable (after 40 seconds), the Node Controller waits for 5 minutes before removing its pods and reallocating them to healthy nodes (if they belong to a ReplicaSet).
  - The **Replication Controller** ensures that the desired number of pods are running within a ReplicaSet. If a pod dies, it creates another one.

These are just two examples, but many controllers exist in Kubernetes, managing resources like **deployments, services, namespaces, and persistent volumes**.

#### **Kube Controller Manager** Overview:
- All controllers are packaged into a single process called the **Kube Controller Manager**. When installed, it automatically includes the various controllers.
  
- The **Kube Controller Manager** communicates with the **kube-apiserver** to ensure the cluster's state matches the desired state defined by the user.

#### Configuration:
- The **Kube Controller Manager** can be customized via various options, including settings like:
  - **Node monitor period** (time interval for checking node status).
  - **Grace period** (time before marking a node as unreachable).
  - **Eviction timeout** (time before removing pods from an unreachable node).
  
- By default, all controllers are enabled, but you can specify which ones to activate via the `--controllers` option.

#### Viewing and Managing:
- If you set up your cluster using **kubeadm**, the **Kube Controller Manager** runs as a pod in the **kube-system** namespace, with configuration in `/etc/kubernetes/manifests/kube-controller-manager.yaml`.
- In a non-kubeadm setup, the configuration is located in the `/etc/systemd/system/kube-controller-manager.service`.

The **Kube Controller Manager** plays a crucial role in maintaining the health and consistency of the Kubernetes cluster by ensuring that resources like nodes and pods are always in the desired state.


### Kube-Scheduler

The **Kube-Scheduler** is responsible for deciding which node will run a given pod in a Kubernetes cluster. However, the scheduler does not actually place the pod on the node—that is the job of the **kubelet**. The scheduler’s role is to determine the best node for each pod based on resource availability and other criteria.

#### Key Functions:
- The scheduler matches pods to nodes by analyzing the **resource requirements** of the pod (CPU, memory) and the **available capacity** on the nodes.
- It operates in two phases:
  1. **Filtering**: The scheduler eliminates nodes that don't meet the resource needs of the pod.
  2. **Ranking**: The scheduler ranks the remaining nodes based on a priority function, which can include factors like how much free capacity a node will have after placing the pod. The node with the highest score is chosen.

#### Decision Factors:
- **Resource requirements** (e.g., CPU, memory).
- **Node-specific configurations** like **node selectors**, **taints and tolerations**, and **affinity rules**.
- After filtering nodes that do not meet the pod's requirements, the scheduler assigns a score to the remaining nodes to determine the best fit.

#### Installation and Configuration:
- If your cluster is set up using **kubeadm**, the **kube-scheduler** runs as a pod in the **kube-system** namespace on the master node, with configuration located in `/etc/kubernetes/manifests/kube-scheduler.yaml`.
- In a non-kubeadm setup, the **kube-scheduler** runs as a service, and you can view the options in the configuration file located at `/etc/systemd/system/kube-scheduler.service`.

#### Customization:
- Kubernetes allows for custom schedulers if the default one does not fit your needs. You can create and deploy your own scheduler to handle specific use cases or resource constraints.

The **Kube-Scheduler** is essential for managing how resources are allocated across nodes, ensuring that pods are placed on nodes that can best handle their workload. Advanced topics like **taints and tolerations**, **affinity rules**, and **node selectors** are 
used to further customize how scheduling works in a Kubernetes cluster.


### Kubelet

The **kubelet** is the primary agent on a Kubernetes **worker node**, responsible for managing the state of the node and its pods. It acts as the point of contact between the **Kubernetes control plane** (master node) and the worker node.

#### Key Functions:
- **Node Registration**: The kubelet registers the node with the Kubernetes cluster.
- **Pod Management**: When the kubelet receives instructions from the **scheduler** to run a pod, it interacts with the **container runtime engine** (like Docker) to pull the necessary container images and start the pod.
- **Monitoring and Reporting**: The kubelet continuously monitors the status of the node and the containers running on it. It sends status reports to the **kube-apiserver** to ensure the cluster is functioning correctly.

#### Installation and Configuration:
- Unlike other components, **kubeadm** does not automatically install the **kubelet**. You must manually install the kubelet on each worker node.
- To install, download the kubelet, extract it, and run it as a service.
  
- You can inspect the running kubelet process and view its options by listing the processes on the worker node and searching for "kubelet."

#### Advanced Topics:
- **Configuration**: The kubelet can be customized and configured with specific options.
- **TLS Bootstrapping**: Securing communication with the Kubernetes cluster via **TLS certificates** is a crucial part of the kubelet’s setup, which will be covered later.

The **kubelet** is essential for managing workloads on the worker nodes, ensuring containers are properly running and reporting their status back to the Kubernetes control plane.


### Kube-Proxy

The **kube-proxy** is a critical networking component in Kubernetes, enabling communication between pods and services within the cluster. It ensures that traffic intended for a service is forwarded to the appropriate pods.

#### Key Functions:
- **Pod Networking**: Each pod in Kubernetes can communicate with any other pod using an internal **virtual network**. This network spans all nodes, allowing for pod-to-pod communication.
- **Service Discovery**: Pods communicate with other pods, such as a web app reaching a database pod, via IP addresses. However, pod IPs are not static. To solve this, Kubernetes introduces **services** to provide a stable IP or name for pods.
- **Service IP Routing**: Services are virtual components that map traffic to backend pods. The **kube-proxy** manages the routing rules to forward traffic from a service IP to the actual pod IP.
  
#### How Kube-Proxy Works:
- **Traffic Forwarding**: When a service is created, kube-proxy updates the network rules (e.g., using **iptables**) on each node to route traffic meant for the service IP to the backend pod's IP.
- **Node-Based Deployment**: Kube-proxy runs as a **DaemonSet**, ensuring that one instance of the kube-proxy runs as a pod on each node in the cluster. This ensures every node can forward service-related traffic.

#### Installation:
- Kube-proxy can be installed by downloading its binary from the **Kubernetes release page**, extracting it, and running it as a service.
- When using **kubeadm**, kube-proxy is automatically deployed as a DaemonSet.

The **kube-proxy** plays a vital role in service discovery and traffic forwarding in Kubernetes, ensuring that services can be accessed by any pod across the cluster.


## 3. Objets Kubernetes

![image info](./src/imgs/k8s_objets.png)
En Kubernetes, un **workload** fait référence à une application ou un ensemble de processus déployés dans un cluster. Kubernetes offre plusieurs types de workloads pour répondre à différents types d'applications et de besoins de gestion. Voici les principaux types de workloads Kubernetes :
1. **Pod**
2. **Deployment**
3. **StatefulSet**
4. **DaemonSet**
5. **ReplicaSet**
6. **Job**
7. **CronJob**
8. **Horizontal Pod Autoscaler (HPA)**
9. **Vertical Pod Autoscaler (VPA)**
10. **ReplicationController**
11. **Tâches Sidecar (Pattern Sidecar)**
    
### L’API et les Objets Kubernetes
Utiliser Kubernetes consiste à déclarer des objets grâce à l’API Kubernetes pour décrire l’état souhaité d’un cluster : quelles applications ou autres processus exécuter, quelles images elles utilisent, le nombre de replicas, les ressources réseau et disque que vous mettez à disposition, etc.

On définit des objets généralement via l’interface en ligne de commande et **kubectl** de deux façons :
- en lançant une commande **kubectl run conteneur** ..., **kubectl expose** ...
- en décrivant un objet dans un fichier YAML ou JSON et en le passant au client **kubectl apply -f monpod.yml**
  
Vous pouvez également écrire des programmes qui utilisent directement l’API Kubernetes pour interagir avec le cluster et définir ou modifier l’état souhaité. 
### La commande apply
Kubernetes encourage le principe de l’infrastructure-as-code : il est recommandé d’utiliser une description YAML et versionnée des objets et configurations Kubernetes plutôt que la CLI.

Pour cela la commande de base est **kubectl apply -f object.yaml**.

La commande inverse **kubectl delete -f object.yaml** permet de détruire un objet précédement appliqué dans le cluster à partir de sa description.

Lorsqu’on vient d’appliquer une description on peut l’afficher dans le terminal avec **kubectl apply -f myobj.yaml view-last-applied**

Globalement Kubernetes garde un historique de toutes les transformations des objets : on peut explorer, par exemple avec la commande **kubectl rollout history deployment**.
### Syntaxe de base d’une description YAML Kubernetes
Les description YAML permettent de décrire de façon lisible et manipulable de nombreuses caractéristiques des ressources Kubernetes (un peu comme un Compose file par rapport à la CLI Docker).

Exemples:
Création d’un service simple :

```yaml
kind: Service
apiVersion: v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
spec:
  ports:
    - port: 443
      targetPort: 8443
  selector:
    k8s-app: kubernetes-dashboard
  type: NodePort

```

Création d’un “compte utiliseur” ServiceAccount

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
```

Remarques de syntaxe :

- Toutes les descriptions doivent commencer par spécifier la version d’API (minimale) selon laquelle les objets sont censés être créés
- Il faut également préciser le type d’objet avec kind
- Le nom dans metadata:\n name: value est également obligatoire.
- On rajoute généralement une description longue démarrant par spec:

**Description de plusieurs ressources**
On peut mettre plusieurs ressources à la suite dans un fichier k8s : cela permet de décrire une installation complexe en un seul fichier
  - par exemple le dashboard Kubernetes https://github.com/kubernetes/dashboard/blob/master/aio/deploy/recommended.yaml

L’ordre n’importe pas car les ressources sont décrites déclarativement c’est-à-dire que:
- Les dépendances entre les ressources sont déclarées
- Le control plane de Kubernetes se charge de planifier l’ordre correct de création en fonction des dépendances (pods avant le déploiement, rôle avec l’utilisateur lié au rôle)
- On préfère cependant les mettre dans un ordre logique pour que les humains puissent les lire

On peut sauter des lignes dans le YAML et rendre plus lisible les descriptions
On sépare les différents objets par ---
### 3.1 Les namespaces
Tous les objets Kubernetes sont rangés dans différents espaces de travail isolés appelés **namespaces**.
Cette isolation permet 3 choses :
- ne voir que ce qui concerne une tâche particulière (ne réfléchir que sur une seule chose lorsqu’on opère sur un cluster)
- créer des limites de ressources (CPU, RAM, etc.) pour le namespace
- définir des rôles et permissions sur le namespace qui s’appliquent à toutes les ressources à l’intérieur.
- Lorsqu’on lit ou créé des objets sans préciser le namespace, ces objets sont liés au namespace **default**.

Pour utiliser un namespace autre que **default** avec **kubectl** il faut :

le préciser avec l’option -n : **kubectl get pods -n kube-system**
créer une nouvelle configuration dans la kubeconfig pour changer le namespace par defaut.
Kubernetes gère lui-même ses composants internes sous forme de pods et services.

- Si vous ne trouvez pas un objet, essayez de lancer la commande kubectl avec l’option **-**A ou **--all-namespaces**

In this lecture, we explore **namespaces** in Kubernetes, which provide a way to organize and manage resources within a cluster. Here's a breakdown of the key concepts and operational aspects covered in the lecture:

#### Key Concepts

1. **Analogy of Namespaces**:
   - Just as two boys named Mark are differentiated by their last names (e.g., Mark Smith and Mark Williams), namespaces in Kubernetes help distinguish resources.
   - Each namespace acts like a separate house, allowing for resource isolation and management.

2. **Default Namespaces**:
   - The default namespace is automatically created by Kubernetes when a cluster is set up. This is where most of the objects (like Pods, Deployments, Services) are created unless specified otherwise.
   - Kubernetes also creates two additional namespaces:
     - **kube-system**: For Kubernetes system components and services.
     - **kube-public**: For resources accessible to all users.

3. **Creating and Using Custom Namespaces**:
   - You can create your own namespaces to isolate resources. For example, separate namespaces for development and production environments help prevent accidental modifications across environments.
   - Namespaces allow for resource quotas, defining how many resources can be used, which ensures fair resource distribution.

4. **Communication Between Namespaces**:
   - Resources within the same namespace can refer to each other by name.
   - To communicate with services in other namespaces, use the format: `servicename.namespace.svc.cluster.local`. The last part (`cluster.local`) is the default domain name for the cluster.

#### Operational Aspects

1. **Listing Pods by Namespace**:
   - Use `kubectl get pods` to list pods in the default namespace.
   - To list pods in another namespace, include the `--namespace` option, like `kubectl get pods --namespace=kube-system`.

2. **Creating a Pod in a Specific Namespace**:
   - You can specify the namespace when creating a Pod with `kubectl create -f pod-definition.yaml --namespace=dev`.
   - Alternatively, include the namespace in the Pod definition file under the metadata section.

3. **Creating a New Namespace**:
   - Use a namespace definition file, specifying `apiVersion: v1`, `kind: Namespace`, and a `metadata` section with a name.
   - Or run the command: `kubectl create namespace dev`.

4. **Switching Context to a Namespace**:
   - To avoid specifying the namespace every time, set the current context to a specific namespace using:
     ```
     kubectl config set-context --current --namespace=dev
     ```
   - After this, you can run `kubectl get pods` without specifying the namespace.

5. **Viewing All Pods Across Namespaces**:
   - To see all pods in all namespaces, use:
     ```
     kubectl get pods --all-namespaces
     ```

6. **Resource Quotas**:
   - To limit resources in a namespace, create a resource quota definition file that specifies the namespace and desired limits (e.g., pods, CPU, memory).
   - Resource quotas help manage resource allocation and ensure that no single namespace consumes more than its share.

#### Conclusion
Namespaces in Kubernetes provide an essential mechanism for resource isolation and management, especially as applications grow and require different environments (like development, testing, and production). They facilitate better organization and help prevent conflicts between resources while enabling easier resource management through quotas and policies.


### 3.2 Les Pods
Un Pod est l’unité d’exécution de base d’une application Kubernetes que vous créez ou déployez. Un Pod représente des process en cours d’exécution dans votre Cluster.

Un Pod encapsule un conteneur (ou souvent plusieurs conteneurs), des ressources de stockage, **une IP réseau unique**, et des options qui contrôlent comment le ou les conteneurs doivent s’exécuter (ex: restart policy). Cette collection de conteneurs et volumes tournent dans le même environnement d’exécution mais les processus sont isolés.

Un Pod représente une unité de déploiement : un petit nombre de conteneurs qui sont étroitement liés et qui partagent :

- les mêmes ressources de calcul
- des volumes communs
- la même IP donc le même nom de domaine
- peuvent se parler sur localhost
- peuvent se parler en IPC
- ont un nom différent et des logs différents

Chaque Pod est destiné à exécuter une instance unique d’un workload donné. Si vous désirez mettre à l’échelle votre workload, vous devez multiplier le nombre de Pods avec un déploiement

Kubernetes fournit un ensemble de commande pour débugger des conteneurs :

```bash
kubectl logs <pod-name> -c <conteneur_name> (le nom du conteneur est inutile si un seul)
kubectl exec -it <pod-name> -c <conteneur_name> -- bash
kubectl attach -it <pod-name>
```

Enfin, pour debugger la sortie réseau d’un programme on peut rapidement forwarder un port depuis un pods vers l’extérieur du cluster :

```bash
kubectl port-forward <pod-name> <port_interne>:<port_externe>
# /!\ C’est une commande de debug seulement : pour exposer correctement des processus k8s, il faut créer un service, par exemple avec NodePort. /!\
```

Pour copier un fichier dans un pod on peut utiliser: 
```bash
kubectl cp <pod-name>:</path/to/remote/file> </path/to/local/file>
```

Pour monitorer rapidement les ressources consommées par un ensemble de processus il existe les commande 
```bash
kubectl top nodes 
# et
kubectl top pods
```

Un manifeste de Pod rancher-demo-pod.yaml

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: rancher-demo-pod
spec:
  containers:
    - image: monachus/rancher-demo:latest
      name: rancher-demo-container
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP
    - image: redis
      name: redis-container
      ports:
        - containerPort: 6379
          name: http
          protocol: TCP

```

Before discussing pods in Kubernetes, let's assume that:
- Your application has been developed and is available as a Docker image.
- The Kubernetes cluster is already set up and operational (either single-node or multi-node).
  
In Kubernetes, the goal is to deploy applications in the form of containers across worker nodes in a cluster. However, Kubernetes doesn’t deploy containers directly onto worker nodes; instead, it encapsulates them into an object called **Pods**.

#### Key Concepts of Pods:
1. **Definition**: A pod is the smallest, most basic deployable unit in Kubernetes and is a single instance of an application.
   
2. **Single Container Pod**: In the simplest scenario, a pod contains one container, which represents an instance of your application.

3. **Scaling**: 
   - To scale your application, you do not add more containers to a single pod. Instead, you create new pods, each with its own instance of the application.
   - Pods can be distributed across different nodes if necessary, to balance load or if one node reaches capacity.

4. **Multi-Container Pods**:
   - Though rare, a pod can contain multiple containers if they are performing different tasks. For example, a web application might have a helper container for processing data alongside the main application container.
   - Containers within the same pod share resources, such as network and storage, and can communicate via `localhost`.

#### Containers & Pods in a Non-Kubernetes Environment:
Imagine you're deploying applications directly on Docker. Scaling involves running multiple `docker run` commands, each creating new containers. However, if the architecture grows complex (e.g., a helper container needs to work with the main app), you would need to manually link containers, manage their networks, and handle their lifecycle.

Kubernetes simplifies this through pods, as it automatically handles:
- Network connectivity
- Shared volumes
- Container lifecycle management

#### Basic Pod Operations:
- **Creating Pods**: Use `kubectl run` to deploy a Docker container by creating a pod. For example:
  ```bash
  kubectl run nginx --image=nginx
  ```
  This creates a pod that encapsulates an NGINX container.

- **Listing Pods**: To view running pods, use:
  ```bash
  kubectl get pods
  ```
  This command will show the status of the pod (e.g., `ContainerCreating`, `Running`).


#### Kubernetes Pods with YAML:

In Kubernetes, YAML files are used to define objects such as pods, deployments, services, etc. These files follow a specific structure, and creating a pod using a YAML configuration file is an essential task for Kubernetes management. Below is a summary of how to create and manage pods using YAML.

##### Key Components of a Kubernetes YAML File:
1. **API Version**:
   - Specifies the version of the Kubernetes API you're using.
   - For pods, the API version is typically `v1`.
   - Example:
     ```yaml
     apiVersion: v1
     ```

2. **Kind**:
   - Refers to the type of object you're creating. In this case, the object type is `Pod`.
   - Example:
     ```yaml
     kind: Pod
     ```

3. **Metadata**:
   - Contains metadata such as the **name** and **labels** for the object.
   - The name is a string value that identifies the pod, and labels are key-value pairs used to categorize and manage objects.
   - Example:
     ```yaml
     metadata:
       name: my-app-pod
       labels:
         app: my-app
     ```

4. **Spec**:
   - Defines the desired state of the pod, which includes container specifications.
   - You need to specify:
     - The **containers** field, which is a list of container objects. Each container can have its own properties like name and image.
   - Example:
     ```yaml
     spec:
       containers:
       - name: nginx-container
         image: nginx
     ```

##### Example YAML File to Create a Pod:
Here is a full example of a YAML configuration to create a pod running an NGINX container:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app-pod
  labels:
    app: my-app
spec:
  containers:
  - name: nginx-container
    image: nginx
```

##### Creating the Pod:
Once the YAML file is ready, use the following command to create the pod:
```bash
kubectl create -f pod-definition.yaml
```

##### Verifying the Pod:
- **List Pods**: To view the list of running pods:
  ```bash
  kubectl get pods
  ```
- **Describe Pod**: To get detailed information about the pod, including its labels, events, and container information:
  ```bash
  kubectl describe pod my-app-pod
  ```

**Summary:**
1. A Kubernetes YAML file has four top-level properties: `apiVersion`, `kind`, `metadata`, and `spec`.
2. In the `spec` section, you define container details, such as its name and Docker image.
3. Use `kubectl create -f <filename>` to create the pod and `kubectl get pods` to verify its status.

This method is a simple and efficient way to manage Kubernetes objects like pods through YAML.



### 3.3 Les ReplicaSet
Un **ReplicaSet** est un composant de Kubernetes utilisé pour garantir un nombre constant de pods en cours d'exécution dans un cluster. Il surveille l'état des pods et s'assure que le nombre spécifié de répliques est toujours disponible. Si un pod meurt ou échoue, le ReplicaSet en crée un nouveau pour maintenir le bon nombre de répliques.


Une des solutions de scaler votre Pod, nous utiliserons un objet Kubernetes, prévue à cet effet, soit les ReplicaSets.

Dans notre modèle, les ReplicaSet servent à gérer et sont responsables pour:

- la réplication (avoir le bon nombre d’instances et le scaling)
- la santé et le redémarrage automatique des pods de l’application (Self-Healing)

En général on ne les manipule pas directement (c’est déconseillé) même s’il est possible de les modifier et de les créer avec un fichier de ressource. Pour créer des groupes de conteneurs on utilise soit un Deployment soit d’autres formes de workloads (DaemonSet, StatefulSet, Job) adaptés à d’autres cas.


Fonctionnement :
- Il veille à ce que le nombre de répliques désiré soit exécuté à tout moment.
- Il surveille les pods basés sur leurs **labels** et garantit que le bon nombre de pods portant ces labels soit en cours d’exécution.
- Si un pod échoue, un nouveau est automatiquement créé pour compenser.

Exemple d'utilisation :
Voici un exemple d'un fichier YAML pour créer un ReplicaSet avec 3 répliques d'un pod Nginx.

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-replicaset
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

Ce fichier définit un ReplicaSet qui s'assure que 3 pods exécutant l'image Nginx sont toujours en cours d'exécution.

Commandes principales pour manipuler un ReplicaSet :

1. **Créer un ReplicaSet** :
   ```bash
   kubectl apply -f replicaset.yaml
   ```

2. **Lister les ReplicaSets** :
   ```bash
   kubectl get rs
   ```

3. **Afficher les détails d'un ReplicaSet** :
   ```bash
   kubectl describe rs <nom-du-replicaset>
   ```

4. **Modifier un ReplicaSet** (par exemple, changer le nombre de répliques) :
   ```bash
   kubectl edit rs <nom-du-replicaset>
   ```

5. **Supprimer un ReplicaSet** :
   ```bash
   kubectl delete rs <nom-du-replicaset>
   ```

6. **Mettre à jour un ReplicaSet** (par exemple, en modifiant l'image) :
   ```bash
   kubectl set image rs <nom-du-replicaset> <container-name>=<new-image>
   ```

#### Kubernetes Controllers: Replication Controller & Replica Set

**Kubernetes Controllers** are the brain behind Kubernetes, responsible for managing the desired state of objects. In this lecture, we focus on two important controllers: **Replication Controller** and **Replica Set**.

##### 1. **Replication Controller**
- Ensures a specified number of pod replicas are running at all times, even if it’s just one pod.
- Useful for **high availability** and **load balancing**. If one pod crashes, it ensures another one is created automatically.
- Allows you to run **multiple instances** of the same pod to handle increased load across multiple nodes.

##### 2. **Replica Set**
- **Replica Set** is a newer version of the Replication Controller and is preferred over the older Replication Controller.
- Ensures a fixed number of pod replicas are running at all times and can manage **pre-existing pods** by selecting them through **label selectors**.

###### YAML Structure for Replication Controller & Replica Set

Both controllers follow a similar structure in the YAML configuration file, but there are key differences.

###### Replication Controller YAML Example:
```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: my-app-rc
  labels:
    app: my-app
spec:
  replicas: 3
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: nginx-container
        image: nginx
```

###### Replica Set YAML Example:
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-app-rs
  labels:
    app: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: nginx-container
        image: nginx
```

###### Differences:
- **API Version**: 
  - Replication Controller uses `v1`, while Replica Set uses `apps/v1`.
- **Selector**: 
  - Replica Set requires a **selector** to define which pods it should manage. Replication Controller does not require this explicitly.
- **Use Case**: 
  - Replica Set can manage both **newly created pods** and **pre-existing pods** based on matching labels.

##### Commands
- **Creating a Replication Controller or Replica Set**:
  ```bash
  kubectl create -f rc-definition.yaml  # For Replication Controller
  kubectl create -f rs-definition.yaml  # For Replica Set
  ```

- **Listing Controllers**:
  ```bash
  kubectl get replicationcontrollers  # For Replication Controller
  kubectl get replicasets             # For Replica Set
  ```

- **Scaling a Replica Set**:
  - Update replicas in the YAML and replace:
    ```bash
    kubectl replace -f rs-definition.yaml
    ```
  - Use the `kubectl scale` command:
    ```bash
    kubectl scale --replicas=6 -f rs-definition.yaml
    ```

- **Deleting a Replica Set**:
  ```bash
  kubectl delete replicaset my-app-rs
  ```

##### Key Concepts:
- **Replication Controller**: Ensures a set number of pods are always running.
- **Replica Set**: More flexible, includes selectors to match existing pods.
- **Labels & Selectors**: Crucial for identifying and managing pods, especially in Replica Sets.



### 3.4 Les Deployments (deploy)
Les déploiements sont les objets effectivement créés manuellement lorsqu’on déploie une application. Ce sont des objets de plus haut niveau que les pods et replicaset et les pilote pour gérer un déploiement applicatif.
![image info](./src/imgs/k8s_deploy_archi.png)

Les poupées russes Kubernetes : un Deployment contient un ReplicaSet, qui contient des Pods, qui contiennent des conteneurs

Si c’est nécessaire d’avoir ces trois types de ressources c’est parce que Kubernetes respecte un principe de découplage des responsabilités.

La responsabilité d’un déploiement est de gérer la coexistence et le tracking de versions multiples d’une application et d’effectuer des montées de version automatiques en haute disponibilité en suivant une RolloutStrategy (CF. TP optionnel).

Ainsi lors des changements de version, un seul deployment gère automatiquement deux replicasets contenant chacun une version de l’application : le découplage est nécessaire.

Un deployment implique la création d’un ensemble de Pods désignés par une étiquette label et regroupé dans un Replicaset.

  ```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
name: nginx-deployment
labels:
  app: nginx
spec:
replicas: 3
strategy:
  type: Recreate
selector:
  matchLabels:
    app: nginx
template:
  metadata:
    labels:
      app: nginx
  spec:
    containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
          - containerPort: 80
  ```


In this lecture, we dive into **Kubernetes deployments**, a higher-level object that manages pods and ReplicaSets, offering powerful features like **rolling updates**, **rollbacks**, and the ability to **pause and resume** changes. Deployments make managing the lifecycle of your application in production easier and more reliable.

#### Key Features of Kubernetes Deployments:
1. **Multiple Instances**: Deploy many instances of your application to handle increased load or ensure high availability.
2. **Rolling Updates**: Seamlessly upgrade application instances one by one, ensuring that your application remains available during updates.
3. **Rollback**: If something goes wrong during an update, easily roll back to a previous version.
4. **Pause and Resume**: Apply multiple changes (e.g., scaling, updating containers, modifying resources) and then resume them all at once, controlling when the changes take effect.

#### Deployments vs. ReplicaSets
- **Pods**: Represent a single instance of your application.
- **ReplicaSets**: Manage multiple pod replicas, ensuring the desired number is running at all times.
- **Deployments**: Provide an abstraction over ReplicaSets and allow for advanced features like rolling updates and rollbacks.

#### YAML Example for Deployment:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-deployment
  labels:
    app: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: nginx-container
        image: nginx:1.16
```

#### Key Sections:
- **API Version**: Use `apps/v1` for deployments.
- **Kind**: Set to `Deployment`.
- **Metadata**: Name your deployment and add labels.
- **Spec**:
  - **Replicas**: Define the number of pod instances you want.
  - **Selector**: Specifies which pods the deployment should manage.
  - **Template**: Defines the pod structure, similar to ReplicaSet.

#### Commands:
- **Create a deployment**:
  ```bash
  kubectl create -f deployment-definition.yaml
  ```

- **View deployment**:
  ```bash
  kubectl get deployments
  ```

- **View ReplicaSet created by the deployment**:
  ```bash
  kubectl get replicasets
  ```

- **View pods managed by the ReplicaSet**:
  ```bash
  kubectl get pods
  ```

- **View all objects (deployments, ReplicaSets, pods)**:
  ```bash
  kubectl get all
  ```


You're absolutely right! Using the `kubectl run` and `kubectl create` commands to generate YAML templates can save a lot of time and effort, especially during an exam or for quick prototyping. Here's a summary of how these commands work and how to apply them effectively:

#### Key `kubectl` Commands for Creating Pods, Deployments, and YAML Files:

#### 1. **Create an NGINX Pod:**
This command quickly creates a pod named `nginx` running the NGINX image.
```bash
kubectl run nginx --image=nginx
```

#### 2. **Generate a Pod YAML File (without creating the pod):**
This command generates the YAML manifest for a pod without creating it. The `--dry-run=client` flag ensures the pod isn't actually created, and the `-o yaml` outputs the definition in YAML format.
```bash
kubectl run nginx --image=nginx --dry-run=client -o yaml
```

#### 3. **Create a Deployment:**
To create a deployment named `nginx` with the NGINX image, use the following:
```bash
kubectl create deployment nginx --image=nginx
```

#### 4. **Generate a Deployment YAML File (without creating the deployment):**
This is useful when you want to preview or modify the deployment configuration before creating it.
```bash
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml
```

#### 5. **Generate and Save a Deployment YAML File:**
You can save the YAML output directly to a file for further modifications.
```bash
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml
```

#### 6. **Modify the YAML File (e.g., change replicas) and Apply It:**
After generating the file, you can edit it (e.g., set the number of replicas), and then use `kubectl create` or `kubectl apply` to create the deployment.
```bash
kubectl create -f nginx-deployment.yaml
```

#### 7. **Create a Deployment with Specific Number of Replicas (in Kubernetes 1.19+):**
In Kubernetes 1.19 and later, you can use the `--replicas` option to create a deployment with a specified number of replicas directly.
```bash
kubectl create deployment nginx --image=nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml
```

After editing, you can apply the deployment as usual:
```bash
kubectl apply -f nginx-deployment.yaml
```

#### Benefits of Using `kubectl` Commands Instead of YAML:
- **Speed and Efficiency**: Directly creating objects like Pods or Deployments with a single command is faster than writing the YAML from scratch.
- **Customizability**: The `--dry-run=client -o yaml` allows you to generate a YAML template, which you can tweak as needed.
- **CLI-based**: Avoid issues with copying and pasting YAML files in the CLI, which can save time and reduce errors during exams or hands-on tasks.

By practicing these commands regularly, you’ll be well-prepared to handle exam scenarios efficiently!  

#### Summary:
Deployments simplify managing application updates, scaling, and rollbacks. They automatically create ReplicaSets, which in turn manage the pods. This abstraction provides robust features for maintaining a stable production environment. In the next lectures, we will explore these features in depth, including how to apply rolling updates and rollbacks.


### 3.5 Les Services

Dans Kubernetes, un service est un objet qui :

- Désigne un ensemble de pods (grâce à des tags) généralement géré par un déploiement
- Fournit un endpoint réseau pour les requêtes à destination de ces pods.
- Configure une politique permettant d’y accéder depuis l’intérieur ou l’extérieur du cluster.

L’ensemble des pods ciblés par un service est déterminé par un selector.

Par exemple, considérons un backend de traitement d’image (stateless, c’est-à-dire ici sans base de données) qui s’exécute avec 3 replicas. Ces replicas sont interchangeables et les frontends ne se soucient pas du backend qu’ils utilisent. Bien que les pods réels qui composent l’ensemble backend puissent changer, les clients frontends ne devraient pas avoir besoin de le savoir, pas plus qu’ils ne doivent suivre eux-mêmes l’état de l’ensemble des backends.

L’abstraction du service permet ce découplage : les clients frontend s’addressent à une seule IP avec un seul port dès qu’ils ont besoin d’avoir recours à un backend. Les backends vont recevoir la requête du frontend aléatoirement.

Les Services sont de trois types principaux :

- ClusterIP: expose le service sur une IP interne au cluster. Les autres pods peuvent alors accéder au service de l’intérieur du cluster, mais il n’est pas l’extérieur.
- NodePort: expose le service depuis l’IP de chacun des noeuds du cluster en ouvrant un port directement sur le nœud, entre 30000 et 32767. Cela permet d’accéder aux pods internes répliqués. Comme l’IP est stable on peut faire pointer un DNS ou Loadbalancer classique dessus.
- LoadBalancer: expose le service en externe à l’aide d’un Loadbalancer de fournisseur de cloud. Les services NodePort et ClusterIP, vers lesquels le Loadbalancer est dirigé sont automatiquement créés.

![image info](./src/imgs/k8s_services_types.png){ width=90%, height=30% }

This lecture provides a comprehensive overview of **Kubernetes Services** and their role in enabling communication between various components of an application, both internally and externally. Here's a summary of the key concepts covered:

#### **Kubernetes Services Overview**
- **Purpose**: Services enable communication between groups of Pods (e.g., frontend, backend) or between external users and Pods. They provide a way to expose applications running in Pods to the outside world or other services within the cluster.
- **Use Cases**: Services allow for loose coupling between microservices in an application by facilitating connectivity.

#### **Networking in Kubernetes**
- **Pod Network**: Pods typically reside in an internal network (e.g., 10.244.0.0/16). External users can't directly access Pods since they are on a separate network.
- **Node Access**: By SSH-ing into the node, you can access the Pod’s IP (this is from inside the Kubernetes node), but to expose the application externally (without having to SSH into the node), you need a service.

#### **Types of Kubernetes Services**
1. **NodePort**:
   - Exposes the application on a specific port of each node in the cluster (port range 30,000-32,767).
   - Allows external users to access applications via the node’s IP and the NodePort.
   
2. **ClusterIP**:
   - Creates a virtual IP address within the cluster, enabling communication between different services (e.g., frontend to backend).
   
3. **LoadBalancer**:
   - Provisions a load balancer, especially useful for distributing traffic in cloud environments.

#### **NodePort Service in Detail**
- **Ports Involved**:
  1. **TargetPort**: The port on the Pod where the actual service (e.g., web server) is running (e.g., port 80).
  2. **Port**: The port on the Service object.
  3. **NodePort**: The port exposed on the node itself, accessible externally.
  
- **Example**: A service could map port 30,008 on the node to port 80 on the Pod, allowing external users to access the application by visiting `http://<NodeIP>:30008`.

#### **Creating a NodePort Service**
- **Definition File**:
  - The file structure is similar to other Kubernetes objects (e.g., Pods, Deployments) with API version, kind, metadata, and spec sections.
  - The **type** in the spec section is set to `NodePort`.
  - **Ports**: Define `targetPort`, `port`, and `nodePort`. The `nodePort` can be specified or automatically assigned.
  - **Selector**: Labels are used to link the service to the correct Pods.

#### **Connecting Services to Pods**
- Labels and selectors are used to match Pods with services. The service forwards traffic to any Pod with the matching label.

#### **Load Balancing and High Availability**
- If multiple Pods exist with the same labels, the service will load-balance traffic across them using a random algorithm.
- If Pods are spread across multiple nodes, the service will automatically expose the application on the same `NodePort` on all nodes.

#### **Service Flexibility and Adaptation**
- Kubernetes services automatically update as Pods are added or removed, making them highly flexible and adaptive without additional configuration.

In conclusion, **Kubernetes Services** are essential for enabling connectivity within a cluster, and between a cluster and the outside world. They provide load balancing, internal communication, and the ability to expose applications externally. The creation and management of services is straightforward, and Kubernetes handles much of the complexity under the hood, particularly in dynamic environments where Pods are constantly changing.


### 3.6 **ClusterIP Services**

This lecture explains how **Kubernetes ClusterIP Services** are used to enable communication between different components of a full-stack application hosted in a Kubernetes cluster.

#### Key Concepts:

1. **Full-Stack Application in Kubernetes**:
   - Applications often have multiple layers like front-end servers, back-end servers, databases (e.g., MySQL), and caching systems (e.g., Redis). Each of these is typically hosted in separate Pods.
   
2. **Dynamic Pod IPs**:
   - Pods in Kubernetes have dynamic IP addresses, which change when Pods are recreated. This makes direct communication between Pods via their IPs unreliable.

3. **ClusterIP Service**:
   - A **ClusterIP Service** solves this issue by grouping Pods that perform the same function (e.g., multiple backend servers) under a single service IP, which remains static.
   - The service forwards traffic to one of the Pods in the group, effectively load-balancing the requests.
   - Other Pods can access this service using the service’s **ClusterIP** or the service name.

#### Creating a ClusterIP Service:

1. **Service Definition File**:
   A typical service definition in Kubernetes includes:
   - **apiVersion**: V1
   - **kind**: Service
   - **metadata**: Contains the name (e.g., "backend").
   - **spec**:
     - **type**: ClusterIP (default type, optional).
     - **ports**: Defines the port where the service and the backend Pods are exposed (e.g., port 80).
     - **selector**: Specifies which Pods this service targets, by matching labels on the Pods.

2. **Example Definition**:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: backend
spec:
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 80
  selector:
    app: backend-app
```

3. **Creating the Service**:
   Use the `kubectl create` command:
   ```bash
   kubectl create -f service-definition.yaml
   ```

4. **Verifying the Service**:
   To view the services created:
   ```bash
   kubectl get services
   ```

   This will show the **ClusterIP** and the port mappings.

#### Conclusion:
The **ClusterIP** service provides a stable network endpoint within the cluster to enable communication between different parts of the application. It abstracts the complexities of dynamic Pod IPs and ensures smooth internal communication.

### 3.7 **LoadBalancer Services**

This lecture covers the **LoadBalancer** service type in Kubernetes, which is commonly used to expose applications to external users with a single URL. It provides an easy way to manage external traffic for applications running in cloud environments like AWS, Google Cloud, or Azure.

#### Key Concepts:

1. **NodePort Services**:
   - The **NodePort** service exposes an application on a static port on all worker nodes in the Kubernetes cluster. Each node can then forward traffic from that port to the Pods running the service.
   - This works well for small setups, but users would need to know the specific node IP and port to access the application, which isn't user-friendly.

2. **External Load Balancer**:
   - Instead of providing individual node IP and port combinations to users, they typically want a single URL like `votingapp.com` or `resultapp.com`.
   - One solution is to set up an external load balancer manually (e.g., using **HAProxy** or **Nginx**), but this requires extra VMs, configuration, and ongoing maintenance.

3. **Cloud Provider Integration**:
   - When running Kubernetes on cloud platforms like **Google Cloud Platform (GCP)**, **AWS**, or **Azure**, Kubernetes can automatically provision the cloud provider’s native load balancer.
   - By setting the service type to **LoadBalancer**, Kubernetes integrates with the cloud platform’s load balancer service, automatically routing traffic to the correct Pods.
   
#### Using LoadBalancer in Kubernetes:

- **How LoadBalancer Works**:
   When you create a service of type `LoadBalancer` in Kubernetes on a supported cloud platform, the platform's native load balancer is automatically set up. It gives you a single external IP address that directs traffic to the appropriate worker nodes and then forwards it to the correct Pods based on the service definition.

- **Service Definition for LoadBalancer**:
   To create a service of type LoadBalancer, you modify the service definition to specify `type: LoadBalancer`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: frontend
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 80
  selector:
    app: frontend-app
```

- **Key Details**:
   - **port**: This is the port exposed by the LoadBalancer.
   - **targetPort**: The port on which the application is listening within the Pods.
   - **selector**: Labels to select the appropriate Pods to route traffic to.

4. **Supported Platforms**:
   - This service type only works on supported cloud platforms (e.g., AWS, GCP, Azure). In these environments, Kubernetes takes care of creating and configuring the load balancer for you.
   - If you try this on unsupported environments like **VirtualBox** or local Kubernetes setups (e.g., Minikube), it falls back to **NodePort** behavior, as no external load balancer is available.

#### Conclusion:
The **LoadBalancer** service in Kubernetes simplifies exposing applications with a single URL to users by leveraging cloud provider integrations. It removes the need for manual load balancer setup, making the deployment process smoother in cloud environments.



#### 3.6.5 les Secrets
Les Secrets se manipulent comme des objets ConfigMaps, mais sont faits pour stocker des mots de passe, des clés privées, des certificats, des tokens, ou tout autre élément de config dont la confidentialité doit être préservée. Un secret se créé avec l’API Kubernetes, puis c’est au pod de demander à y avoir accès.

Il y a 3 façons de donner un accès à un secret :

- le secret est un fichier que l’on monte en tant que volume dans un conteneur (pas nécessairement disponible à l’ensemble du pod). Il est possible de ne jamais écrire ce secret sur le disque (volume tmpfs).
- le secret est une variable d’environnement du conteneur.
- cas spécifique aux registres : le secret est récupéré par kubelet quand il pull une image.

Pour définir qui et quelle app a accès à quel secret, on utilise les fonctionnalités dites “RBAC” de Kubernetes
#### 3.6.6 Les CRD et Operators
Les CustomResourcesDefinition sont l’objet le plus méta de Kubernetes : inventés par Red Hat pour ses Operators, ils permettent de définir un nouveau type d’objet dans Kubernetes. Combinés à des Operators (du code d’API en Go), ils permettent d’étendre Kubernetes pour gérer de nouveaux objets qui eux-même interagissent avec des objets Kubernetes.

Exemples :

- la chart officielle de la suite Elastic (ELK) définit des objets de type elasticsearch
- KubeVirt permet de rajouter des objets de type VM pour les piloter depuis Kubernetes
- Azure propose des objets correspondant à ses ressources du cloud Azure, pour pouvoir créer et paramétrer des ressources Azure directement via la logique de Kubernetes

#### Jobs
#### CronJobs
#### Le Role-Based Access Control, les Roles et les RoleBindings


## 4. Scheduling dans Kubernetes
### 4. Qu'est-ce que le scheduling ?
### 4.1 **Manual Scheduling**

Here’s a summary of the lecture on manually scheduling a pod on a node in Kubernetes:

In this session, we explore the process of manually scheduling pods without using the default Kubernetes scheduler. Typically, Kubernetes' built-in scheduler automatically assigns pods to nodes by setting the **nodeName** field in the pod's definition after running its scheduling algorithm. However, without the scheduler, pods remain in a **Pending** state until they are manually scheduled.

#### Two Methods for Manually Scheduling Pods:

1. **Setting the nodeName field in the Pod definition:**
   - The easiest way to manually schedule a pod is by specifying the **nodeName** field in the pod's manifest during its creation. This field assigns the pod to the desired node directly at creation time.
   - This method must be done before the pod is created, as you cannot change the **nodeName** field for an already existing pod.

2. **Creating a Binding Object:**
   - If the pod is already created and in a pending state, you can assign it to a node by creating a **Binding Object**.
   - The binding object includes the target node's name and is sent as a **POST request** to the pod's **binding API**.
   - This mimics the behavior of the scheduler. The data must be in JSON format, requiring the conversion of the YAML file into JSON.

In summary, manually scheduling pods can be done either by specifying the node name during pod creation or by creating a binding object to assign a pod to a node after creation. Practice these techniques in the hands-on test provided.


#### **Labels and Selectors Overview:**
This lecture provides an in-depth explanation of **labels**, **selectors**, and **annotations** in Kubernetes, and their roles in organizing and managing Kubernetes objects.

- **Labels** are key-value pairs attached to Kubernetes objects, used to organize and group resources. They can represent various characteristics, such as application name, environment (e.g., production, development), or version.
- **Selectors** allow you to filter and select objects based on their labels, enabling you to query and operate on specific subsets of resources. For instance, you could filter all pods labeled with a specific application or version.

##### **Real-World Example:**
Imagine a collection of animals, each labeled by different attributes like class (mammal, bird), kind (domestic, wild), or color (green, brown). You could use selectors to filter based on criteria like "all green animals" or "all green birds."

#### **Labels and Selectors in Kubernetes:**
Kubernetes uses labels and selectors in several ways:
1. **Grouping Objects:** You can assign labels to Kubernetes objects like Pods, Services, and Deployments. This helps organize objects by their function, application, or environment.
2. **Selecting Objects:** You can use the `kubectl get` command with a selector option to retrieve a specific group of objects based on labels.

**Example of Defining Labels in a Pod:**
In a pod definition file, labels are added under the `metadata` section. Labels are written in a key-value format, and you can add as many as necessary.
```yaml
metadata:
  labels:
    app: app1
    function: frontend
```

Once labeled, you can use a selector to retrieve the object:
```bash
kubectl get pods --selector app=app1
```

#### **Connecting Objects with Labels:**
Kubernetes objects such as **ReplicaSets** and **Services** use labels and selectors to connect related resources:
- **ReplicaSets:** Labels help the ReplicaSet discover and manage the correct Pods. In the ReplicaSet definition file, labels are specified under the `template` section, and the `selector` field defines which Pods should be managed.
- **Services:** Similar to ReplicaSets, Services use selectors to find the right Pods to route traffic to. When the labels on Pods match the service selector, the connection is established.

##### **Common Pitfall:**
Beginner users might confuse labels defined on different objects. Remember:
- Labels under the **template** section of a ReplicaSet are for the Pods.
- Labels at the top are for the ReplicaSet itself, and they serve different purposes.

#### **Annotations:**
While **labels** and **selectors** are used to group and select objects, **annotations** store metadata that is not intended for querying but rather for informational purposes. These can include:
- Tool details (e.g., build versions, software names)
- Contact information (e.g., phone numbers, email addresses)
  
Annotations do not affect how Kubernetes interacts with objects, but they help provide useful metadata.

#### **Conclusion:**
Labels and selectors are essential for grouping and managing Kubernetes objects, while annotations provide additional metadata for informational purposes. Now, head over to the practice section to reinforce your understanding of working with labels, selectors, and annotations.

#### 4.3 **Taints and Tolerations :**

This lecture explains the concept of **taints and tolerations** in Kubernetes, which are used to control the scheduling of pods on specific nodes. These concepts help ensure that certain pods are only placed on particular nodes while preventing others from being scheduled there.

#### **Taints and Tolerations Overview:**
- **Taints** are applied to nodes and work as a way to repel pods, preventing them from being scheduled on that node unless they tolerate the taint.
- **Tolerations** are applied to pods and allow them to be scheduled on nodes with matching taints. If a pod tolerates the taint, it can be scheduled on the node.

##### **Analogy:**
- Imagine a person sprayed with repellent (taint) to prevent bugs (pods) from landing on them.
  - Most bugs will be repelled (pods cannot land).
  - Some bugs are tolerant to the repellent (pods with tolerations) and will land anyway.
  
In Kubernetes, nodes have taints, and pods have tolerations.

#### **Taints in Kubernetes:**
You can apply a taint to a node using the following command:
```bash
kubectl taint nodes <node-name> <key>=<value>:<effect>
```
- **key=value**: Identifies the taint, e.g., `app=blue`.
- **effect**: Defines what happens to non-tolerant pods.
  - `NoSchedule`: Pods that don’t tolerate the taint won’t be scheduled on this node.
  - `PreferNoSchedule`: The system will try to avoid placing pods on the node but won't enforce it.
  - `NoExecute`: New pods won’t be scheduled on the node, and existing non-tolerant pods will be evicted.

**Example Command:**
```bash
kubectl taint nodes node1 app=blue:NoSchedule
```
This applies a taint on `node1` that prevents any pod that doesn’t tolerate `app=blue` from being scheduled there.

#### **Tolerations in Kubernetes:**
To allow specific pods to be scheduled on tainted nodes, tolerations are added to the pod’s definition file under the `spec` section:
```yaml
tolerations:
  - key: "app"
    operator: "Equal"
    value: "blue"
    effect: "NoSchedule"
```
This toleration allows the pod to be scheduled on nodes tainted with `app=blue:NoSchedule`.

#### **How Taints and Tolerations Work Together:**
- Nodes with taints restrict which pods can be scheduled on them.
- Pods with matching tolerations can be scheduled on tainted nodes.

**Example Scenario:**
1. There are three nodes (Node1, Node2, Node3) and four pods (PodA, PodB, PodC, PodD).
2. You taint Node1 with `app=blue:NoSchedule`, meaning only pods with a toleration for `app=blue` can be scheduled on Node1.
3. PodD is given a toleration for `app=blue`, allowing it to be scheduled on Node1. The other pods (PodA, PodB, PodC) will be scheduled on Node2 and Node3.

#### **Taint Effects and Pod Scheduling:**
- If you set the **NoExecute** taint effect, any existing non-tolerant pods on the node will be evicted.
- The **NoSchedule** and **PreferNoSchedule** effects only affect future scheduling of pods.

#### **Master Node and Taints:**
By default, the **master node** in a Kubernetes cluster is tainted to prevent pods from being scheduled on it. This is a best practice to keep management processes running smoothly on the master node. You can see this taint by running:
```bash
kubectl describe node <master-node-name>
```

#### **Important Points to Remember:**
- **Taints** are applied to nodes to repel pods.
- **Tolerations** are applied to pods to allow them to tolerate specific taints.
- **Taints and tolerations** control where pods can be scheduled but do not direct a pod to a specific node. For that, **node affinity** is used, which will be discussed in the next lecture.

Head over to the coding exercises section to practice applying taints and tolerations in a Kubernetes cluster.

---


## 4. Le stockage dans Kubernetes
### 4.1 StorageClasses
Le stockage dans Kubernetes est fourni à travers des types de stockage appelés StorageClasses :

- dans le cloud, ce sont les différentes offres du fournisseur,
- dans un cluster auto-hébergé c’est par exemple :
  - un disque dur local ou distant (NFS)
  - ou bien une solution de stockage distribué
    - les plus connues sont Ceph et GlusterFS

**PersistentVolumeClaims et PersistentVolumes**
Quand un conteneur a besoin d’un volume, il crée une PersistentVolumeClaim : une demande de volume (persistant). Si un des objets StorageClass est en capacité de le fournir, alors un PersistentVolume est créé et lié à ce conteneur : il devient disponible en tant que volume monté dans le conteneur.

- les StorageClasses fournissent du stockage
- les conteneurs demandent du volume avec les PersistentVolumeClaims
- les StorageClasses répondent aux PersistentVolumeClaims en créant des objets PersistentVolumes : le conteneur peut accéder à son volume.

### 4.2 StatefulSets
On utilise les **Statefulsets** pour répliquer un ensemble de pods dont l’état est important : par exemple, des pods dont le rôle est d’être une base de données, manipulant des données sur un disque.

Un objet StatefulSet représente un ensemble de pods dotés d’identités uniques et de noms d’hôtes stables. Quand on supprime un StatefulSet, par défaut les volumes liés ne sont pas supprimés.

Les StatefulSets utilisent un nom en commun suivi de numéros qui se suivent. Par exemple, un StatefulSet nommé web comporte des pods nommés web-0, web-1 et web-2. Par défaut, les pods StatefulSet sont déployés dans l’ordre et arrêtés dans l’ordre inverse (web-2, web-1 puis web-0).

En général, on utilise des StatefulSets quand on veut :

- des identifiants réseau stables et uniques
- du stockage stable et persistant
- des déploiements et du scaling contrôlés et dans un ordre défini
- des rolling updates dans un ordre défini et automatisées

### 4.3 DaemonSets
Une autre raison de répliquer un ensemble de Pods est de programmer un seul Pod sur chaque nœud du cluster. En général, la motivation pour répliquer un Pod sur chaque nœud est de faire atterrir une sorte d’agent ou de démon sur chaque nœud, et l’objet Kubernetes pour y parvenir est le DaemonSet. Par exemple pour des besoins de monitoring, ou pour configurer le réseau sur chacun des nœuds.

Étant donné les similitudes entre les DaemonSets, les StatefulSets et les Deployments, il est important de comprendre quand les utiliser.

**Deployments, DaemonSets, StatefulSets**
- Les Deployments (liés à des ReplicaSets) doivent être utilisés :
  - lorsque votre application est complètement découplée du nœud
  - que vous pouvez en exécuter plusieurs copies sur un nœud donné sans considération particulière
  - que l’ordre de création des replicas et le nom des pods n’est pas important
  - lorsqu’on fait des opérations stateless
- Les DaemonSets doivent être utilisés :
  - lorsqu’au moins une copie de votre application doit être exécutée sur tous les nœuds du cluster (ou sur un sous-ensemble de ces nœuds).
- Les StatefulSets doivent être utilisés :
  - lorsque l’ordre de création des replicas et le nom des pods est important
  - lorsqu’on fait des opérations stateful (écrire dans une base de données)

### 4.4 Les ConfigMaps
D’après les recommandations de développement 12factor, la configuration de nos programmes doit venir de l’environnement. L’environnement est ici Kubernetes.

Les objets ConfigMaps permettent d’injecter dans des pods des fichiers de configuration en tant que volumes.

## 5 Le réseau dans Kubernetes
### 5.1 Les objets Services
### 5.2 Les network policies
### 5.3 Le loadbalancing
### 5.4 Les objets Ingresses


## 6. Sécurité dans Kubernetes
### 6.1 Concepts de base de la sécurité
### 6.2 Authentification et autorisation
### 6.3 Secrets et ConfigMaps
### 6.4 Network Policies
### 6.5 RBAC (Role-Based Access Control)

## 7. Gestion de la configuration et des versions
### 7.1 Helm et gestion des packages
### 7.2 GitOps et déploiement continu

## 8. Surveillance et Journalisation
## 9. Kubernetes dans le Cloud

## REF
https://cours.hadrienpelissier.fr/03-kubernetes/
https://supports.uptime-formation.fr/05-kubernetes/
https://kubernetes.training.datailor.fr/
https://learn.kodekloud.com
https://blog.stephane-robert.info/docs/conteneurs/orchestrateurs/kubernetes/introduction/