## Table of contents

- [Table of contents](#table-of-contents)
- [1. Cluster Architecture](#1-cluster-architecture)
  - [**1. Worker Nodes (Cargo Ships):**](#1-worker-nodes-cargo-ships)
  - [**2. Master Node (Control Ships):**](#2-master-node-control-ships)
- [2. Docker and Containerd](#2-docker-and-containerd)
- [3. ETCD](#3-etcd)
  - [Key Concepts](#key-concepts)
  - [Using etcd](#using-etcd)
  - [Why Use etcd?](#why-use-etcd)
- [4. kube-apiserver](#4-kube-apiserver)
  - [Resume: The **kube-apiserver** in Kubernetes](#resume-the-kube-apiserver-in-kubernetes)
  - [Setup and Configuration:](#setup-and-configuration)
- [5. Kube Controller Manager](#5-kube-controller-manager)
  - [Résumé: **Kube Controller Manager** in Kubernetes](#résumé-kube-controller-manager-in-kubernetes)
    - [Key Functions of Controllers:](#key-functions-of-controllers)
    - [**Kube Controller Manager** Overview:](#kube-controller-manager-overview)
    - [Configuration:](#configuration)
    - [Viewing and Managing:](#viewing-and-managing)
  - [6. **Kube-Scheduler**](#6-kube-scheduler)
  - [Résumé: **Kube-Scheduler** in Kubernetes](#résumé-kube-scheduler-in-kubernetes)
    - [Key Functions:](#key-functions)
    - [Decision Factors:](#decision-factors)
    - [Installation and Configuration:](#installation-and-configuration)
    - [Customization:](#customization)
- [7. **Kubelet** in Kubernetes](#7-kubelet-in-kubernetes)
    - [Key Functions:](#key-functions-1)
    - [Installation and Configuration:](#installation-and-configuration-1)
    - [Advanced Topics:](#advanced-topics)
- [8. **Kube-Proxy** in Kubernetes](#8-kube-proxy-in-kubernetes)
    - [Key Functions:](#key-functions-2)
    - [How Kube-Proxy Works:](#how-kube-proxy-works)
    - [Installation:](#installation)
- [9. Kubernetes Pods](#9-kubernetes-pods)
    - [Key Concepts of Pods:](#key-concepts-of-pods)
    - [Containers \& Pods in a Non-Kubernetes Environment:](#containers--pods-in-a-non-kubernetes-environment)
    - [Basic Pod Operations:](#basic-pod-operations)
  - [Kubernetes Pods with YAML:](#kubernetes-pods-with-yaml)
    - [Key Components of a Kubernetes YAML File:](#key-components-of-a-kubernetes-yaml-file)
    - [Example YAML File to Create a Pod:](#example-yaml-file-to-create-a-pod)
    - [Creating the Pod:](#creating-the-pod)
    - [Verifying the Pod:](#verifying-the-pod)
  - [Summary:](#summary)
- [10. Kubernetes Controllers: Replication Controller \& Replica Set](#10-kubernetes-controllers-replication-controller--replica-set)
    - [1. **Replication Controller**](#1-replication-controller)
    - [2. **Replica Set**](#2-replica-set)
  - [YAML Structure for Replication Controller \& Replica Set](#yaml-structure-for-replication-controller--replica-set)
    - [Replication Controller YAML Example:](#replication-controller-yaml-example)
    - [Replica Set YAML Example:](#replica-set-yaml-example)
    - [Differences:](#differences)
  - [Commands](#commands)
  - [Key Concepts:](#key-concepts-1)
- [10. Deployment](#10-deployment)
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
  - [Summary:](#summary-1)
- [11. **Services**](#11-services)
  - [**Kubernetes Services Overview**](#kubernetes-services-overview)
  - [**Networking in Kubernetes**](#networking-in-kubernetes)
  - [**Types of Kubernetes Services**](#types-of-kubernetes-services)
  - [**NodePort Service in Detail**](#nodeport-service-in-detail)
  - [**Creating a NodePort Service**](#creating-a-nodeport-service)
  - [**Connecting Services to Pods**](#connecting-services-to-pods)
  - [**Load Balancing and High Availability**](#load-balancing-and-high-availability)
  - [**Service Flexibility and Adaptation**](#service-flexibility-and-adaptation)
- [12 **ClusterIP Services**](#12-clusterip-services)
  - [Key Concepts:](#key-concepts-2)
  - [Creating a ClusterIP Service:](#creating-a-clusterip-service)
  - [Conclusion:](#conclusion)
- [13 **LoadBalancer Services**](#13-loadbalancer-services)
  - [Key Concepts:](#key-concepts-3)
  - [Using LoadBalancer in Kubernetes:](#using-loadbalancer-in-kubernetes)
  - [Conclusion:](#conclusion-1)
- [13 **NameSpaces**](#13-namespaces)
  - [Key Concepts](#key-concepts-4)
  - [Operational Aspects](#operational-aspects)
  - [Conclusion](#conclusion-2)
- [Some references:](#some-references)


## 1. Cluster Architecture

**Hello and welcome to this lecture.**

We start with a basic overview of the **Kubernetes cluster architecture**.

At a high level, Kubernetes manages applications through containers in an automated manner, ensuring communication between services and scaling as required.

Let’s use an analogy of ships to understand the architecture.

### **1. Worker Nodes (Cargo Ships):**
Worker nodes host applications as containers. These nodes are like cargo ships, which do the actual work of carrying containers. Containers are loaded, managed, and executed here. Each worker node has:

- **Kubelet (The Captain)**: The kubelet is the node's agent, responsible for receiving instructions from the control plane (master node) and ensuring that containers are running correctly.
- **Container Runtime (Docker/ContainerD)**: This engine runs the containers.
- **Kube Proxy (Communication Manager)**: Manages network communication between containers across nodes, ensuring they can talk to each other.

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

## 2. Docker and Containerd

**Docker**:
- Docker is a containerization platform that simplifies working with containers, providing a user-friendly experience through tools like the Docker CLI and API.
- It became the most popular container tool and was initially tightly integrated with Kubernetes.
- Docker is more than just a runtime; it includes several components, such as a container runtime (runC) and a management daemon (Containerd).
- Due to Kubernetes' shift to the Container Runtime Interface (CRI), Docker's direct support in Kubernetes was deprecated and removed in Kubernetes version 1.24.

**Containerd**:
- Containerd is the core container runtime used by Docker but can also function independently.
- It adheres to the Open Container Initiative (OCI) standards and is CRI-compatible, allowing it to work directly with Kubernetes without Docker.
- It offers a more lightweight solution focused purely on container runtime, without Docker’s additional features.
- Tools like `ctr` (for debugging) and `nerdctl` (a Docker-like CLI) are used with Containerd to manage containers.

Overall, Docker includes several tools, while Containerd is a more focused runtime for containers, now used directly with Kubernetes as the standard runtime.

## 3. ETCD

**What is etcd?**

Etcd is a distributed, reliable, and fast **key-value store**. It is widely used in systems like Kubernetes to store critical configuration data, ensuring the system remains consistent even in distributed setups. Let’s break it down:

1. **Key-Value Store**: Unlike traditional relational databases (e.g., SQL), which store data in tables with rows and columns, a key-value store manages data as pairs (a key and its associated value). This is useful for storing configuration data where you just need to look up values quickly based on a unique key.

2. **Distributed System**: Etcd can run in a cluster with multiple nodes to ensure high availability and fault tolerance. This means if one node fails, others can still serve data.

3. **Reliability**: Etcd uses the **RAFT consensus algorithm** to make sure that all nodes in a cluster agree on the current state, ensuring consistent data even if nodes fail or are added.

### Key Concepts

- **Keys and Values**: You store data using a unique key and retrieve it using the same key. For example:
  - Store: `etcdctl put key1 "value1"`
  - Retrieve: `etcdctl get key1`

- **Versioning**: Etcd has seen significant changes between versions:
  - **v2.x**: Earlier version, widely used but slower and less efficient than v3.
  - **v3.x**: Improved performance and API. Most modern systems, including Kubernetes, use Etcd v3.

### Using etcd

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

### Why Use etcd?

- **Consistency**: Etcd ensures that data is consistent across distributed systems.
- **Kubernetes**: It plays a critical role as Kubernetes uses etcd to store all cluster data, making it essential for cluster state management.

**Next Steps**:
In future lessons, you'll explore how to set up etcd in a high-availability environment, the RAFT consensus algorithm, and how it integrates with Kubernetes for managing cluster state.


## 4. kube-apiserver

### Resume: The **kube-apiserver** in Kubernetes

Hello, and welcome to this lecture. In this lecture, we will discuss the **kube-apiserver**, the core management component in Kubernetes.

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

In summary:
- The **kube-apiserver** is central to all actions in the cluster, handling **authentication, validation**, and **interaction with etcd**.
- Other components, such as the **scheduler**, **kube-controller-manager**, and **kubelet**, communicate with the cluster via the **kube-apiserver**.

### Setup and Configuration:
If you used **kubeadm** to bootstrap your cluster, the **kube-apiserver** runs as a pod in the **kube-system** namespace. The configuration is located in `/etc/kubernetes/manifests/kube-apiserver.yaml`. In non-kubeadm setups, you can find its configuration in `/etc/systemd/system/kube-apiserver.service`.

The **kube-apiserver** is run with many options, including **certificates** for secure communication between components and the **etcd servers**' location. You can inspect these options by viewing the respective configuration files or listing the processes on the master node.

## 5. Kube Controller Manager 
### Résumé: **Kube Controller Manager** in Kubernetes

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


### 6. **Kube-Scheduler**
### Résumé: **Kube-Scheduler** in Kubernetes

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


## 7. **Kubelet** in Kubernetes

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


## 8. **Kube-Proxy** in Kubernetes

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

## 9. Kubernetes Pods

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


### Kubernetes Pods with YAML:

In Kubernetes, YAML files are used to define objects such as pods, deployments, services, etc. These files follow a specific structure, and creating a pod using a YAML configuration file is an essential task for Kubernetes management. Below is a summary of how to create and manage pods using YAML.

#### Key Components of a Kubernetes YAML File:
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

#### Example YAML File to Create a Pod:
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

#### Creating the Pod:
Once the YAML file is ready, use the following command to create the pod:
```bash
kubectl create -f pod-definition.yaml
```

#### Verifying the Pod:
- **List Pods**: To view the list of running pods:
  ```bash
  kubectl get pods
  ```
- **Describe Pod**: To get detailed information about the pod, including its labels, events, and container information:
  ```bash
  kubectl describe pod my-app-pod
  ```

### Summary:
1. A Kubernetes YAML file has four top-level properties: `apiVersion`, `kind`, `metadata`, and `spec`.
2. In the `spec` section, you define container details, such as its name and Docker image.
3. Use `kubectl create -f <filename>` to create the pod and `kubectl get pods` to verify its status.

This method is a simple and efficient way to manage Kubernetes objects like pods through YAML.


## 10. Kubernetes Controllers: Replication Controller & Replica Set

**Kubernetes Controllers** are the brain behind Kubernetes, responsible for managing the desired state of objects. In this lecture, we focus on two important controllers: **Replication Controller** and **Replica Set**.

#### 1. **Replication Controller**
- Ensures a specified number of pod replicas are running at all times, even if it’s just one pod.
- Useful for **high availability** and **load balancing**. If one pod crashes, it ensures another one is created automatically.
- Allows you to run **multiple instances** of the same pod to handle increased load across multiple nodes.

#### 2. **Replica Set**
- **Replica Set** is a newer version of the Replication Controller and is preferred over the older Replication Controller.
- Ensures a fixed number of pod replicas are running at all times and can manage **pre-existing pods** by selecting them through **label selectors**.

### YAML Structure for Replication Controller & Replica Set

Both controllers follow a similar structure in the YAML configuration file, but there are key differences.

#### Replication Controller YAML Example:
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

#### Replica Set YAML Example:
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

#### Differences:
- **API Version**: 
  - Replication Controller uses `v1`, while Replica Set uses `apps/v1`.
- **Selector**: 
  - Replica Set requires a **selector** to define which pods it should manage. Replication Controller does not require this explicitly.
- **Use Case**: 
  - Replica Set can manage both **newly created pods** and **pre-existing pods** based on matching labels.

### Commands

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

### Key Concepts:
- **Replication Controller**: Ensures a set number of pods are always running.
- **Replica Set**: More flexible, includes selectors to match existing pods.
- **Labels & Selectors**: Crucial for identifying and managing pods, especially in Replica Sets.


## 10. Deployment

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

### Key `kubectl` Commands for Creating Pods, Deployments, and YAML Files:

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

### Benefits of Using `kubectl` Commands Instead of YAML:
- **Speed and Efficiency**: Directly creating objects like Pods or Deployments with a single command is faster than writing the YAML from scratch.
- **Customizability**: The `--dry-run=client -o yaml` allows you to generate a YAML template, which you can tweak as needed.
- **CLI-based**: Avoid issues with copying and pasting YAML files in the CLI, which can save time and reduce errors during exams or hands-on tasks.

By practicing these commands regularly, you’ll be well-prepared to handle exam scenarios efficiently!  

### Summary:
Deployments simplify managing application updates, scaling, and rollbacks. They automatically create ReplicaSets, which in turn manage the pods. This abstraction provides robust features for maintaining a stable production environment. In the next lectures, we will explore these features in depth, including how to apply rolling updates and rollbacks.

## 11. **Services**

This lecture provides a comprehensive overview of **Kubernetes Services** and their role in enabling communication between various components of an application, both internally and externally. Here's a summary of the key concepts covered:

### **Kubernetes Services Overview**
- **Purpose**: Services enable communication between groups of Pods (e.g., frontend, backend) or between external users and Pods. They provide a way to expose applications running in Pods to the outside world or other services within the cluster.
- **Use Cases**: Services allow for loose coupling between microservices in an application by facilitating connectivity.

### **Networking in Kubernetes**
- **Pod Network**: Pods typically reside in an internal network (e.g., 10.244.0.0/16). External users can't directly access Pods since they are on a separate network.
- **Node Access**: By SSH-ing into the node, you can access the Pod’s IP (this is from inside the Kubernetes node), but to expose the application externally (without having to SSH into the node), you need a service.

### **Types of Kubernetes Services**
1. **NodePort**:
   - Exposes the application on a specific port of each node in the cluster (port range 30,000-32,767).
   - Allows external users to access applications via the node’s IP and the NodePort.
   
2. **ClusterIP**:
   - Creates a virtual IP address within the cluster, enabling communication between different services (e.g., frontend to backend).
   
3. **LoadBalancer**:
   - Provisions a load balancer, especially useful for distributing traffic in cloud environments.

### **NodePort Service in Detail**
- **Ports Involved**:
  1. **TargetPort**: The port on the Pod where the actual service (e.g., web server) is running (e.g., port 80).
  2. **Port**: The port on the Service object.
  3. **NodePort**: The port exposed on the node itself, accessible externally.
  
- **Example**: A service could map port 30,008 on the node to port 80 on the Pod, allowing external users to access the application by visiting `http://<NodeIP>:30008`.

### **Creating a NodePort Service**
- **Definition File**:
  - The file structure is similar to other Kubernetes objects (e.g., Pods, Deployments) with API version, kind, metadata, and spec sections.
  - The **type** in the spec section is set to `NodePort`.
  - **Ports**: Define `targetPort`, `port`, and `nodePort`. The `nodePort` can be specified or automatically assigned.
  - **Selector**: Labels are used to link the service to the correct Pods.

### **Connecting Services to Pods**
- Labels and selectors are used to match Pods with services. The service forwards traffic to any Pod with the matching label.

### **Load Balancing and High Availability**
- If multiple Pods exist with the same labels, the service will load-balance traffic across them using a random algorithm.
- If Pods are spread across multiple nodes, the service will automatically expose the application on the same `NodePort` on all nodes.

### **Service Flexibility and Adaptation**
- Kubernetes services automatically update as Pods are added or removed, making them highly flexible and adaptive without additional configuration.

In conclusion, **Kubernetes Services** are essential for enabling connectivity within a cluster, and between a cluster and the outside world. They provide load balancing, internal communication, and the ability to expose applications externally. The creation and management of services is straightforward, and Kubernetes handles much of the complexity under the hood, particularly in dynamic environments where Pods are constantly changing.


## 12 **ClusterIP Services**

This lecture explains how **Kubernetes ClusterIP Services** are used to enable communication between different components of a full-stack application hosted in a Kubernetes cluster.

### Key Concepts:

1. **Full-Stack Application in Kubernetes**:
   - Applications often have multiple layers like front-end servers, back-end servers, databases (e.g., MySQL), and caching systems (e.g., Redis). Each of these is typically hosted in separate Pods.
   
2. **Dynamic Pod IPs**:
   - Pods in Kubernetes have dynamic IP addresses, which change when Pods are recreated. This makes direct communication between Pods via their IPs unreliable.

3. **ClusterIP Service**:
   - A **ClusterIP Service** solves this issue by grouping Pods that perform the same function (e.g., multiple backend servers) under a single service IP, which remains static.
   - The service forwards traffic to one of the Pods in the group, effectively load-balancing the requests.
   - Other Pods can access this service using the service’s **ClusterIP** or the service name.

### Creating a ClusterIP Service:

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

### Conclusion:
The **ClusterIP** service provides a stable network endpoint within the cluster to enable communication between different parts of the application. It abstracts the complexities of dynamic Pod IPs and ensures smooth internal communication.

## 13 **LoadBalancer Services**

This lecture covers the **LoadBalancer** service type in Kubernetes, which is commonly used to expose applications to external users with a single URL. It provides an easy way to manage external traffic for applications running in cloud environments like AWS, Google Cloud, or Azure.

### Key Concepts:

1. **NodePort Services**:
   - The **NodePort** service exposes an application on a static port on all worker nodes in the Kubernetes cluster. Each node can then forward traffic from that port to the Pods running the service.
   - This works well for small setups, but users would need to know the specific node IP and port to access the application, which isn't user-friendly.

2. **External Load Balancer**:
   - Instead of providing individual node IP and port combinations to users, they typically want a single URL like `votingapp.com` or `resultapp.com`.
   - One solution is to set up an external load balancer manually (e.g., using **HAProxy** or **Nginx**), but this requires extra VMs, configuration, and ongoing maintenance.

3. **Cloud Provider Integration**:
   - When running Kubernetes on cloud platforms like **Google Cloud Platform (GCP)**, **AWS**, or **Azure**, Kubernetes can automatically provision the cloud provider’s native load balancer.
   - By setting the service type to **LoadBalancer**, Kubernetes integrates with the cloud platform’s load balancer service, automatically routing traffic to the correct Pods.
   
### Using LoadBalancer in Kubernetes:

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

### Conclusion:
The **LoadBalancer** service in Kubernetes simplifies exposing applications with a single URL to users by leveraging cloud provider integrations. It removes the need for manual load balancer setup, making the deployment process smoother in cloud environments.


## 13 **NameSpaces**

In this lecture, we explore **namespaces** in Kubernetes, which provide a way to organize and manage resources within a cluster. Here's a breakdown of the key concepts and operational aspects covered in the lecture:

### Key Concepts

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

### Operational Aspects

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

### Conclusion
Namespaces in Kubernetes provide an essential mechanism for resource isolation and management, especially as applications grow and require different environments (like development, testing, and production). They facilitate better organization and help prevent conflicts between resources while enabling easier resource management through quotas and policies.

**Next Steps**:
- Practice working with namespaces through coding exercises to solidify your understanding.
- In the next lecture, the topic of **contexts** will be discussed, which is important for managing multiple clusters and environments.








---




## Some references:

Certified Kubernetes Administrator: https://www.cncf.io/certification/cka/

Exam Curriculum (Topics): https://github.com/cncf/curriculum

Candidate Handbook: https://www.cncf.io/certification/candidate-handbook

Exam Tips: http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD


Head over to this link to enroll in the Certification Exam. Remember to keep the code - 20KODE - handy to get a 20% discount while registering for the CKA exam with Linux Foundation. (https://www.dpbolvw.net/click-100910441-15404327?sid=udemy-courses)


We have created a repository with notes, links to documentation and answers to practice questions here. Please make sure to go through these as you progress through the course: https://github.com/kodekloudhub/certified-kubernetes-administrator-course

https://www.garvanese.com/2023/12/kubernetes-cka-et-ckad-mon-retour-dexperience-sur-ces-certifications.html


