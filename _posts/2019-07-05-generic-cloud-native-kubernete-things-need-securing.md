---
layout: post
title: Kubernetes Basics
date: 2019-07-05
categories: ["Kubernetes", "Cloud Security", "Containerization", "Container Orchestration", "Scaling", "Deployment", "Security", "Cloud-Native", "DevOps"]
excerpt: Let’s take a look at the simplest part of the previously documented multi-tenancy architecture 
---
Following up from the previous post, let’s take a look at the simplest part of
the previously documented multi-tenancy architecture (MTA) that provides high
scores for availability, authenticity, confidentiality, portability, and
integrity - its’ orchestration, scaling, deployment, and container mgt.
tooling. "Kubernetes is a portable, extensible, open-source platform for
managing containerized workloads and services, that facilitates both
declarative configuration and automation. It has a large, rapidly growing
ecosystem….” <https://kubernetes.io/docs/concepts/overview/what-is-
kubernetes/> if you want to learn more. Let's start off with Kubernet's
building blocks. The typical architecture is akin to;

  

![](/images/kubes.png.avif)

![](/images/k8s.png.avif)

  

Which could run on assets like a Raspberry PI (ARM) cluster

![](/images/432.jpg)

or transform workloads into pods that evaporate in the cloud when terminated

  

![](/images/4321.png.avif)

  

![](/images/543.png.avif)

  
  
  
  
  

![](/images/123.png.avif)

  
  
The commonality to the above simple to diverse architectures leads one to see
common building blocks or layers of abstractions inherent to any Kubernete’s
based workload. The basic building blocks are as follows;

###  
Controller Manager

  * A single binary running as a single process emulating separate controller process that is responsible for observing and respond to node availability concerns, pod replication, endpoints, and handling service account and tokens.

  * Optionally may include a cloud controller manager to integrate deeper into a cloud providers’ infrastructure such as AWS security groups, application load balancers, API Gateways, S3 storage backends, etc…. Cloud controller features vary from each IaaS provider.

### APIServer

  * The public facing API service. This is how one interacts with Kubernete’s backend. One may operate multiple APIServers within a single cluster. Interactions involve simple curl commands to kube-ctl to 3rd party tools / services.

### Scheduler

  * This component is the algorithmic part that provides Kubernete’s magic. The service handles policy constraints, locality and affinity, deadlines, interference, resource requirements, and similar “what should happen when on what object?"

### ETCD

  * A datastore used by Kubernete’s backend to ensure highly available consistent access to a key value datastore. Logically represented as a flat binary space. Physically, as a B+ Tree with nodes as key value pairs. Each “state” contains only the difference from the previous state. Each difference may link to multiple nodes in the tree. This is extremely important to know when we talk about managing ETCD’s risk in a MTA.

### Pods

  * At its’ simplest use case, Pods are dynamically created, destroyed, and migrated among the nodes in the cluster. Kubernetes approached this ephemeral state by using Services as an abstraction of backend Pods. These pods operate within a given Node at any one time. Similar to the Heisenberg uncertainty principle but at a much, much slower speed and known possible locations / states. Pods are the simplest compute workload. They may consist of one or many containers with storage / network resources and a spec (PodSpecs) for how to run the container(s.). For most kubernetes architectures, the context of the pod is a set of *nix namespaces, croups, and other isolation techniques - similar to a Docker container. Within each pod context, additional isolations may be applied. An advanced use case has a pod with multiple containers. One container servers data stored in a shared volume while a separate sidecar refreshes those files. Another container runs a Node.JS app to interact with the two other containers. The pod wraps those storage, network, compute, and containers into a single object.

### Nodes

  * This is where things may get a bit weird due to the service mesh, cloud controller manager, and similar add ons. A node may consist of many different building blocks. A typical node has the following blocks;

  * Kublet consumes specifications (PodSpecs) and ensures its’ containers are running and healthy. It has no concept of containers running not created by Kubernetes. This is a critical point to note in case a malicious individual is able to run a container on a node that was not created via Kubernetes. The closest on-premise analog would be a rootkit without Ring 0 privileges. If not disabled, one may inject ephemeral containers for “debugging” purposes.

    1. Runtime

      1. Kubernetes natively supports various container runtimes. CRI-O, containers, and Docker. Pretty much anything that conforms to Kubernete’s Container Runtime Interface. With respect to security, Docker wasn’t built to be secure and has a lot of bloat that requires a significant amount of security attention and controls to mitigate. Containerd was built to be simple, robust, and portable. CRI-O is a lightweight alternative to Docker that uses runc or Kata. Kubernetes is aligning itself to the OCI spec so they do not need to focus on this challenge as Kubernetes was originally meant for orchestration, not formats and workload runtimes. <https://opencontainers.org/>

    2. Kube-proxy is one of those weird things mentioned above. Kube-proxy is a simple network proxy that maintains and enforces the network policy on each node in the cluster and the cluster’s ingress / egress traffic. Kube-proxy could use iptables, pf, or ipvs. Typically operates at OSI Layer 4, the proxy can operate at different OSI layers for efficiency and features. For instance, if traffic is sent to the cluster’s public facing IP address, kube-proxy’s iptable setup would capture that traffic, forward it directly to one of the pods via DNAT. Kube-proxy is not operating as a proxy on Layer 4. It only created IPTable rules and doesn’t need to internally context switch between the host’s kernel space and user space. Hence considered Layer 3 in this setup. As a result, much faster and efficient. But one gives up the proxy functionality. After a few years of limitations with this approach, many add ons, plugins, and efforts to push aside kube-proxy has lead to many different projects to handle this functionality and more I haven’t discussed yet. Hashicorp’s Consul, Lyft’s Istio, flannel, etc…. Just realize there is weird stuff going on here that affects the security and MTA criteria but the weirdness is specific to the technology, add on, MTA, and plugin used.

  * Plugins and Add Ons

    * Kubernetes became popular as its features requests, use cases, and popularity grew beyond its limited engineering resources. Too popular some would say. I would like to think they created an Add-on feature set that would allow others to add functionality to Kubernetes without mucking around in the core code or changing default behaviors for everyone or a vendor would lock in the community with their proprietary offerings. Some of these add ins extend network functionality such as writing Cisco network access control list languages, native layer 3 BGP, VXLAN, Cisco’s software defined networking, multiple network interfaces for a Pod, service discovery, DNS, dashboards, cute charts and graphs, and far too many other use cases to be listed here. Supply chain risks exist and there isn’t a tight control or assurances made if the Add ons are vulnerable, exploitive, etc…. Hence why over at the Cloud Native Computing Foundation, we attempted to address it across all cloud-native services - <https://github.com/cncf/sig-security/blob/e6dfeb2f767b36c747831850e2a3fdf4f9c26aea/supply-chain-security/README.md>

  

Coming up next week is Part 3 where we get our elbows into Kubernete’s
security.


