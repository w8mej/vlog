---
layout: post
title: 5 Surprising Lessons from Building a Cross-Cloud Credential Rotator
date: 2025-12-05
categories: ["Cloud Security", "DevSecOps", "AWS", "OCI", "Serverless", "Automation"]
excerpt: Managing secrets across one cloud is hard. Managing them across two, synchronously, is a masterclass in distributed systems engineering.
---

We've all been there: the dreaded 3 AM pager duty alert because a database password expired, or worse, a credential leaked and you're scrambling to rotate it across a dozen microservices. Now, imagine that database lives in one cloud, your application lives in another, and you need to rotate the keys for *both* simultaneously without downtime.

It sounds like a distributed systems nightmare, doesn't it?

I recently built a Proof of Concept (PoC) to solve exactly this problem—automating credential rotation between AWS RDS and Oracle Cloud Infrastructure (OCI) Autonomous Database. What started as a simple script evolved into a deep dive into the nuances of multi-cloud security. Here are the five most surprising lessons I learned along the way.

### 1. True Multi-Cloud Portability is a Container

When we talk about "multi-cloud," we often picture complex abstraction layers or heavy tools like Terraform trying to bridge the gap. But the most effective bridge turned out to be the humble container image.

In this project, the exact same Docker image powers the rotation logic on both AWS Lambda and OCI Functions. By packaging the Python runtime, the Oracle Instant Client, and the AWS SDK into a single immutable artifact, we eliminate the "it works on my machine" (or "it works in my region") problem entirely.

> **Takeaway:** Don't build separate rotators for separate clouds. Build one logic engine, containerize it, and let the cloud providers just be the execution runtime.

### 2. Split-Brain is the Enemy

The scariest part of rotating credentials in two places is the "split-brain" scenario: what if the password update succeeds in AWS but fails in OCI? Your application, reading from the old secret, would suddenly be locked out of the database.

To combat this, the rotation worker implements a strict rollback mechanism. If the OCI rotation fails, it immediately attempts to revert the AWS RDS password to its previous state.

```python
    except Exception as e:
        # Attempt rollback of RDS to previous password to avoid split-brain
        try:
            if changed["rds"]:
                # ... connect and revert ...
                alter_user_postgres(conn, current_user, current_password)
```

This isn't just error handling; it's a survival strategy for distributed consistency.

### 3. Security is Ephemeral

Handling Oracle Wallets (the credential files needed to connect to an Autonomous Database) is notoriously tricky. You can't just check them into git, and baking them into the image is a security sin.

The solution? Treat them as ephemeral state. The worker dynamically retrieves the wallet from a secure source (like OCI Object Storage or a pre-authenticated URL) at runtime, unzips it to the container's temporary `/tmp` directory, uses it for the connection, and lets it vanish when the container dies.

> **Takeaway:** The most secure file is the one that doesn't exist when you're done with it.

### 4. Trust, but Verify (Cryptographically)

Logging is essential, but how do you trust your logs in a compromised environment? If an attacker gains access, they could easily doctor the text files.

This project implements an HMAC-signed audit trail. Every rotation event is hashed with a secret salt (stored securely in SSM or OCI Vault) before being written to cold storage.

```python
    digest = hmac.new(salt.encode(), msg=message.encode(),
                      digestmod=hashlib.sha256).hexdigest()
```

This ensures that the audit log is tamper-evident. If the hash doesn't match the message, you know something is wrong. It's a small touch that adds a massive layer of integrity.

### 5. "Proof of Concept" Doesn't Mean "Insecure"

There's a temptation to cut corners in a PoC—"I'll add SSL later," or "I'll fix the IAM policies in production." But security debt is the hardest debt to pay down.

Even in this demo, we enforced:
*   **SSL/TLS** for all database connections.
*   **Least Privilege IAM** roles, scoped down to specific ARNs and OCIDs.
*   **Image Scanning** hooks in the `Makefile` to catch vulnerabilities before deployment.

It proves that "secure by default" isn't just a slogan; it's a development habit.

### Summary

Building a cross-cloud credential rotator taught me that the challenges aren't just about APIs or SDKs—they're about consistency, atomicity, and trust. Whether you're managing a massive enterprise fleet or just a side project, these principles of ephemeral state, cryptographic verification, and containerized portability are your best defense against the chaos of the cloud.

**What about you?** How are you handling the friction between your multi-cloud security policies? It might be time to look at your rotation strategy with fresh eyes.

**Check out the code:** Dive into the details and star the repository on GitHub: [https://github.com/w8mej/dizzy-keys](https://github.com/w8mej/dizzy-keys)
