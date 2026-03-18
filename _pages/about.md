---
layout: page
title: sts:GetCallerIdentity
permalink: /about/
description: "John Menerick is a Security Engineer and complex systems practitioner with 11+ years in information security. Specializing in application security, secure architecture, detection engineering, zero trust, cryptographic engineering, and trusted AI compute."
---

Most security programs assume more tools and more operators will keep pace with an ever-expanding attack surface. **John Menerick** believes that assumption is wrong.

With 11+ years securing Fortune 500 financial institutions, tech companies, startups, and public-sector organizations, John treats **defense as a complex adaptive system** — one that senses, responds, and evolves. He draws on complex systems science (TAME, TOTE, Ashby's Law of Requisite Variety) to engineer security architectures that self-correct under pressure, spanning application security, detection engineering, zero trust, cryptographic protocol design, zero knowledge, cloud security, and AI/ML security.

**Proof of work:** Built [Gyoithon](https://github.com/w8mej) (ML-driven pentesting framework), published two whitepapers on agentic defense, reduced MTTD from hours to minutes at a Fortune 500, designed zero trust across 40K+ endpoints, mentored 78+ junior engineers, and maintains open-source tools ([ThreatPlays](https://github.com/w8mej/ThreatPlays), [IRKnowledge](https://github.com/w8mej/IRKnowledge), [IntelMetrics](https://intelmetrics.haxx.ninja)) used by the security community. Amateur Extra Class radio license (W8MEJ).

---

## Core Competencies

**Application & Product Security** — Secure code review, SAST/DAST, threat modeling (STRIDE, PASTA, attack trees), secure SDLC, API & supply chain security

**Detection, Response & Threat Intelligence** — Detection engineering, SIEM/telemetry pipeline design, IR & forensics, threat hunting, vuln management, red team automation

**Secure Architecture & Cryptographic Engineering** — Zero trust/ZK architecture, MPC, threshold cryptography, SPIFFE ,  SPIRE , zk-SNARKs/zk-STARKs, BFT/PBFT, Paxos/Raft consensus security, TEE/confidential compute, side-channel mitigation, PKI lifecycle, formal verification of distributed protocols

**AI/ML Security & Trusted Compute** — LLM security & prompt injection defense, federated learning security, differential privacy, model poisoning defenses, energy model-driven simulations and validations, autonomous agent security & distributed agent consensus, verifiable inference in untrusted environments

**Cloud, Infrastructure & DevSecOps** — AWS/GCP/OCI security, secure CI/CD & IaC hardening, distributed systems security (consistency models, linearizability, causal ordering), container security & service mesh trust, workload orchestration

**Complex Systems Science** — TAME framework, TOTE feedback loops, Ashby's Law of Requisite Variety, adaptive defense modeling from systems & cybernetics

---

## Published Research & Open Source

| Work | Type | Link |
| --- | --- | --- |
| From Complex Systems Biology to Agents — CTO Whitepaper | Whitepaper | [PDF](/images/CTOWhitepaper.pdf) |
| Agentic Defense & Complex Systems Security for AI | Research Paper | [PDF](/images/Agentic_Defense_Biological_Security_for_AI.pdf) |
| Agentic SOC Framework (Season 2 Series) | Blog Series | [Read →](/2026/01/31/season2-zeronoisecollective/) |
| Gyoithon: AI-Driven Penetration Testing | Open Source | [GitHub](https://github.com/w8mej) |
| ThreatPlays / IRKnowledge | Open Source | [GitHub](https://github.com/w8mej/ThreatPlays) |
| Threat Intel & Vuln Metrics | Dashboards | [Intel](https://intelmetrics.haxx.ninja) · [Vuln](https://vulnmetrics.haxx.ninja/) |

---

## Credentials

| Credential | Issuer |
| --- | --- |
| CISSP | (ISC)² |
| Google Cloud Professional | Google |
| Oracle Cloud Infrastructure | Oracle |
| ACSO | CREST |
| Amateur Extra Class License (W8MEJ) | FCC |

[Full credentials →](https://github.com/w8mej/credentials) · Cryptographic identities via [Keyoxide](https://keyoxide.org/hkp/sephiroth@haxx.ninja)

---

## Work Philosophy

- **Models the problem before reaching for a tool.** Maps feedback loops, failure modes, and emergent behavior before writing a single rule.
- **Builds what doesn't exist.** Built Gyoithon and IntelMetrics when the tooling wasn't there. Ships solutions, not vendor evaluations.
- **Operates at both altitudes.** Moves between executive architecture conversations and hands-on code review, packet captures, and IR.
- **Teaches by doing.** Pairs on incidents and co-authors detections with junior engineers.
- **Defaults to transparency.** Publishes research and open-sources tooling.

---

## Perspective

### Q: How do you apply complex systems theory to security engineering?

**A:** Threat landscapes are nonlinear — attackers adapt, environments shift, controls interact unpredictably. I use Ashby's Law of Requisite Variety to ensure defensive systems match the adaptive capacity of threats. Practically: detection pipelines with self-tuning feedback loops, architectures where subsystem failure doesn't cascade, and security operations treated as a living system rather than a fixed-state machine.

---

### Q: What's missing from how most organizations approach security engineering today?

**A:** Three critical things. First, most organizations optimize for compliance rather than resilience, failing to account for the perceived singularity acceleration of the cat-and-mouse game. While defenders are checking boxes for annual audits, threat actors are leveraging automated exploitation and AI-driven reconnaissance to compress the attack lifecycle toward near-zero. We aren't just fighting hackers; we're fighting an exponential curve.

Second, there is a massive velocity gap caused by an underinvestment in the "engineering" of security engineering. Organizations buy tools that are static by design, while the threat landscape is fluid. Without building the automated connective tissue—real-time telemetry pipelines and self-healing response workflows—you're bringing a manual process to a machine-speed fight.

Finally, we fail to treat technical security as a high-concurrency distributed systems problem. To survive the acceleration, security can't be a gate; it has to be a set of algorithmic guarantees. You need systems that provide consistency and graceful degradation under fire, effectively creating a defensive "OODA loop" that can programmatically outpace the adversary's evolution.


---

## sts:GetCallerIdentity

<h6>
{% highlight json %}
{
  "id": "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxx",
  "name": "john.menerick@haxx.ninja",
  "description": "John Menerick Human",
  "compartmentId": "ocid1.tenancy.oc1..aaaaaaaayyyyyyyyyyyyyyyyyyyyyyyy",
  "timeCreated": "2024-01-25T15:00:00.000Z",
  "lifecycleState": "ACTIVE"
}

{
  "email": "john.menerick@haxx.ninja,
  "sub": "117813812345678901234",
  "name": "John Menerick",
  "picture": "https://lh3.googleusercontent.com/a/XYZPhotoURL",
  "iss": "https://accounts.google.com",
  "aud": "your-client-id.apps.googleusercontent.com"
}
{% endhighlight %}

</h6>
[Additional credentials for various services and entities](https://github.com/w8mej/credentials)
