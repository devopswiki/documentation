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


## Some references:

Certified Kubernetes Administrator: https://www.cncf.io/certification/cka/

Exam Curriculum (Topics): https://github.com/cncf/curriculum

Candidate Handbook: https://www.cncf.io/certification/candidate-handbook

Exam Tips: http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD


Head over to this link to enroll in the Certification Exam. Remember to keep the code - 20KODE - handy to get a 20% discount while registering for the CKA exam with Linux Foundation. (https://www.dpbolvw.net/click-100910441-15404327?sid=udemy-courses)


We have created a repository with notes, links to documentation and answers to practice questions here. Please make sure to go through these as you progress through the course: https://github.com/kodekloudhub/certified-kubernetes-administrator-course

https://www.garvanese.com/2023/12/kubernetes-cka-et-ckad-mon-retour-dexperience-sur-ces-certifications.html


