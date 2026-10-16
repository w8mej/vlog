---
layout: post
title: "Part IX — Long dwell"
date: 2026-08-28 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 10
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-9.jpg   # full-bleed hero, 16:7
image_alt: "A log rotation erasing the causal link between two distant events"
description: "Your organization can correlate cause and effect over some interval. Past that interval, log rotation, platform migration, and staff turnover destroy the forensic state — and your own operational hygiene finishes the job the adversary started."
excerpt: "Your organization can correlate cause and effect over some interval. Past that interval, log rotation, platform migration, and staff turnover destroy the forensic state — and your own operational hygiene finishes the job the adversary started."
read_time: 14
takeaways:
  - "The institutional detection horizon is the interval over which you retain enough correlatable state to link a cause to its effect. Past it, attribution is unrecoverable by your own hand."
  - "Review attention is an allocable resource, and the probability of scrutiny falls with the novelty of the artifact — so the safest place to hide something is the most boring part of it."
  - "Directive authority over autonomous capacity is an insider-threat surface that volume-based detection is structurally blind to."
tags:
  - beyond-verifiable-reward
  - season-4
  - detection-engineering
  - insider-threat
  - supply-chain-security
  - incident-response
  - ai-security
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 10 of 12</span>
  </div>
  <h2 class="ep-title-display">Part IX</h2>
  <p class="ep-header-tagline">Long dwell</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">Everything in this season so far has been about mechanism. This episode is about time, and it is the one that changes how you read incident data.</p>
  <p class="ep-lede">Ask a simple operational question: <strong>over what interval can your organization still link a cause to its effect?</strong></p>
  <p class="ep-lede">Not "how long do we keep logs." That is a compliance answer. The real question is how long you retain enough <em>correlatable</em> state &mdash; logs that share identifiers, systems that still exist in the form they existed in, people who remember why a decision was made, build artifacts you could still reproduce. In most organizations that interval is somewhere between eighteen and thirty-six months, and it is bounded by three unglamorous processes: log rotation, platform migration, and staff turnover.</p>
  <p class="ep-lede">Call it the <strong>institutional detection horizon</strong>. It is not a security control and nobody owns it. It is an emergent property of ordinary operational hygiene.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The consequence</span>
<h2>Your own housekeeping completes the attack</h2>

<p>Here is the uncomfortable arithmetic. If the interval between an action and its consequence exceeds that horizon, then by the time the consequence is visible, the forensic state linking it to the cause is gone.</p>

<p>Not deleted by an adversary. Deleted by you, on schedule, for good reasons &mdash; the retention policy, the migration to a new platform, the engineer who left and took the context with them.</p>

<p>This is not a hypothetical property of exotic operations. It is the reason that supply-chain compromises get discovered by accident rather than by investigation, and it is the reason that when they are discovered, the question "how long has this been here" so often has no answer. The defender's own operational discipline is what makes the causal chain unrecoverable.</p>

<p>Two things follow, and both are actionable.</p>

<div class="infobox">
  <p><strong>Detection strategies premised on eventual correlation have an expiry date that nobody wrote down.</strong> "We would catch it in retrospective analysis" is a claim with a time bound, and the bound is your horizon, and you probably do not know what it is.</p>
  <p style="margin-top: .75rem;"><strong>Your horizon is measurable.</strong> Pick a real past incident. Try to reconstruct the causal chain today. Note where it breaks. That is your horizon, empirically, and the exercise takes an afternoon and is more informative than any tabletop I have run.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The attention economy</span>
<h2>Novelty attracts scrutiny, so novelty is not where to look</h2>

<p>Now the second resource that behaves like time: reviewer attention.</p>

<p>Review capacity is finite and it is not allocated uniformly. It concentrates where the artifact is novel, where the change is architecturally significant, where the reviewer's own expertise makes the material interesting. Boilerplate, build configuration, test fixtures, generated files, dependency manifests &mdash; these receive a fraction of the attention per line that the interesting code receives.</p>

<p>That allocation is rational. It is also a map.</p>

<p>The probability of rejection rises with novelty, so the optimal placement for something you do not want examined is the <strong>minimum-novelty region</strong> of the artifact. Build systems. Test fixtures. Configuration. The parts everyone scrolls past because they are boring, and they are boring because they are supposed to be.</p>

<p>The compression-library compromise that the industry spent 2024 absorbing is the canonical instance, and I want to be careful not to flatten it: that incident involved a multi-year social-engineering campaign against a burned-out maintainer <em>and</em> a payload placed in build machinery. It was not one clever trick. But the placement decision within it &mdash; the payload living in test data and build scripts rather than in reviewed source &mdash; is exactly this principle, and it worked for exactly this reason.</p>

<p>The defensive read is not "review everything equally," which is not achievable and would be a bad use of the capacity you have. It is narrower:</p>

