---
layout: post
title: Kubernetes Information Security Practices
date: 2019-07-16
categories: ["Kubernetes", "Information Security", "Vulnerability Scanning", "CI/CD", "Monitoring", "Security Practices", "Compliance", "Cloud Infrastructure", "GKE", "EKS", "Remote Management"]
excerpt: We sponsored a Kubernetes security review because of its’ popular adoption, glaring insecurities, default insecure states, wasn’t designed to be secure, and everyone wanted to use it and make it available to the Internet
---
# Overview

We sponsored a Kubernetes security review because of its’ popular adoption,
glaring insecurities, default insecure states, wasn’t designed to be secure,
and everyone wanted to use it and make it available to the Internet to
interact with (inadvertently most of the time.). As a result, the audit
completed, findings remediated, and the results still direct Kubernetes’
roadmaps. With that being said, The basic information security practices for
designing, creating, maintaining, and retiring kubernetes based workloads are
like many other R&D operational projects. Ensure one receives timely
notifications for vulnerabilities, misconfigurations with a security bent, and
general kubernetes security updates. I am happy with the kubernetes-announce
group, the relevant Slack channels, and have automation observe the security
reporting page.

  
  

Vulnerability scanning is heavily covered in the CI / CD & Monitoring pipeline
post so I won’t cover it here. Just please perform extremely simple
vulnerability detection with corresponding yum update or apt-get update &&
apt-get upgrade….

  
  

Kubernetes allows one to enable alpha and / or beta features. If one is
operating within any Ring, try to avoid the alpha / beta features. Not only do
they come with extremely limited Production-impacting assurances, but may have
limitations or vulnerabilities (or features that by its’ very nature is a
feature or vulnerability depending on ones’ point of view.).

  
  

The CIS Benchmark is not contextually aware of the workloads. Please harden
with that in mind and realize by utilizing the benchmark alone will result in
security that is the byproduct of compliance, not the other way around. The
benchmark doesn’t address service specifics, multi-tenancy architectures, and
installer insecurities. Adding on top of that, the Add-ons, plugins, and
workloads are the every changing dynamic that leads to one approaching a near
infinite amount of work to maintain and operate a secure Kubernetes based
workload.

  
  

If not utilizing the native Infrastructure as a Service remote management
capabilities (IE AWS Systems Manager / SSM), for most workloads, one will rely
upon ssh or rdp. RDP has its’ own technology stack solving just this problem
that is beyond the scope of this document. <https://docs.microsoft.com/en-
us/windows-server/remote/remote-desktop-services/rds-plan-access-from-
anywhere> is a great start for learning more about remote RDP. For SSH,
enabling a simple bastion host that allows one to expose ssh onto a bastion
host that would allow one to route to the correct node, pod, or cluster
interface. If you are willing, there are many other ways to improve upon the
bastion experience including not utilizing a bastion but relying upon Bless,
Cloudflare remote access, Square’s gssh, ghosttunnel, cloudpassage halo, etc…

  
  

  
  

What are the risks and compliance controls related to GKE?

See the github repository for details. https://github.com/w8mej/kubernetes_cli

What are the risks and compliance controls related to EKS?

See the github repository for details. https://github.com/w8mej/kubernetes_cli

  
  

  
  

  
  


