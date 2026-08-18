---
layout: post
title: Kubernetes Networks - CNI
image: /images/2019/want-to-escalate-aws-iam-permissions.jpg   # full-bleed hero, 16:7
image_alt: "Kubernetes CNI network interface architecture and AWS IAM instance metadata privilege escalation paths"
takeaways:
  - "Pods with access to the AWS Instance Metadata Service (IMDS) can steal node IAM credentials."
  - "Enforce IMDSv2 and use IRSA (IAM Roles for Service Accounts) to scope pod credentials strictly."
  - "Container Network Interfaces (CNI) must enforce network isolation to prevent metadata exfiltration."
date: 2019-07-24
categories: ["Kubernetes", "Networking", "CNI", "Network Policies", "Service Mesh", "Routing", "Storage Interface", "Security Best Practices", "Kubernetes Security"]
excerpt: Within Kubernetes, networks are an interesting beast. They become extremely muddled
---
## Overview

Within Kubernetes, networks are an interesting beast. They become extremely
muddled when one (CNI) utilizes OSI Layer 2-7 service mesh to handle not only
network routing, network policies, load balancers, but also providing a
container storage interface (CSI.) For simplicity sake, we will consider a
simple network provider that only handles routing and network policies. Each
provider will have their own gotchas, limitations, and hardening guides so
please see their hardening documentation. By default, almost all network
providers allow all traffic across all namespaces.

Common network providers will align to Kubernetes’ namespace model to
construct and enforce network policies. These policies enable one to construct
and enforce traffic within pods but also within and across namespaces. Beyond
the traditional on-premise router, quotas and limits may be applied to enable
one to request ports or load balancers. Like many enterprise routers, one may
configure and enforce TLS connectivity.

Depending on which Ring, there exists multiple ports that may not need to be
exposed to 0.0.0.0: 10250, 10255, 10256, 41949, etc…. Please restrict
accordingly.

  

## CIS Benchmark

5.3 Network Policies and CNI

5.3.1 Ensure that the CNI in use supports Network Policies (Manual)

246 5.3.2 Ensure that all Namespaces have Network Policies defined (Manual)


