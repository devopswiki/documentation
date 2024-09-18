## Table of contents

- [Table of contents](#table-of-contents)
- [1. Resumé](#1-resumé)
  - [**Qu'est-ce que Kubernetes ?**](#quest-ce-que-kubernetes-)
  - [**Concepts Clés de Kubernetes**](#concepts-clés-de-kubernetes)
  - [**Architecture de Kubernetes**](#architecture-de-kubernetes)
  - [**Commandes Kubernetes de Base**](#commandes-kubernetes-de-base)
  - [**Scénarios d'Utilisation**](#scénarios-dutilisation)
- [**Exemple : Déployer une application web avec Kubernetes**](#exemple--déployer-une-application-web-avec-kubernetes)
  - [**1. Préparez votre fichier de configuration YAML**](#1-préparez-votre-fichier-de-configuration-yaml)
  - [**2. Déployez l'application**](#2-déployez-lapplication)
  - [**3. Vérifiez le déploiement**](#3-vérifiez-le-déploiement)
  - [**4. Accédez à l'application**](#4-accédez-à-lapplication)
  - [**Résumé des fichiers YAML**](#résumé-des-fichiers-yaml)
- [2. Questions](#2-questions)
  - [**1. Concepts de Base**](#1-concepts-de-base)
  - [**2. Composants du Cluster**](#2-composants-du-cluster)
  - [**3. Gestion des Applications**](#3-gestion-des-applications)
  - [**4. Stockage et Volumes**](#4-stockage-et-volumes)
  - [**5. Réseautage et Ingress**](#5-réseautage-et-ingress)
  - [**6. Sécurité et Authentification**](#6-sécurité-et-authentification)
  - [**7. Gestion des Déploiements**](#7-gestion-des-déploiements)
  - [**8. Debugging et Monitoring**](#8-debugging-et-monitoring)
  - [**9. Avancé et Concepts Complémentaires**](#9-avancé-et-concepts-complémentaires)
  - [**10. Intégrations et Extensions**](#10-intégrations-et-extensions)

## 1. Resumé

Bien sûr ! Voici un résumé de Kubernetes pour vous aider à préparer votre entretien technique :

### **Qu'est-ce que Kubernetes ?**
Kubernetes est une plateforme open-source pour automatiser le déploiement, la mise à l'échelle et la gestion des applications conteneurisées. Développé par Google et maintenant maintenu par la Cloud Native Computing Foundation (CNCF), Kubernetes permet de gérer des clusters de conteneurs de manière efficace et évolutive.

### **Concepts Clés de Kubernetes**

1. **Cluster** : Ensemble de machines (nœuds) qui exécutent vos conteneurs. Un cluster Kubernetes est composé d’un nœud maître et de nœuds de travail.

2. **Node (Nœud)** : Une machine individuelle dans un cluster Kubernetes. Il peut s’agir d’une machine virtuelle ou physique.

3. **Pod** : L'unité de base de déploiement dans Kubernetes. Un pod peut contenir un ou plusieurs conteneurs qui partagent le même réseau et le même stockage.

4. **Service** : Abstraction qui définit une politique d'accès aux pods. Il permet de gérer la communication entre les différents pods et les services externes.

5. **Deployment** : Objet qui gère le déploiement de pods. Il permet de spécifier combien de réplicas d’un pod doivent être exécutés et assure le déploiement sans interruption.

6. **ReplicaSet** : Assure que le nombre spécifié de répliques de pods est en cours d'exécution à tout moment.

7. **StatefulSet** : Gère les déploiements de pods avec état. Il est utilisé pour les applications nécessitant des identifiants persistants et un stockage stable.

8. **DaemonSet** : Assure qu’un pod est exécuté sur chaque nœud dans un cluster.

9. **Job** : Exécute un ou plusieurs pods pour accomplir une tâche unique et la termine lorsqu’elle est réussie.

10. **Namespace** : Permet de diviser un cluster Kubernetes en plusieurs environnements logiques pour la gestion et l’isolation des ressources.

11. **ConfigMap et Secret** : Permettent de gérer les configurations et les données sensibles de manière centralisée.

12. **Ingress** : Gère l'accès externe aux services dans un cluster, généralement via HTTP et HTTPS.

13. **Volume** : Fournit un stockage persistant aux pods. Les types de volumes incluent les volumes éphémères et les volumes persistants.

### **Architecture de Kubernetes**

- **Control Plane** : Responsable de la gestion du cluster et de l’état des applications. Il comprend plusieurs composants :
  - **kube-apiserver** : Serveur API pour la communication avec le cluster.
  - **etcd** : Stockage clé-valeur pour les données du cluster.
  - **kube-scheduler** : Attribue les pods aux nœuds disponibles.
  - **kube-controller-manager** : Exécute les contrôleurs pour gérer l'état du cluster.
  - **cloud-controller-manager** : Gère les interactions avec les services de cloud.

- **Node Components** : Chaque nœud exécute plusieurs composants :
  - **kubelet** : Agent qui assure que les conteneurs sont en cours d’exécution dans un pod.
  - **kube-proxy** : Gère le réseau et les services sur chaque nœud.
  - **container runtime** : Exécute les conteneurs (par exemple, Docker, containerd).

### **Commandes Kubernetes de Base**

- `kubectl get pods` : Liste tous les pods.
- `kubectl describe pod <pod-name>` : Affiche les détails d'un pod.
- `kubectl create -f <file.yaml>` : Crée des ressources à partir d'un fichier YAML.
- `kubectl apply -f <file.yaml>` : Applique des modifications à des ressources existantes.
- `kubectl delete -f <file.yaml>` : Supprime des ressources spécifiées dans un fichier YAML.

### **Scénarios d'Utilisation**

1. **Déploiement d’une application web** : Utilisez un `Deployment` pour déployer des pods avec votre application, un `Service` pour exposer l’application à l’extérieur et un `Ingress` pour gérer le routage des requêtes HTTP.

2. **Mise à l’échelle** : Modifiez le nombre de réplicas dans un `Deployment` pour ajuster la charge sur votre application en fonction des besoins.

3. **Mise à jour continue** : Utilisez les mises à jour automatiques de Kubernetes pour déployer des versions nouvelles de votre application sans interruption de service.

Ce résumé couvre les aspects fondamentaux de Kubernetes. En fonction du poste pour lequel vous vous préparez, il pourrait être utile d'approfondir certains aspects spécifiques ou d'acquérir une expérience pratique avec des cas d'utilisation réels. Bonne chance pour votre entretien !


## **Exemple : Déployer une application web avec Kubernetes**

### **1. Préparez votre fichier de configuration YAML**

Créez un fichier nommé `deployment.yaml` avec le contenu suivant :

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-web-app
  template:
    metadata:
      labels:
        app: my-web-app
    spec:
      containers:
      - name: my-web-app-container
        image: nginx:latest
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-web-app-service
spec:
  selector:
    app: my-web-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
```

### **2. Déployez l'application**

Utilisez `kubectl` pour déployer votre application sur le cluster Kubernetes :

```bash
kubectl apply -f deployment.yaml
```

### **3. Vérifiez le déploiement**

Assurez-vous que les pods sont en cours d'exécution :

```bash
kubectl get pods
```

Vérifiez également que le service est créé et qu'il obtient une adresse IP externe (si vous utilisez un service de type `LoadBalancer`) :

```bash
kubectl get services
```

### **4. Accédez à l'application**

Si le service utilise le type `LoadBalancer`, vous obtiendrez une adresse IP externe. Accédez à cette adresse IP dans votre navigateur pour voir l'application web.

Si vous utilisez un autre type de service (comme `ClusterIP`), vous devrez peut-être exposer le service via un outil comme `kubectl port-forward` pour accéder à l'application localement :

```bash
kubectl port-forward service/my-web-app-service 8080:80
```

Vous pouvez maintenant accéder à l'application web en ouvrant `http://localhost:8080` dans votre navigateur.

### **Résumé des fichiers YAML**

- **Deployment** : Définit la configuration des pods et le nombre de réplicas.
- **Service** : Expose l'application web au réseau interne du cluster et, dans ce cas, à l'extérieur via un LoadBalancer.

Cet exemple montre comment déployer une application web simple sur Kubernetes. Vous pouvez adapter les fichiers YAML pour déployer des applications plus complexes en fonction de vos besoins.

## 2. Questions

Voici une liste de 50 questions-réponses sur Kubernetes, organisées par groupes :

### **1. Concepts de Base**

1. **Q : Qu'est-ce qu'un cluster Kubernetes ?**
   - **R :** Un cluster Kubernetes est un ensemble de machines (nœuds) sur lesquelles les applications conteneurisées sont déployées. Il se compose d’un nœud maître et de nœuds de travail.

2. **Q : Que fait un pod dans Kubernetes ?**
   - **R :** Un pod est l'unité de base de déploiement dans Kubernetes. Il peut contenir un ou plusieurs conteneurs qui partagent le même réseau et le même stockage.

3. **Q : Quelle est la différence entre un Deployment et un ReplicaSet ?**
   - **R :** Un `Deployment` gère le déploiement et la mise à jour des pods, tandis qu’un `ReplicaSet` assure qu’un nombre spécifié de réplicas de pods est en cours d’exécution.

4. **Q : Qu'est-ce qu'un Service dans Kubernetes ?**
   - **R :** Un Service est une abstraction qui définit une politique d'accès aux pods. Il permet la communication entre les pods et les services externes.

5. **Q : À quoi sert un Namespace ?**
   - **R :** Un Namespace permet de diviser un cluster en plusieurs environnements logiques pour une meilleure gestion et isolation des ressources.

### **2. Composants du Cluster**

6. **Q : Que fait le kube-apiserver ?**
   - **R :** Le `kube-apiserver` expose l'API de Kubernetes et gère les communications entre les différents composants du cluster.

7. **Q : Qu'est-ce que etcd ?**
   - **R :** `etcd` est un magasin clé-valeur distribué utilisé pour stocker les données de configuration et l'état du cluster Kubernetes.

8. **Q : Quelle est la fonction du kube-scheduler ?**
   - **R :** Le `kube-scheduler` attribue les pods aux nœuds disponibles en fonction des ressources et des contraintes.

9. **Q : À quoi sert le kube-controller-manager ?**
   - **R :** Le `kube-controller-manager` exécute les contrôleurs qui maintiennent l’état souhaité du cluster (par exemple, la gestion des ReplicaSets).

10. **Q : Qu'est-ce que le kubelet ?**
    - **R :** Le `kubelet` est un agent qui fonctionne sur chaque nœud et assure que les conteneurs sont en cours d’exécution dans un pod.

### **3. Gestion des Applications**

11. **Q : Comment déployer une application dans Kubernetes ?**
    - **R :** Vous pouvez déployer une application en créant un fichier YAML de type `Deployment` et en l’appliquant avec `kubectl apply -f <file.yaml>`.

12. **Q : Quelle commande vérifie l’état des pods ?**
    - **R :** `kubectl get pods` affiche la liste des pods et leur état.

13. **Q : Comment exposer une application au réseau externe ?**
    - **R :** Utilisez un `Service` de type `LoadBalancer` ou `NodePort` pour exposer l’application.

14. **Q : Comment mettre à l’échelle une application ?**
    - **R :** Modifiez le nombre de réplicas dans le fichier YAML du `Deployment` et appliquez les modifications avec `kubectl apply -f <file.yaml>`.

15. **Q : Qu'est-ce qu’un ConfigMap ?**
    - **R :** Un `ConfigMap` est utilisé pour stocker des données de configuration non sensibles qui peuvent être injectées dans les pods.

### **4. Stockage et Volumes**

16. **Q : Quelle est la différence entre un Volume et un PersistentVolume ?**
    - **R :** Un `Volume` est un stockage temporaire qui dure le temps de vie du pod, tandis qu’un `PersistentVolume` (PV) est un stockage persistant qui peut survivre au redémarrage des pods.

17. **Q : Comment créer un PersistentVolumeClaim (PVC) ?**
    - **R :** Créez un fichier YAML de type `PersistentVolumeClaim` et appliquez-le avec `kubectl apply -f <file.yaml>`.

18. **Q : Qu'est-ce qu'un StatefulSet ?**
    - **R :** Un `StatefulSet` est utilisé pour déployer des applications avec état, nécessitant des identifiants persistants et un stockage stable.

19. **Q : Quel est le rôle d’un Volume dans un pod ?**
    - **R :** Un `Volume` fournit un stockage persistant pour les conteneurs dans un pod et permet le partage de données entre les conteneurs.

20. **Q : Comment les secrets sont-ils stockés dans Kubernetes ?**
    - **R :** Les `Secrets` sont stockés en base64 encodé pour la sécurité des données sensibles et peuvent être montés en tant que volumes ou injectés comme variables d'environnement.

### **5. Réseautage et Ingress**

21. **Q : À quoi sert un Ingress ?**
    - **R :** Un `Ingress` gère l’accès externe aux services dans un cluster, en offrant des fonctionnalités de routage HTTP et HTTPS.

22. **Q : Quelle commande permet de décrire un service ?**
    - **R :** `kubectl describe service <service-name>` fournit des détails sur le service.

23. **Q : Comment vérifier les événements du cluster ?**
    - **R :** Utilisez `kubectl get events` pour voir les événements récents du cluster.

24. **Q : Quelle commande permet de créer un Ingress ?**
    - **R :** Vous créez un Ingress en définissant un fichier YAML et en l’appliquant avec `kubectl apply -f <file.yaml>`.

25. **Q : Quelle est la différence entre un LoadBalancer et un NodePort ?**
    - **R :** Un `LoadBalancer` expose un service via une IP externe attribuée par le cloud provider, tandis qu’un `NodePort` expose le service sur un port spécifique de chaque nœud du cluster.

### **6. Sécurité et Authentification**

26. **Q : Comment gérer les rôles et les permissions dans Kubernetes ?**
    - **R :** Utilisez des objets `Role`, `ClusterRole`, `RoleBinding`, et `ClusterRoleBinding` pour gérer les permissions et l'accès aux ressources.

27. **Q : Qu'est-ce qu'un RoleBinding ?**
    - **R :** Un `RoleBinding` associe un rôle (permissions) à un utilisateur ou un groupe d'utilisateurs au sein d’un namespace.

28. **Q : Quelle est la fonction des Network Policies ?**
    - **R :** Les `Network Policies` contrôlent le trafic réseau entre les pods et peuvent restreindre la communication à certains pods ou services.

29. **Q : Comment créer un secret dans Kubernetes ?**
    - **R :** Créez un secret en utilisant `kubectl create secret` ou en définissant un fichier YAML de type `Secret`.

30. **Q : Quelle commande permet de voir les logs d’un pod ?**
    - **R :** `kubectl logs <pod-name>` affiche les logs du conteneur dans un pod.

### **7. Gestion des Déploiements**

31. **Q : Comment mettre à jour une application avec Kubernetes ?**
    - **R :** Modifiez le fichier YAML du `Deployment` pour refléter les nouvelles configurations ou images, puis appliquez les modifications avec `kubectl apply -f <file.yaml>`.

32. **Q : Comment annuler une mise à jour d’un Deployment ?**
    - **R :** Utilisez `kubectl rollout undo deployment/<deployment-name>` pour revenir à la version précédente du déploiement.

33. **Q : Quelle commande permet de voir l’historique des révisions d’un Deployment ?**
    - **R :** `kubectl rollout history deployment/<deployment-name>` affiche l'historique des révisions.

34. **Q : Qu'est-ce qu'un Job ?**
    - **R :** Un `Job` exécute une tâche unique et garantit que cette tâche est complétée avec succès avant de terminer.

35. **Q : Comment vérifier l’état d’un Job ?**
    - **R :** Utilisez `kubectl get jobs` pour voir les jobs et leur statut.

### **8. Debugging et Monitoring**

36. **Q : Comment exécuter une commande dans un conteneur d’un pod ?**
    - **R :** Utilisez `kubectl exec -it <pod-name> -- <command>` pour exécuter une commande dans un conteneur.

37. **Q : Quelle commande permet de déployer un pod en mode interactif pour le debugging ?**
    - **R :** `kubectl run -it --rm debug --image=busybox -- /bin/sh` crée un pod temporaire pour le débogage.

38. **Q : Comment visualiser l’utilisation des ressources d’un pod ?**
    - **R :** `kubectl top pod <pod-name>` montre l’utilisation des ressources comme la mémoire et le CPU.

39. **Q : Comment obtenir des informations sur les événements du cluster ?**
    - **R :** Utilisez `kubectl get events` pour afficher les événements récents.

40. **Q : Quelle commande permet de décrire un pod ?**
    - **R :** `kubectl describe pod <pod-name>` fournit

 des détails sur le pod et ses conteneurs.

### **9. Avancé et Concepts Complémentaires**

41. **Q : Qu'est-ce qu'un DaemonSet ?**
    - **R :** Un `DaemonSet` assure qu’un pod est exécuté sur chaque nœud du cluster.

42. **Q : Quelle est la différence entre un StatefulSet et un Deployment ?**
    - **R :** Un `StatefulSet` est utilisé pour des applications avec état nécessitant un identifiant stable et un stockage persistant, tandis qu’un `Deployment` est utilisé pour des applications stateless.

43. **Q : Comment ajouter des labels à un pod ?**
    - **R :** Ajoutez des labels dans le fichier YAML du pod sous `metadata.labels` ou utilisez `kubectl label pod <pod-name> <key>=<value>`.

44. **Q : Qu'est-ce qu’un Horizontal Pod Autoscaler ?**
    - **R :** Un `Horizontal Pod Autoscaler` ajuste automatiquement le nombre de réplicas d’un pod en fonction de l’utilisation des ressources.

45. **Q : Quelle commande permet de créer un ClusterRole ?**
    - **R :** Créez un `ClusterRole` en définissant un fichier YAML et en l’appliquant avec `kubectl apply -f <file.yaml>`.

### **10. Intégrations et Extensions**

46. **Q : Comment intégrer Kubernetes avec un système de CI/CD ?**
    - **R :** Utilisez des outils comme Jenkins, GitLab CI/CD, ou ArgoCD pour automatiser les déploiements et la gestion des applications dans Kubernetes.

47. **Q : Quels outils peuvent être utilisés pour surveiller un cluster Kubernetes ?**
    - **R :** Des outils comme Prometheus, Grafana, et ELK Stack (Elasticsearch, Logstash, Kibana) sont couramment utilisés pour surveiller et visualiser les métriques du cluster.

48. **Q : Qu'est-ce qu'un Custom Resource Definition (CRD) ?**
    - **R :** Un `Custom Resource Definition` permet de créer des ressources personnalisées dans Kubernetes, étendant ainsi les capacités de l'API de Kubernetes.

49. **Q : Comment configurer le RBAC (Role-Based Access Control) dans Kubernetes ?**
    - **R :** Configurez le RBAC en créant des objets `Role`, `ClusterRole`, `RoleBinding`, et `ClusterRoleBinding` pour contrôler les permissions des utilisateurs et des services.

50. **Q : Comment gérer les mises à jour continues (Continuous Deployment) avec Kubernetes ?**
    - **R :** Utilisez des outils de CD comme ArgoCD, Flux, ou des pipelines CI/CD pour automatiser les déploiements et les mises à jour d’applications dans Kubernetes.

