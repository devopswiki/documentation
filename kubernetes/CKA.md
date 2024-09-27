## Table of contents

- [Table of contents](#table-of-contents)
- [1. Cluster Architecture](#1-cluster-architecture)
  - [**1. Worker Nodes (Cargo Ships):**](#1-worker-nodes-cargo-ships)
  - [**2. Master Node (Control Ships):**](#2-master-node-control-ships)
- [2. Docker and Containerd](#2-docker-and-containerd)
- [3. ETCD](#3-etcd)
- [3.1 **Etcd for Beginners - Quick Introduction**](#31-etcd-for-beginners---quick-introduction)
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
## 3.1 **Etcd for Beginners - Quick Introduction**

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

---

## Some references:

Certified Kubernetes Administrator: https://www.cncf.io/certification/cka/

Exam Curriculum (Topics): https://github.com/cncf/curriculum

Candidate Handbook: https://www.cncf.io/certification/candidate-handbook

Exam Tips: http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD


Head over to this link to enroll in the Certification Exam. Remember to keep the code - 20KODE - handy to get a 20% discount while registering for the CKA exam with Linux Foundation. (https://www.dpbolvw.net/click-100910441-15404327?sid=udemy-courses)


We have created a repository with notes, links to documentation and answers to practice questions here. Please make sure to go through these as you progress through the course: https://github.com/kodekloudhub/certified-kubernetes-administrator-course

https://www.garvanese.com/2023/12/kubernetes-cka-et-ckad-mon-retour-dexperience-sur-ces-certifications.html


