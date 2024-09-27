# Installation de développement
Pour installer un cluster de développement :
  - solution officielle : Minikube, tourne dans Docker par défaut (ou dans des VMs)
  - alternative qui possède de nombreux addons : microk8s
  - avec Docker Desktop depuis peu (dans une VM aussi)
  - un cluster léger avec k3s, de Rancher

Installer un cluster de production on premise : l’outil officiel kubeadm

Installer un cluster de production Kubernetes à la main est nettement plus complexe que mettre en place un cluster Docker Swarm.
  - Installer le dæmon Kubelet sur tous les noeuds
  - Installer l’outil de gestion de cluster kubeadm sur un noeud master
  - Générer les bons certificats avec kubeadm
  - Installer un réseau CNI k8s comme flannel (d’autres sont possible et le choix vous revient)
  - Déployer la base de données etcd avec kubeadm
  - Connecter les nœuds worker au master.

L’installation est décrite dans la documentation officielle
Installer un cluster complètement à la main
On peut également installer Kubernetes de façon encore plus manuelle soit pour déployer une configuration vraiment spécifique ou simplement pour mieux comprendre ses rouages et composants.
Ce type d’installation est décrite par exemple ici : Kubernetes the hard way.
Commander un cluster en tant que service (managed cluster) dans le cloud

Tous les principaux provider de cloud fournissent depuis plus ou moins longtemps des solutions de cluster gérées par eux :
   - Google Cloud Plateform avec Google Kubernetes Engine (GKE) : très populaire car très flexible et l’implémentation de référence de Kubernetes.
   - AWS avec EKS : Kubernetes assez standard mais à la sauce Amazon pour la gestion de l’accès, des loadbalancers ou du scaling.
   - DigitalOcean ou Scaleway : un peu moins de fonctions mais plus simple à appréhender


Kubespray
https://kubespray.io/#/

En réalité utiliser kubeadm directement en ligne de commande n’est pas la meilleure approche car cela ne respecte pas l’infrastructure as code et rend plus périlleux la maintenance/maj du cluster par la suite.

Le projet kubespray est un installer de cluster kubernetes utilisant Ansible et kubeadm. C’est probablement l’une des méthodes les plus populaires pour véritablement gérer un cluster de production on premise.

Mais la encore il s’agit de ne pas sous-estimer la complexité de la maintenance (comme avec kubeadm).

## Installer Minikube

Minikube est la version de développement de Kubernetes (en local) la plus répendue. Elle est maintenue par la cloud native foundation et très proche de kubernetes upstream. Elle permet de simuler un ou plusieurs noeuds de cluster sous forme de conteneurs docker ou de machines virtuelles.
    - Pour installer minikube la méthode recommandée est indiquée ici:  https://minikube.sigs.k8s.io/docs/start/
Nous utiliserons classiquement docker comme runtime pour minikube (les noeuds k8s seront des conteneurs simulant des serveurs). Ceci est, bien sur, une configuration de développement. Elle se comporte cependant de façon très proche d’un véritable cluster.
 - Si Docker n’est pas installé, installer Docker avec la commande en une seule ligne : curl -fsSL https://get.docker.com | sh, puis ajoutez-vous au groupe Docker avec sudo usermod -a -G docker <votrenom>, et faites sudo reboot pour que cela prenne effet.
 - Pour lancer le cluster faites simplement: minikube start (il est également possible de préciser le nombre de coeurs de calcul, la mémoire et et d’autre paramètre pour adapter le cluster à nos besoins.)
Minikube configure automatiquement kubectl (dans le fichier ~/.kube/config) pour qu’on puisse se connecter au cluster de développement.
 - Testez la connexion avec kubectl get nodes.
Affichez à nouveau la version kubectl version. Cette fois-ci la version de kubernetes qui tourne sur le cluster actif est également affichée. Idéalement le client et le cluster devrait être dans la même version mineure par exemple 1.20.x.
Bash completion
Pour permettre à kubectl de compléter le nom des commandes et ressources avec <Tab> il est utile d’installer l’autocomplétion pour Bash :

```bash
sudo apt install bash-completion
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ${HOME}/.bashrc
```

Vous pouvez désormais appuyer sur <Tab> pour compléter vos commandes kubectl, c’est très utile !


## Installer Lens

Lens est une interface graphique sympatique pour Kubernetes.
Elle se connecte en utilisant la configuration ~/.kube/config par défaut et nous permettra d’accéder à un dashboard bien plus agréable à utiliser.
Vous pouvez l’installer en lançant ces commandes :
```bash
sudo apt-get update; sudo apt-get install -y libxss-dev
curl -fSL https://github.com/lensapp/lens/releases/download/v4.0.6/Lens-4.0.6.AppImage -o ~/Lens.AppImage
chmod +x ~/Lens.AppImage
~/Lens.AppImage &
```



