---
layout: post
title: What is a modern, dynamic service and its' building blocks?
date: 2019-07-13
categories: ["Cloud Native", "Modern Services", "Containerization", "CI/CD", "Orchestration", "Kubernetes", "Microservices", "Networking", "Observability", "Service Discovery", "Databases", "Messaging"]
excerpt: As I work through the ecosystem, there is no evident, leading best practice.
---
When I look at the Cloud Native ecosystem, I am astonished.  The vendor
space’s market capitalization is near $7.78 trillion with funding of $12.26
billion.  Below is a rough ecosystem image.

View fullsize

![](/images/CloudNativeRoadmap.png.avif)



As I work through the ecosystem, there is no evident, leading “best practice.
Within modern, dynamic environments, there are not obvious answers to empower
an organization to build and operate scalable applications.  There are no best
practices to enable loosely coupled, resilient, manageable, and observable
systems.  Much less do not require 5 FTEs to enable repeatable, predictable,
high-impact outcomes.

 Below are high level challenges one will solve as they build and run their
modern, dynamic service:

## Containerization

  * Commonly seen with Docker

  * Any size and dependencies may be containered

  * Eventual microservices architecture

  

## Registries and Runtime Execution

  * Harbor.io is a great registry which stores, signs, and scans container content.  When hooked into Clair, may provide vulnerability information

  * If docker isn’t your thing, OCI-compliant containerd, rkt, and CRI-O work great

  

## Distribution

  * An implementation of the Update Framework, Notary, is great to start off distributing your services

  

## CI / CD

  * Changes to the source code automatically result in new containers built, tested, and deployed

  * Hopefully canary with blue / green deployments

  * Automated deployments, rollbacks, and testing

  * Orchestration and Application Definitions

  * Kubernetes is leading the orchestration market

  * Aim to utilize a certified Kubernetes distribution or hosting platform

  * Helm charts enables one to define, install, and upgrade even complex Kubernetes enabled services

  

## Analysis and Observability

  * Find the right services for logging, tracing, and monitoring

  * Prometheus is great for monitoring

  * Fluentd is wonderful for logging

  * Jaeger isn’t bad at tracing.  Otherwise, look for an Open-Tracing compatible solution

  

## Discovery, Mesh, and Proxy

  * CoreDNS is flexible and fast.  Great for service discovery

  * Linkerd and Envoy enable mesh architectures, health checking, routing, and load balancing

  

## Networking Policy Enforcement

  * Istio, Flannel, Calico, or Weave Net are decent general purpose network policy engines

  * Uses range from authorization and admission to data filtering

  

## Database and Storage

  * It really depends on the storage type

  * If one is utilizing MySQL, Vitess works to scale and shard

  * Rook works as a storage orchestrator

  * Etcd provides mechanisms to store data across clusters

  * TiKV works well as a highly performant transactional key-value store

  

## Streaming and Messaging

  * When JSON-REST is not enough, gRPC or NATS is the way to go. 

  * Generic RPC usage is implemented in gRPC

  * Complex messaging utilizes NATS (pubsubhub / subscriptions, request / reply, load balancing, etc..)






