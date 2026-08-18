---
layout: post
title: "Security Theater and Cap Tables: Deconstructing Cal.com's Closed-Source Pivot"
image: /images/2026/caldotcomcasestudy.jpg   # full-bleed hero, 16:7
image_alt: "Financial cap table overlaid with open-source licensing code deconstructing Cal.com's closed-source pivot"
takeaways:
  - "Security justifications are frequently weaponized as cover for commercial cap table protection."
  - "Closing source code under the guise of security theater rarely fixes the underlying software defects."
  - "Open source business models must align economic incentives with long-term security maintenance."
date: 2026-04-16
categories: ["Security", "Open Source", "Business Analysis"]
tags: ["Security through Obscurity", "Cal.com", "Venture Capital", "AppSec", "OSS", "Licensing"]
author: w8mej
excerpt: "Cal.com's 2026 transition to a closed-source model was publicly framed as a response to AI-driven security threats. This case study decomposes the move, exposing the financial and competitive moats driving the decision."
---

Cal.com published a blog post last week announcing it was going closed source. The headline reason: AI is fundamentally changing the vulnerability landscape, making open-source codebases dangerous liabilities. They invoked a 27-year-old BSD kernel vulnerability found by AI as their cautionary tale. They framed open source as "giving attackers the blueprints to the vault."

This is security through obscurity. And it is, generously, a secondary concern wrapped around primary business drivers that the blog post doesn't mention.

Let's do the full decomposition.

---

## The Security Argument and Why It Doesn't Hold

Security through obscurity (STO) is the practice of relying on concealment as a primary security mechanism rather than on sound cryptographic, architectural, or access control design. Kerckhoffs's Principle established the counter-argument in 1883: a system should remain secure even if everything about it except the secret key is public knowledge. Shannon restated it in the 20th century: assume the adversary knows the system. NIST SP 800-123, OWASP's core principles, and every serious security framework treat obscurity as a *compensating* control — something that adds marginal friction at the margins, never a foundation.

Cal.com's specific claim is that AI can now be pointed at open-source codebases to systematically discover and exploit vulnerabilities in ways that weren't previously tractable. This is partially true as a general observation about the threat landscape. It is not a sound argument for closing source, for three reasons.

**First: the attack surface is the running system, not the repo.** Modern AI-assisted pentesting tools — commercial platforms like those Cal.com vaguely gestures at, plus open tools like Semgrep, CodeQL, Nuclei, and custom LLM-assisted fuzzing pipelines — primarily operate against *deployed applications* via dynamic analysis, API surface enumeration, traffic analysis, and binary inspection. The BSD kernel vulnerability they cite was discovered through static and dynamic analysis methodologies that apply equally to closed-source binaries. Decompilers exist. Network traffic is observable. Runtime behavior is instrumentable. Hiding your source code from attackers while leaving your production system exposed is moving the "blueprints" argument one layer back without addressing the actual attack surface.

**Second: closing source removes defenders, not just attackers.** Linus's Law — "given enough eyeballs, all bugs are shallow" — exists because open-source community audit provides continuous, adversarial review from security researchers who are not on your payroll. The BSD kernel vulnerability example cuts against Cal.com's argument: the vulnerability was found *publicly*, disclosed *publicly*, and patched *publicly*. The community response to disclosure is the security benefit of open source. Closing source doesn't prevent that class of vulnerability from existing; it just means when it's found, it's found by someone who isn't trying to help you.

**Third: their own production divergence undercuts the premise.** Cal.com acknowledges in the announcement that their production codebase has "significantly diverged" from what they're releasing as the open Cal.diy fork, including major rewrites of authentication and data handling. If the production systems were already substantially different from the public repository, the public repo wasn't providing accurate attack blueprints to begin with. The threat model they describe was already partially mitigated. Which means the security framing is covering for a different set of concerns.

The security-competent response to AI-assisted vulnerability scanning is a robust VDP, continuous SAST/DAST in the CI/CD pipeline, a bug bounty program, regular third-party penetration testing, and security engineering investment. None of those require closing source. Closing source is a business decision.

---

## The Actual Drivers: A Financial and Competitive Forensics

### The Funding Clock

