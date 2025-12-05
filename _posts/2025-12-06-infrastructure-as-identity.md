---
layout: post
title: "Forget HR Systems: Why Your Next Identity Provider Should Be a Piece of Plastic"
date: 2025-12-06
categories: ["Infrastructure as Identity", "Zero Trust", "YubiKey", "HashiCorp Vault", "Terraform", "Kubernetes", "Automation"]
excerpt: We've spent decades building complex identity pipelines rooted in databases and HR software. What if the single source of truth for your entire infrastructure was something you could hold in your hand?
---

We’ve all been there. You start a new job, and the "onboarding" process is a week-long saga of waiting for tickets to close, permissions to propagate, and accounts to be provisioned. It’s the digital equivalent of waiting in line at the DMV. But what if it didn't have to be that way? What if the moment you plugged in your security key, the entire infrastructure you needed just... appeared?

I recently explored a fascinating proof-of-concept that flips the traditional onboarding model on its head. Instead of relying on a sprawling web of HR systems and manual approvals, it uses a physical hardware token as the absolute source of truth. It’s a concept I’m calling "Infrastructure as Identity," and it’s as radical as it sounds.

Here are the three most surprising takeaways from this experiment in extreme automation.

### 1. Hardware is the New Identity Provider

In most organizations, "identity" is a row in a database managed by HR. This project challenges that assumption by making the **YubiKey itself** the primary trigger for existence within the system.

> "The hardware token itself is the source of truth — once the serial is recorded, identity + infra appear automatically."

This is counter-intuitive because we’re used to thinking of hardware tokens as *second* factors—something you use *after* you’ve established who you are. By elevating the physical token to the primary identifier, we eliminate the gap between "having the key" and "having access." If you hold the key, the infrastructure knows you, and more importantly, it builds itself for you. It’s a tangible, physical anchor in an increasingly ephemeral cloud world.

### 2. The "Null Resource" Power Move

Terraform is famous for managing cloud resources like VMs and load balancers. But this project uses a humble `null_resource` to orchestrate a complex dance between physical hardware and digital identity.

By using a local script to read the YubiKey's serial number and fire it off to the Vault API, the system bridges the air-gapped world of USB ports with the cloud-native world of HashiCorp Vault. It’s a reminder that sometimes the most powerful automation tools aren't the ones with the flashiest features, but the ones that allow us to glue disparate worlds together. This "glue code" isn't just a script; it's the translator that turns a physical connection into a digital identity.

### 3. Zero-Touch Namespace Provisioning

The "magic trick" of this setup is what happens after the key is registered. There is no ticket to IT. There is no manual creation of a Kubernetes namespace.

Once the YubiKey serial is mapped to a Vault entity, Terraform Cloud wakes up. It sees the new identity and automatically provisions a dedicated Kubernetes namespace and a ServiceAccount bound to that specific Vault policy.

> "A single hardware token → Vault Identity → Kubernetes namespace."

This is the definition of "Zero Touch." The infrastructure reacts to the presence of the user (represented by the key) rather than the user asking for the infrastructure. It shifts the paradigm from "request and wait" to "arrive and receive." It suggests a future where our environments are as fluid and responsive as the devices we carry.

### Summary

This project is a glimpse into a future where security and convenience aren't enemies, but partners. By treating a physical token as the root of trust for infrastructure provisioning, we can eliminate friction and increase security simultaneously. It forces us to ask: **If our infrastructure can react to a physical key, what else can it react to?**

Are we ready for a world where our digital environments assemble themselves the moment we walk in the door?

*Curious to see the code behind the concept? Check out the [repository on GitHub](https://github.com/w8mej/token-effort).*
