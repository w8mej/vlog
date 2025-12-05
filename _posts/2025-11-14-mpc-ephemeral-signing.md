---
layout: post
title: Why Your Next Security Architecture Should Be Ephemeral (and Why We Built It That Way)
date: 2025-11-14
categories: ["Confidential Computing", "MPC", "Zero Trust", "Infrastructure Security", "OCI", "Attestation"]
excerpt: We built a signing service that doesn't trust its own keys. Here's why that's the future of security.
---

We still build security like we build castles: thick walls, deep moats, and a really important key hidden under the king's pillow. In the software world, that "key" is usually a long-lived private signing key sitting on a server (or maybe an HSM if you're fancy), waiting to be stolen.

But what if the castle could vanish every time you weren't looking? What if the key only existed for the exact millisecond it was needed, and then dissolved into thin air?

That’s the premise behind our latest proof-of-concept: **MPC Ephemeral Signing on OCI Confidential Compute**. It’s a mouthful, but it represents a radical shift in how we think about trust. We built a system where multiple parties have to agree to sign something, but—and here’s the kicker—*no single machine ever holds the full signing key*, and the keys themselves are born and die with the session.

Here are the four most surprising things we learned while building it.

### 1. The "Boring" Part is Actually the Hard Part

When people hear "Multi-Party Computation" (MPC), they think of complex math and advanced cryptography. And sure, the math is cool. But in practice? The math is a solved problem.

The real nightmare is **orchestration**.

> "While the cryptographic core is simplified... the service orchestration, trust model, and attestation plumbing are production-oriented."

Getting three different servers to agree on *who* they are, *what* they are signing, and *when* to do it—without a central dictator—is a distributed systems problem, not a crypto problem. We spent 80% of our time on gRPC state machines and 20% on the actual signing logic. If you're building this, don't underestimate the plumbing.

### 2. Hardware is the New Root of Trust

We’ve spent decades trying to secure software with more software. It hasn’t worked great. This project leans heavily on **AMD SEV-SNP** (Secure Encrypted Virtualization - Secure Nested Paging).

Why does this matter? Because it allows us to prove—cryptographically—that our code is running inside a genuine, unmodified enclave in the cloud. We don't just trust that the server is secure; the server *proves* it to us with a hardware-signed report.

Every time our services talk to each other, they aren't just checking a TLS certificate. They are checking a hardware attestation report that says, *"I am this specific code, running on this specific processor, and I haven't been tampered with."* It’s like having a DNA test for your server instances.

### 3. If It's Important, It Should Be Ephemeral

The most secure key is the one that doesn't exist.

In traditional PKI, you mint a certificate and hope you don't lose the private key for the next year. In our model, we mint **ephemeral code-signing certificates** that are tied to a specific session.

1.  A quorum of engineers approves a change.
2.  The keys are generated.
3.  The artifact is signed.
4.  **The keys are destroyed.**

There is no "master key" to steal later. If an attacker breaks in tomorrow, there's nothing there to find. This "use-and-lose" philosophy is counter-intuitive if you're used to hoarding keys, but it drastically reduces the blast radius of a compromise.

### 4. Pinning Policy, Not Just Certificates

We introduced a concept called `TEE_POLICY_HASH`. Instead of just pinning a public key, we pin the **hash of the enclave's measurement**.

This means if someone (even us!) tries to deploy a slightly modified version of the signing service—maybe one with a backdoor—the hash changes. The other services will immediately reject it.

> "All RPCs fail if `TEE_POLICY_HASH` mismatches."

It’s a strict, binary level of trust. Either you are running the exact, bit-for-bit code we agreed upon, or you don't exist to us. It’s harsh, but in a world of supply chain attacks, it’s necessary.

### The Future is Paranoid (and That's Good)

This POC isn't just a tech demo; it's a blueprint for a "paranoid" architecture where trust is never assumed, only proven. By combining MPC, confidential computing, and ephemeral credentials, we can build systems that are robust not because they are strong, but because they don't hold onto the secrets that attackers want.

The question isn't "how do we secure our keys?" It's "why do we still have them?"