Cal.com raised $32.4M across two rounds: a $7.4M seed in December 2021 and a $25M Series A in April 2022, led by Seven Seven Six (Alexis Ohanian), with participation from OSS Capital, Obvious Ventures, Sam Altman, Tobi Lütke, and roughly 25 other investors. That Series A is now four years old. There is no public Series B.

By late 2024, Cal.com had $5.1M in ARR at a claimed $150M valuation — a ~30x ARR multiple, respectable on paper. But the revenue base is thin relative to the capital deployed and the valuation claimed. The company appears to have been running at 13 employees as of mid-2024, down from a peak headcount of 31-50 in earlier data. That's capital conservation, not organic efficiency.

The 2026 Series B environment is structurally difficult. Only 66% of Series A companies successfully raise a Series B, deal activity fell 26% year-over-year in Q3 2025, and VCs from 2018-2021 vintage funds face LP pressure for DPI. A company approaching Series B conversations with $5.1M ARR, a four-year-old A round at peak 2022 valuations, and an open-source product that competes with itself needs a different IP narrative before it can have that conversation credibly.

### The OSS Capital Tension

One of Cal.com's Series A participants is OSS Capital — a firm whose entire thesis is commercial open-source software. The investment premise was open-core monetization: community adoption at the base, enterprise features and managed hosting as the revenue layer. Closing source represents a direct departure from that thesis, creating a board-level tension that isn't visible publicly but almost certainly shaped how this decision got framed and sequenced.

### The Monetization Ceiling

Cal.com's community identity was built on being the open-source Calendly alternative. Their GitHub still describes them as "the open-source Calendly successor." That positioning attracted developers, hobbyists, and self-hosters — precisely the demographic with the highest cost to convert to enterprise SaaS and the lowest willingness to pay. The community they built was structurally resistant to the monetization they needed.

Open-core monetization requires a genuinely compelling enterprise tier that self-hosters can't replicate. When the community edition is comprehensive enough to serve most use cases, the conversion pressure to paid enterprise evaporates. Cal.com's enterprise tier wasn't sufficiently differentiated from the self-hosted option to drive the conversion rates a $150M valuation requires.

Closing source is the blunt instrument for collapsing that gap. It makes self-hosting dependent on whatever the company chooses to release publicly, forces enterprise features behind a paywall with no free alternative, and eliminates the competitive risk of someone building a hosted Cal.com competitor using the public codebase.

### The Competitive Landscape

Calendly's valuation was $3 billion in 2021 — roughly 20x Cal.com's paper valuation on the same metrics. Calendly has entrenched enterprise sales motion, brand recognition, and integration depth that Cal.com's developer-focused positioning was never designed to displace at scale. Meanwhile, Cal.com ranks 9th among 133 active competitors, 4th in total funding, with competitors like Recall.ai raising $38M as recently as September 2025.

In a crowded market where feature parity is achievable through open reference implementation, closed source is competitive moat protection. It raises the cost for anyone who wants to clone the product or build a competing hosted service. HashiCorp articulated this directly when making their analogous BSL move: vendors providing competitive services built on community products will no longer be able to incorporate future releases and bug fixes. Cal.com didn't say this out loud. The logic is identical.

### The M&A Signal

The structure of the announcement is the tell. Cal.com simultaneously closed the production source *and* released Cal.diy under the MIT license — a community fork of an already-diverged older codebase. This bifurcation pattern is textbook IP cleanup before an exit process:

- Give the community an open artifact to manage backlash and maintain goodwill
- Create a clean proprietary asset with a defensible IP structure
- Separate "what the community owns" from "what we own" in a way that survives M&A due diligence

You cannot sell a company at a strategic acquisition premium when your core IP sits under a permissive open-source license. An acquirer paying 10-15x revenue for scheduling infrastructure needs to know they're acquiring something competitors can't freely replicate. Closing source while releasing a community fork achieves that in a single move.

HashiCorp did the same thing in 2023 — moved to BSL, faced community backlash, released assurances about community access, and was acquired by IBM for $6.4 billion roughly a year later. The license change didn't cause the acquisition, but it made the IP stack legible to acquirers. Strategic acquirers in this space — Salesforce, HubSpot, Microsoft, ServiceNow, any CRM incumbent that wants native scheduling infrastructure — pay very different multiples for defensible proprietary IP versus community-owned open infrastructure.

---

## The Established Playbook This Follows

This is not a novel move. The pattern across the industry is consistent:

