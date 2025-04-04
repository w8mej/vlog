---
layout: post
title: Kubernetes Pods (PodSec policies)
date: 2019-07-26
categories: ["Kubernetes", "Pod Security", "Security Policies", "Pod Security Policies", "Workload Security", "Container Security", "CIS Benchmark", "Kubernetes Best Practices", "Pod Hardening"]
excerpt: Pods hardening is strongly configured and enforced with Pod Security policies (PodSec.). The security context enables not to restrict privileges, volume mounts, network privileges, cgroups / selinux / app armor / kernel capabilities, access control, read only file-system, etc…. This is where much of the workload insecurity comes from.
---
# Overview

Pods hardening is strongly configured and enforced with Pod Security policies
(PodSec.). The security context enables not to restrict privileges, volume
mounts, network privileges, cgroups / selinux / app armor / kernel
capabilities, access control, read only file-system, etc…. This is where much
of the workload insecurity comes from. The entirety of possible levers and
controls may be found @
<https://v1-16.docs.kubernetes.io/docs/reference/generated/kubernetes-
api/v1.16/#securitycontext-v1-core> . Instead of going into each one, I will
cover the high level risks and controls.

Most workloads require limited network access and extremely limited host
resources. Not all workloads require unlimited and unrestricted access to the
hosts and enveloping infrastructure No need for UID 0 (root) privileges nor
wheel / sudo / su privileges. Beware, extremely old docker workloads may
expect UID 0 privileges as Docker required UID 0 privileges to run.

For now, the PodSec policies are evaluated in the following order;

  1. If a policy is validated without altering the pod; it is applied and used.

  2. If the result of a pod creation request, then the first alphabetical, valid policy is applied and used

  3. If the result of a pod update request, then an error is returned. Pod mutations are not allowed during update operations.

  

# CIS Benchmark

5.2 Pod Security Policies

5.2.1 Minimize the admission of privileged containers (Manual)

5.2.2 Minimize the admission of containers wishing to share the host process
ID namespace (Manual)

5.2.3 Minimize the admission of containers wishing to share the host IPC
namespace (Manual)

5.2.4 Minimize the admission of containers wishing to share the host network
namespace (Manual)

5.2.5 Minimize the admission of containers with allowPrivilegeEscalation
(Manual)

5.2.6 Minimize the admission of root containers (Manual)

5.2.7 Minimize the admission of containers with the NET_RAW capability
(Manual)

5.2.8 Minimize the admission of containers with added capabilities (Manual)

5.2.9 Minimize the admission of containers with capabilities assigned (Manual)


