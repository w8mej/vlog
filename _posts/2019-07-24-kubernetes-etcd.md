---
layout: post
title: Kubernetes Master Node &amp;amp; Nodes
date: 2019-07-24
categories: ["Kubernetes", "Master Node", "Worker Nodes", "CIS Benchmark", "Security Best Practices", "Configuration Management", "Pod Scheduling", "Cluster Management", "Node Security", "Kubernetes Security"]
excerpt: One will wish to replicate their Master node to minimize downtime events. These nodes will host the control plane building blocks
---
One will wish to replicate their Master node to minimize downtime events.
These nodes will host the control plane building blocks (APIServer, Controller
Manager, Scheduler, etcd, etc…) A default cluster may operate 6,000+ worker
nodes which hosts the pods and containers for various non-Kubernete’s
workloads. By default, every worker node hosts kubelet and cube-proxy to
communicate with the Master nodes, networking, and provisioning / de-
provisioning. The file permissions for the various configuration files,
interfaces, and management sockets are critical for hardening the Master nodes
and nodes. Rotating certificates will mitigate some Ring 2 and 3 risks. There
are far too many permissions to list here so I will defer to the CIS
benchmarks below

By default, there are no restrictions on which nodes to which pods. Clusters
use pods, node selector, and other policy tools to provide rudimentary
isolation and separate workloads. PodNodeSelector is a great start to force
pods to specific namespaces and limit all pod placements to their specific
workloads. This assuming one dug deep into the Rings to enforce outside forces
(humans, power users, automation, etc..) cannot alter namespaces. The nodes
should only accept connections from the control plane(s) on specified ports,
and accept service connections via NodePort and LoadBalancer. Please avoid
exposing these directly to the Internet.

  
  

# CIS Benchmarks

## 1.1 Master Node

1.1.1 Ensure that the API server pod specification file permissions are set to
644 or more restrictive (Automated)

1.1.2 Ensure that the API server pod specification file ownership is set to
root:root (Automated)

1.1.3 Ensure that the controller manager pod specification file permissions
are set to 644 or more restrictive (Automated)

1.1.4 Ensure that the controller manager pod specification file ownership is
set to root:root (Automated)

1.1.5 Ensure that the scheduler pod specification file permissions are set to
644 or more restrictive (Automated)

1.1.6 Ensure that the scheduler pod specification file ownership is set to
root:root (Automated)

1.1.7 Ensure that the etcd pod specification file permissions are set to 644
or more restrictive (Automated)

1.1.8 Ensure that the etcd pod specification file ownership is set to
root:root (Automated)

1.1.9 Ensure that the Container Network Interface file permissions are set to
644 or more restrictive (Manual)

1.1.10 Ensure that the Container Network Interface file ownership is set to
root:root (Manual)

1.1.11 Ensure that the etcd data directory permissions are set to 700 or more
restrictive (Automated)

1.1.12 Ensure that the etcd data directory ownership is set to etcd:etcd
(Automated)

1.1.13 Ensure that the admin.conf file permissions are set to 644 or more
restrictive (Automated)

1.1.14 Ensure that the admin.conf file ownership is set to root:root
(Automated)

1.1.15 Ensure that the scheduler.conf file permissions are set to 644 or more
restrictive (Automated)

1.1.16 Ensure that the scheduler.conf file ownership is set to root:root
(Automated)

1.1.17 Ensure that the controller-manager.conf file permissions are set to 644
or more restrictive (Automated)

1.1.18 Ensure that the controller-manager.conf file ownership is set to
root:root (Automated)

1.1.19 Ensure that the Kubernetes PKI directory and file ownership is set to
root:root (Automated)

1.1.20 Ensure that the Kubernetes PKI certificate file permissions are set to
644 or more restrictive (Manual)

1.1.21 Ensure that the Kubernetes PKI key file permissions are set to 600
(Manual)

  

## Worker Nodes

4.1.1 Ensure that the kubelet service file permissions are set to 644 or more
restrictive (Automated)

4.1.2 Ensure that the kubelet service file ownership is set to root:root
(Automated)

4.1.3 If proxy kubeconfig file exists ensure permissions are set to 644 or
more restrictive (Manual)

4.1.4 If proxy kubeconfig file exists ensure ownership is set to root:root
(Manual)

4.1.5 Ensure that the --kubeconfig kubelet.conf file permissions are set to
644 or more restrictive (Automated)

4.1.6 Ensure that the --kubeconfig kubelet.conf file ownership is set to
root:root (Manual)

4.1.7 Ensure that the certificate authorities file permissions are set to 644
or more restrictive (Manual)

4.1.8 Ensure that the client certificate authorities file ownership is set to
root:root (Manual)

4.1.9 Ensure that the kubelet --config configuration file has permissions set
to 644 or more restrictive (Automated)

4.1.10 Ensure that the kubelet --config configuration file ownership is set to
root:root (Automated)

  

  

  

  


