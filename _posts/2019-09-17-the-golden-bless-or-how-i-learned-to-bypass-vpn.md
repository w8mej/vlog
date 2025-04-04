---
layout: post
title: Kubernetes CI / CD And Monitoring Pipelines
date: 2019-09-17
categories: ["Kubernetes", "CI/CD", "Monitoring", "DevSecOps", "Security Automation", "Kubernetes Security", "Vulnerability Scanning", "Infrastructure as Code", "Network Policies", "Container Security", "Security Best Practices", "CIS Benchmark"]
excerpt: When one takes a step back and looks at a typical agile build, test, and release pipeline with a security bent; one observes the following steps and how they feed into each other like a dragon eating its’ tail.
---
#  
Overview

When one takes a step back and looks at a typical agile build, test, and
release pipeline with a security bent; one observes the following steps and
how they feed into each other like a dragon eating its’ tail.

  
  
  

![](/images/E942BA98-5AA5-4EB1-BCDF-6D3CBCB47C6A.jpg)

  

There are many different iterations of this dragon eating tail as there exist
IT frameworks for provisioning a new employee asset, be it ITIL, COBIT, etc….

![](/images/041E2BAE-5A91-4F21-A62D-59206602FA36.jpg)

![](/images/35AA2911-6867-4CD8-9B14-0709EE877C04.png.avif)

![](/images/AAA0739A-87FA-489E-A878-4864C3C0AD45.png.avif)

![](/images/814E0187-C7DA-469E-88E5-D2A24378B909.png.avif)

  
Irregardless of the pipelines and technologies, one may prefer to work
smarter; not harder. As a result, start off simple with a “container contains
a vulnerable OS package” finding. Instead of breaking the build, amend the
container spec with a “yum update” or “apt-get update && apt-get upgrade”,
merge the automated patch pull request, and rerun the testing. After doing
this a few times, see where else you may automatically heal and patch the
builds accordingly. After doing this for sometime, you may end up creating
SOAR playbooks and start working or contributing on a psuedo-AI to handle
these situations. That is what lead to me collaborating on Facebook’s SapFix
and Sapienz - https://engineering.fb.com/2018/09/13/developer-tools/finding-
and-fixing-software-bugs-automatically-with-sapfix-and-sapienz/  

I won’t get into the specifics and the steps with their corresponding order.
Only because when I was writing buildbot, TeamCity, Jenkins / Hudson,
concourse, spinnaker, and many other orchestration and deployment pipelines;
what it looked like VARIED GREATLY depending on the technology stack,
resources and investments by the executive sponsors, and the qualities one
would optimize for. Since this is about Kubernetes CI / CD pipelines, I will
mention a few tools and how one could benefit greatly by utilizing them in the
correct step with the proper outcomes defined. Each tool has their own feature
set with specifications to normalize their findings but many are immature and
do not offer that finding normalization. One may need to adjust the pipelines
to be intelligent at filtering out false positives instead of the default
Break The Build conclusion many engineers jump to. Hence eventually building
out a smart auto-triage service to handle these challenges instead of yet
another if else statement in the build pipeline code. Don’t forget the
monitoring step as many findings will be uncovered while the workload
executes. Hence why it is critical to invest in the auto-triage service, IE
SOAR capabilities.

Worth mentioning to test for anti-affinity, intoleration to anti-affinity,
node authorizer, kubelet certificate rotation (as per Monitoring), and kubelet
authn/z failure modes (if applicable.)

If you want to learn more about the holy trinity of software engineering,
systems engineering, and information security - here is a great resource to
start your path https://owasp.org/www-project-devsecops-maturity-model/

# Static Analysis

KubeAudit - it allows one to audit resource manifest files prior to
application. It will semantically check proposed code for known
incompatibilities. Great for pre-merge testing, easy to use, and simple to
extend.

Checkov - a great tool for identifying, remediation, and preventing
misconfigurations in infrastructure as code. I love how checkov supports
namespaces so I can have it not report any findings for the kube-system
namespace.

# Testing

