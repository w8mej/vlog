---
layout: post
title: Kubernetes Scheduler
image: /images/2019/kubernetes-kubelet.jpg   # full-bleed hero, 16:7
image_alt: "Kubernetes Scheduler and Kubelet architectural diagram showing pod placement constraints and node affinity"
takeaways:
  - "The Kubelet API endpoint must require strong authentication; unauthenticated access grants remote code execution."
  - "Pod affinity and taint configurations prevent sensitive workloads from co-locating with untrusted containers."
  - "Scheduler policies should enforce security isolation boundaries across heterogeneous nodes."
date: 2019-07-23
categories: ["Kubernetes", "Scheduler", "Resource Management", "CIS Benchmark", "Security Practices", "Pod Scheduling", "Governance", "HTTPS", "Configuration Management"]
excerpt: # Overview This is the building block that handles pods scheduling based upon resource constraints, requirements, tolerances, governance, and other policies. The scheduler
---
## Overview

This is the building block that handles pods scheduling based upon resource
constraints, requirements, tolerances, governance, and other policies. The
scheduler’s pod spec and kubeconfig file permissions should be restricted and
only accessible over HTTPS. Please bind to localhost because it exposes
sensitive metrics and health data that doesn’t require authentication by
default.

  

## CIS Benchmark

1.4.1 Ensure that the --profiling argument is set to false (Automated)

1.4.2 Ensure that the --bind-address argument is set to 127.0.0.1 (Automated)


