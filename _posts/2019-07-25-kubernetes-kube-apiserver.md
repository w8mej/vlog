---
layout: post
title: Kubernetes Containers
date: 2019-07-25
categories: ["Kubernetes", "Containers", "Container Security", "Container Technology", "Docker", "Container Vulnerability Scanning", "Image Signing", "Security Best Practices", "CI/CD", "Compliance"]
excerpt: When we get into the specifics for containers, the challenge is that the detailed advice differs greatly between the different container technologies. As a result, I will STRONGLY recommend one doesn’t run Docker as it was never designed to be secure, requires Swarm to manage some aspects of its’ lacking security, and requires a near-infinite amount of hand holding
---
  

# Overview

When we get into the specifics for containers, the challenge is that the
detailed advice differs greatly between the different container technologies.
As a result, I will STRONGLY recommend one doesn’t run Docker as it was never
designed to be secure, requires Swarm to manage some aspects of its’ lacking
security, and requires a near-infinite amount of hand holding to manage it
risks (especially when Docker Enterprise is rumored to be up for sale.). There
are many who think Docker is too complex and unwieldy. From a security
perspective, Docker’s inherent process driven architecture runs everything
through one daemon. This mixing of streams results in a puddle of insecurity
that requires a complete rewrite and supporting backwards compatibility with
the insecure architecture.

The challenge with publicly releasing internal images and configurations to
public registries is that there exists a significant amount of work to rebuild
the trust and trusted builds of ones’s containers but presents a challenge
ensuring staff pull from trusted anchors only. Sadly AWS ECR’s feature set is
extremely lacking. While AWS and us work on replacing ECR with Notary 2.0 and
similar container management features (including potentially replacing Docker
Hub as the source of truth for many projects - assuming the rumor mills are
right that they will limit their free governance to increase quarterly revenue
due to funding challenges), one will need to provide a trusted repository.
During the validation and updates, not only do those processes require passing
vulnerability scans and policy as configuration scanning but also signing the
updated image. This will allow Kubernetes to conveniently ensure only signed
images are handled and brought into a running state. Along the way, configure
Kubernetes (validatingadmission web hooks) to ensure only trusted sources are
pulled from as many drive by night compromises rely upon loading third party
sources.

Here are a few of the generic touch points for any container on any container
runtime engine;

  * Prevent dynamic kernel module loading at runtime

  * Scan for vulnerabilities, policy / compliance violations, and dependency vulnerabilities. See the CI / CD and monitoring pipelines for specific things to run and look for within the container

  * Keep an accurate inventory of containers’ versions deployed and running. See above for scanning to ensure new vulnerabilities are quickly raised for long running containers

  * Sign the images and enforce the signature(s). I prefer Portieres.

  * Given the typical OS ring security model for most modern operating systems, please do not provide any administrative access, user access, or potential (sudo / su / wheel) privileges to any processes / users within the containers. Many containers can be escaped by a simple elevation to root privileges within the container. Once one has shell within a container, at Ring 5, it is simple to elevate Kubernetes privilege to access all workloads, pivot outside of the cluster, elevate to root on the nodes, and exfiltrate non-public information including consequence heavy PHI and PII.