Netassert and illuminate - great tools to create and execute network test
cases to ensure existing network policies are operating as expected vs.
inadvertently allowing unexpected traffic. These network policy validation
tools are a great sanity checker to ensure there isn’t data falling onto the
data center floors or evaporating onto the cloud when sent to the Internet.

Trivvy / Hadolint / Claire / Anchore / Microscanner - all great tools for
detecting and reporting on vulnerabilities (including policy as compliance
violations such as not adhering to CIS Benchmark X…) in container images. One
will need to determine how to handle normalizing findings across multiple
pipelines as well as what are the security gates (findings’ criticality such
as CVSS or the tool’s defined CRITICAL, HIGH, etc..) to observe, observe &
react, and / or block.

Polaris - great for ensuring pods and controllers are adhering to “best
practices.” Can operate as a validation webhook, CLI for testing local
configuration files, or as an Add-on dashboard for reporting and monitoring.  

# Release

Netassert and illuminate - great tools to create and execute network test
cases to ensure existing network policies are operating as expected vs.
inadvertently allowing unexpected traffic. These network policy validation
tools are a great sanity checker to ensure there isn’t data falling onto the
data center floors or evaporating onto the cloud when sent to the Internet.

<https://github.com/bgeesaman/kubeatf> \- not terribly security specific but
may accelerate those who wish to use an ansible-based pipeline.  
  

# Deploy

Netassert and illuminate - great tools to create and execute network test
cases to ensure existing network policies are operating as expected vs.
inadvertently allowing unexpected traffic. These network policy validation
tools are a great sanity checker to ensure there isn’t data falling onto the
data center floors or evaporating onto the cloud when sent to the Internet.

Polaris - great for ensuring pods and controllers are adhering to “best
practices.” Can operate as a validation webhook, CLI for testing local
configuration files, or as an Add-on dashboard for reporting and monitoring.

Kube-bench - a simple utility to determine if a running cluster adheres to CIS
Kubernetes benchmark.

<https://kubesec.io/> \- a simple service to determine if known insecure
patterns are applied to a running cluster.

and many other monitoring tools listed below may be worthwhile to include in
the Deployment phase if deployment end to end time is not a priority.  
  

# Monitoring:

KubeAudit - it allows one to monitor and audit live environments after
deployment for known risky configuration patterns such as allowing net_raw
capabilities or not utilizing a read-only filesystem.

Kube-hunter - allows one to monitor live environments for known security
weakness patterns. Such that one may detect any known injection patterns after
the fact.

Audit2rbac - this is a great tool to sanity check and limit permissions’
drift. The tool consumes the cluster(s) audit logs, then reviews (or
generates) RBAC roles and RoleBinding objects to determine which permissions
are actually used vs. not used.

Falco - a CNCF project for intrusion detection by wrapping the cluster and
workloads. The default rules are great but one will find them lacking when one
wants to observe threats specific to their technology stack and workloads.

Polaris - great for ensuring pods and controllers are adhering to “best
practices.” Can operate as a validation webhook, CLI for testing local
configuration files, or as an Add-on dashboard for reporting and monitoring.

Kube-scan / Octarine - great for sanity checking Octarine’s risk score on ones
workload. It will check everything from net_raw capabilities to lacking CPU /
memory governance to publicly exposed workloads via load balancers. Its’
deployment is well suited for monitoring unless one runs full parallel testing
regressions on the side and testing time is not a priority.

Kubiscan - permissions validator and monitor to ensure risky pods, subjects,
roles / rolesbindings, etc… are monitored and visibility presented when
potentially risky permissions are observed.

Sonobouy CIS Benchmark Add-On - simple plugin to monitor a clusters’ adherence
to CIS Kubernetes Benchmark policies.

Kube-bench - a simple utility to determine if a running cluster adheres to CIS
Kubernetes benchmark.

<https://kubesec.io/> \- a simple service to determine if known insecure
patterns are applied to a running cluster.

# No longer maintained tools but may provide limited value

  * https://github.com/DenizParlak/Zephyrus

  * https://github.com/nccgroup/kube-auto-analyzer


