---
layout: post
title: "Righty Tighty: The \"Physics-Compliant\" Approach to Cross-Cloud Security"
date: 2025-12-02
categories: ["Cloud Security", "Multi-Cloud", "OCI", "AWS", "YubiKey", "Terraform", "Infrastructure as Code", "Audit Logging", "Zero Trust"]
excerpt: We’ve all been there - juggling long-lived AWS access keys, managing OCI config files, and praying that the "secret" API token committed to a private repo three years ago doesn't come back to haunt us. But what if we treated cloud identity less like a password and more like a physical law?
---

*Why your next cloud security strategy might just depend on the laws of physics—and a YubiKey.*

We’ve all been there: juggling long-lived AWS access keys, managing OCI config files, and praying that the "secret" API token committed to a private repo three years ago doesn't come back to haunt us. The industry standard for infrastructure authentication often feels like a house of cards built on static text strings.

But what if we treated cloud identity less like a password and more like a physical law? Enter [**Righty Tighty**](https://github.com/w8mej/righty-tighty), a fascinating open-source experiment that proposes a "physics-compliant" approach to cross-cloud federation. By tethering the ephemeral cloud to a physical YubiKey, it forces a paradigm shift: **you can't deploy if you aren't physically present.**

Here are the five most surprising and impactful takeaways from this unique repository.

---

### 1. The "Righty Tighty, Lefty Loosey" Security Philosophy

The project’s name isn’t just a cute pun; it’s a governing philosophy. In the mechanical world, "righty tighty" locks things down, and "lefty loosey" releases them.

*   **Righty Tighty (Access):** You "tighten" security by requiring a physical YubiKey tap (WebAuthn/FIDO2) to authenticate. No tap, no token. The barrier to entry is physical presence.
*   **Lefty Loosey (Revocation):** The system is designed to "loosen" or let go of credentials automatically. By using HashiCorp Vault’s dynamic secrets with aggressively short Time-To-Live (TTL) settings (defaulting to 30 minutes), access evaporates almost as soon as it’s used.

> **"Righty Tighty is a cross-cloud federation hub that strictly adheres to the laws of physics (and security best practices)."**

### 2. True SSO for Infrastructure (Hardware-Rooted)

Most Single Sign-On (SSO) solutions for infrastructure still rely on a chain of software trust—a browser cookie here, a session token there. This project roots that trust in hardware.

The architecture allows a developer to tap their YubiKey once to authenticate with Vault via OIDC. Vault then acts as the broker, vending temporary, dynamic credentials for **both AWS and Oracle Cloud Infrastructure (OCI)**. Your physical key becomes the master skeleton key for your entire multi-cloud estate, but it never actually touches the cloud providers directly. It’s a clean, hardware-rooted chain of custody.

### 3. The "Black Box" Audit Log

One of the most innovative features is the implementation of an immutable audit trail that functions like a flight data recorder.

When a Terraform plan is executed, the system doesn't just log it to a text file. It:
1.  **Signs** the plan JSON with the YubiKey.
2.  **Uploads** it to an OCI Object Storage bucket.
3.  **Locks** it with WORM (Write Once, Read Many) compliance.

This ensures that every infrastructure change is cryptographically bound to the physical device that authorized it. You can prove, mathematically, *exactly* who (or at least, which key) pushed the button.

### 4. Cross-Cloud redundancy is a First-Class Citizen

While many projects claim to be "multi-cloud," they often just mean "we run on AWS and Azure separately." This repository demonstrates active cross-cloud federation.

The Terraform configuration (`main.tf`) seamlessly manages resources in AWS (S3 buckets, KMS keys) while simultaneously handling authentication and logging in OCI. It treats the clouds not as separate silos, but as different rooms in the same building, accessible via the same physical key. It’s a blueprint for true cloud agnosticism.

### 5. Security-First by Default

The code doesn't just implement features; it aggressively enforces security hygiene. The Terraform files are peppered with reminders to run security scanners like **Checkov**, **KICS**, and **Semgrep**.

More importantly, the infrastructure code itself is hardened:
*   **Encryption Everywhere:** S3 buckets and SNS topics are encrypted with KMS keys by default.
*   **Versioning:** All buckets have versioning enabled to prevent accidental data loss.
*   **Least Privilege:** IAM roles are scoped down, and public access is blocked at the bucket level.

It serves as a reminder that "infrastructure as code" should really be "security as code."

---

### Final Thought

**Righty Tighty** challenges us to rethink the ephemeral nature of cloud access. In a world where AI agents and automated scripts are increasingly running our infrastructure, there is something profoundly reassuring about anchoring the most critical actions to a physical object in the real world.

**If your entire cloud infrastructure disappeared tomorrow, could you prove—physically—who turned off the lights?** With this approach, you can.

https://github.com/w8mej/righty-tighty