<div class="callout-box cb-red">
  <div class="callout-label">Attention Allocation</div>
  <p><strong>Review attention should be allocated by blast radius, not by interestingness.</strong> A three-line change to a build script that runs with elevated privileges deserves more scrutiny than a three-hundred-line refactor of business logic that runs in a sandbox. Almost no organization allocates this way, because the interesting change is the one people want to review.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The queue</span>
<h2>What happens when generation outruns validation</h2>

<p>There is a related structural problem that will get worse before it gets better, and it has a simple shape.</p>

<p>Any review process is a queue. Work arrives at some rate; capacity clears it at some rate. When the arrival rate exceeds the clearing rate, waiting time does not degrade gracefully &mdash; it diverges. That is not a model-specific result, it is general, and the qualitative consequence holds regardless of the arrival distribution.</p>

<p>Automated generation raises the arrival rate. It does not raise the clearing rate, because clearing requires exactly the kind of judgement that episode two identified as the non-accelerating half of defensive work.</p>

<p>Two effects, and the second one is the security-relevant one:</p>

<div class="conditions-grid">
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Volume</h3>
    <p>Maintainers and triage teams receive more submissions than they can evaluate. Bug bounty triage and open-source maintainer inboxes are already living this.</p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Service time</h3>
    <p>A submission that is <em>nearly correct and highly plausible</em> consumes far more reviewer time than one that is obviously wrong. The obviously wrong one is closed in a minute. The plausible one requires the reviewer to actually work the problem. As the fraction of plausible-but-wrong submissions rises, effective capacity falls even at constant volume.</p>
  </div>
</div>

<p>So the pressure on review capacity is not just "more stuff." It is more stuff that is individually more expensive to dismiss. Any triage design that assumes a fixed cost per item is going to be surprised.</p>

<hr class="gw-hr">
<span class="section-label">The leverage problem</span>
<h2>The insider threat that volume-based detection cannot see</h2>

<p>Last one, and it is the one I think is most under-appreciated in agentic deployments.</p>

<p>Insider-threat detection is built around volume. Bulk downloads. Mass queries. Off-hours access to unusual systems. Anomalous data movement. That model works because historically an insider's blast radius scaled with the volume of their own activity.</p>

<p>Concentrate directive authority over autonomous capacity and that relationship breaks. A single, fully credentialed, entirely non-anomalous instruction can redirect thousands of agent-hours. One command. Correct credentials. Normal working hours. Nothing to flag, because the volume signature of "direct a large fleet to do something" is indistinguishable from the volume signature of "direct a large fleet to do the normal thing."</p>

<div class="infobox red">
  <p>The blast radius now scales with <strong>directed compute</strong>, and nothing in the detection stack measures directed compute.</p>
</div>

<p>The control that fits is structural rather than behavioural: <strong>multi-party authorization above a leverage threshold.</strong> Not for every instruction &mdash; for instructions whose scope exceeds some amount of directed capacity. It is the same reasoning that puts two people on a production database migration, applied to a resource nobody has yet learned to think of as a resource.</p>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>Four measurements, no new tooling</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">Measure your institutional detection horizon</div>
    <p>Take a real incident from eighteen months ago and try to reconstruct it now. Where the chain breaks is your number. Write it down and put it next to every detection strategy that assumes retrospective correlation.</p>
  </div>
  <div class="rem-block rem-critical">
    <div class="rem-header">Re-allocate review attention by blast radius</div>
    <p>Specifically: identify every file in your repositories that executes with elevated privilege during build or deploy. Those get mandatory senior review regardless of diff size. Most organizations have fewer than fifty such files and no policy distinguishing them.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Instrument review service time, not just review count</div>
    <p>If the average time-to-close is rising while volume is flat, your capacity is being consumed by plausible-but-wrong work and you will hit the divergence point without seeing it coming.</p>
  </div>
  <div class="rem-block rem-critical">
    <div class="rem-header">Define a leverage threshold</div>
    <p>How much autonomous capacity can one credentialed instruction direct before it needs a second approver? You may not like the number you are currently running at, which is usually "unbounded."</p>
  </div>
</div>

<p>Next episode takes the time dimension to its uncomfortable conclusion, in the one domain where the accumulated quantity we depend on has never been named as a quantity at all.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-27-beyond-verifiable-chain-of-thought-rewritten-summary %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 9 &mdash; Part VIII: The explanation layer is the attack surface</span>
  </a>
  <a href="{% post_url 2026-08-29-beyond-verifiable-cryptoquality-goes-down %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 11 &mdash; Part X: The assurance ledger</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">detection-engineering</span>
  <span class="tag">insider-threat</span><span class="tag">supply-chain-security</span><span class="tag">incident-response</span><span class="tag">ai-security</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