| Company | License Change | Trigger | Outcome |
|---|---|---|---|
| HashiCorp | MPL → BSL (2023) | Revenue slowdown, workforce cut | Acquired by IBM $6.4B |
| MongoDB | SSPL (2018) | AWS forking and commercializing | IPO, strong enterprise growth |
| Elastic | SSPL (2021) | AWS OpenSearch fork | Maintained enterprise market position |
| Redis Labs | RSAL (2024) | Competitive hosting pressure | Ongoing enterprise focus |
| **Cal.com** | **Closed source (2026)** | **Aging Series A, revenue ceiling** | **TBD — likely M&A setup** |

In every prior case, the business logic was competitive moat and enterprise monetization. In every prior case, security was not the stated reason. Cal.com's framing is the outlier, and given the technical incoherence of the security argument, the framing itself is signal.

---

## Implications for Security Practitioners

**Vendor evaluation:** Closed source is not a security signal. It is an audibility reduction. When evaluating Cal.com or any vendor making a similar move, the security questions remain: What is their VDP? Do they have an active bug bounty? When was the last third-party penetration test? What is their patch cadence for disclosed vulnerabilities? What is their incident response SLA? These are the actual security indicators. Source visibility is one input into security auditability — its absence doesn't increase security, it decreases your ability to verify claims about security.

**Threat modeling:** Cal.com's specific threat model — "AI can scan our public codebase for vulnerabilities" — is worth examining on its merits. AI-assisted static analysis of public code is a real and increasing capability. It is also: (a) applicable to any compiled or interpreted code regardless of whether source is public, (b) already being applied to closed-source binaries via decompilation and runtime analysis, (c) better mitigated by continuous SAST/DAST in your own pipeline than by obscuring source. If your threat model assumes attackers will only use publicly available source code and won't instrument your deployed application, your threat model is wrong.

**Open vs. closed as a security consideration:** The empirical record doesn't support closed source as categorically more secure than open source. The most exploited software of the past decade is overwhelmingly closed source (Windows, iOS, enterprise SaaS platforms, network appliances). The most security-scrutinized infrastructure in production — Linux, OpenSSL after Heartbleed, the major cryptographic libraries — is open. What determines security posture is development practice, architecture quality, response culture, and resource investment. Source visibility is a governance factor, not a security control.

---

## The Version of This Announcement That Doesn't Require Debunking

There's an honest version of this announcement available to Cal.com, and it would have read something like:

*"We raised at 2022 valuations on an open-source thesis. The open-core model hasn't generated the enterprise conversion we needed. Our community is valuable but structurally resistant to monetization. We're in a crowded market where our public codebase gives competitors a free reference implementation. We need a defensible IP position to pursue our next funding round and potential strategic partnerships. We're closing source, releasing a community fork under MIT so the ecosystem we built continues to exist, and shifting to a model that better serves our investors and long-term product roadmap."*

That announcement would have been honest, would have respected the intelligence of the security community, and would have avoided the epistemic harm of teaching non-technical stakeholders that "closing source = more secure."

The problem with the honest version is that it's harder to generate goodwill from. "We need better unit economics" doesn't trend on LinkedIn. "We're protecting your data from AI-powered attacks" does.

---

## Conclusion

Cal.com's closed-source pivot is a rational business decision dressed in a technically incoherent security argument. The real drivers — aging Series A capital, a revenue base insufficient for the next funding cycle, open-core monetization failure, competitive commoditization, and IP cleanup for exit positioning — are visible in the public funding record, competitive landscape, and structural analysis of the announcement itself.

Security through obscurity has been a discredited primary security doctrine since before most of the software industry existed. When a company invokes it to justify a business model change, the appropriate response from the security community is to name it clearly, explain why it's wrong, and redirect the conversation toward what actually constitutes security posture improvement.

Closing source doesn't make Cal.com more secure. It makes their business model more defensible. Those are different things. In 2026, with the AI security narrative at peak ambient anxiety, the temptation to conflate them in a blog post is apparently irresistible.

---

*References: Cal.com blog (April 2026), Cal.com v6.4 changelog, Tracxn/PitchBook/Latka funding data, HashiCorp BSL announcement (August 2023), NIST SP 800-123, Kerckhoffs's Principle (1883), Shannon's maxim.*

