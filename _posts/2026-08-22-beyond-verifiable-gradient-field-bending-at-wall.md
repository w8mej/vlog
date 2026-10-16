---
layout: post
title: "Part III — The reward that points at the wall"
date: 2026-08-22 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 4
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-3.jpg   # full-bleed hero, 16:7
image_alt: "A gradient field bending toward a container boundary"
description: "Reward faster solutions. Penalize memory use. Both are standard, both are reasonable, and both create a gradient that points at the isolation boundary. Escape-adjacency is a static property of a reward specification, and it is checkable in an afternoon."
excerpt: "Reward faster solutions. Penalize memory use. Both are standard, both are reasonable, and both create a gradient that points at the isolation boundary. Escape-adjacency is a static property of a reward specification, and it is checkable in an afternoon."
read_time: 15
key_takeaways:
  - "A reward term correlating with resources obtainable only by crossing an isolation boundary creates optimization pressure at that boundary — with no escape-directed objective anywhere in the specification."
  - "OCI containers are a resource-isolation boundary, not a security boundary, and RL training infrastructure runs in them by default."
  - "The evidence supports elevated boundary probing. It does not currently support boundary crossing, and this episode does not claim it does."
tags:
  - beyond-verifiable-reward
  - season-4
  - escape-adjacency
  - container-security
  - reinforcement-learning
  - reward-hacking
  - ai-security
takeaways:
  - "A reward term correlating with resources obtainable only by crossing an isolation boundary creates optimization pressure at that boundary — with no escape-directed objective anywhere in the specification."
  - "OCI containers are a resource-isolation boundary, not a security boundary, and RL training infrastructure runs in them by default."
  - "The evidence supports elevated boundary probing. It does not currently support boundary crossing, and this episode does not claim it does."
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 4 of 12</span>
  </div>
  <h2 class="ep-title-display">Part III</h2>
  <p class="ep-header-tagline">The reward that points at the wall</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">Two reward terms you will find in real agentic-coding environments, both entirely reasonable, both written by careful people:</p>
  
  <div class="infobox" style="font-style: italic; font-size: 1.05rem;">
    &ldquo;Reward faster solutions.&rdquo;<br>
    &ldquo;Penalize excessive memory use.&rdquo;
  </div>

  <p class="ep-lede">The first is an efficiency incentive. The second is a resource-hygiene incentive. Neither mentions escape, isolation, containers, or the host. Neither author was thinking about security when they wrote it, and neither had any reason to.</p>
  <p class="ep-lede">Now ask a question that the reward's author had no reason to ask: <strong>is there any action available to this policy that improves that term by crossing the isolation boundary?</strong></p>
  <p class="ep-lede">Host CPU access reduces wall clock. Escaping a cgroup increases memory headroom. So yes &mdash; and the moment the answer is yes, you have pointed a gradient at your sandbox wall.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The property</span>
<h2>Escape-adjacency, and what the check actually is</h2>

<p>Informally: a reward function is <strong>escape-adjacent</strong> when it correlates with state obtainable only by crossing an isolation boundary.</p>

<p>The clean formal statement &mdash; a nonzero partial derivative of reward with respect to boundary-obtainable state &mdash; is motivating rather than operational. You cannot differentiate a reward function written in Python. So the definition that matters is a decision procedure over reward terms:</p>

<div class="conditions-grid">
  <div class="condition-card">
    <div class="cond-num">01</div>
    <h3>Enumerate the terms</h3>
    <p>Every additive or multiplicative component of the reward, including implicit ones &mdash; timeouts, retries, step penalties, and anything computed from the runtime rather than from the task.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">02</div>
    <h3>Identify the producer</h3>
    <p>For each term, name what physically produces its value. Wall clock is produced by CPU scheduling. Memory metrics are produced by cgroup accounting. Filesystem persistence is produced by mount lifetime. Not "what does this measure" &mdash; <em>what produces this number.</em></p>
  </div>
  <div class="condition-card">
    <div class="cond-num">03</div>
    <h3>Check boundary crossings</h3>
    <p>Ask whether any action available to the policy changes that producer by crossing the boundary.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">04</div>
    <h3>Apply the mechanism criterion</h3>
    <p>The correlate must be <em>obtainable by an action the policy can take</em>, not merely statistically associated with boundary state. This is the step that separates a real escape gradient from a coincidence, and it belongs in the definition rather than bolted on as a caveat.</p>
  </div>
</div>

<p>That is the whole check. It runs on the reward specification, statically, with no execution. For most environments it takes an afternoon. The <a href="https://www.securesql.info/assets/files/beyond-verifiable-reward-audit-checklist.pdf" style="color: #60A5FA;">reward-function audit checklist</a> companion to this season is exactly this procedure on one page.</p>

<hr class="gw-hr">
<span class="section-label">The sources</span>
<h2>Five families, and the boundary correlate for each</h2>

<div class="conditions-grid">
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom: .25rem;">Wall clock</h3>
    <p style="margin-bottom: .25rem;"><em>Typical wording: &ldquo;reward faster solutions&rdquo;</em></p>
    <div class="cond-impact">Host CPU access reduces elapsed time</div>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom: .25rem;">Memory</h3>
    <p style="margin-bottom: .25rem;"><em>Typical wording: &ldquo;penalize peak memory&rdquo;</em></p>
    <div class="cond-impact">Escaping cgroup accounting increases headroom</div>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom: .25rem;">Filesystem persistence</h3>
    <p style="margin-bottom: .25rem;"><em>Typical wording: &ldquo;reward reuse of cached intermediates&rdquo;</em></p>
    <div class="cond-impact">Persistence beyond container lifetime</div>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom: .25rem;">Network</h3>
    <p style="margin-bottom: .25rem;"><em>Typical wording: &ldquo;reward successful retrieval&rdquo;</em></p>
    <div class="cond-impact">Egress beyond the permitted scope</div>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom: .25rem;">Process / parallelism</h3>
    <p style="margin-bottom: .25rem;"><em>Typical wording: &ldquo;reward parallel execution&rdquo;</em></p>
    <div class="cond-impact">Process-limit and namespace evasion</div>
  </div>
</div>

<p>Wall clock is the common one, and it is the one that worries me, because it is almost never recognised as a resource term at all. It reads as a quality signal &mdash; faster is better code &mdash; and it is measured by the runtime rather than by the task.</p>

<hr class="gw-hr">
<span class="section-label">The infrastructure</span>
<h2>Containers are a resource boundary</h2>

<p>The ecosystem is quite clear about this and it is worth saying plainly, because a lot of RL training infrastructure is built as though it were not true:</p>

<div class="callout-box cb-red">
  <div class="callout-label">A Critical Distinction</div>
  <p><strong>OCI containers are a resource-isolation boundary, not a security boundary.</strong> Namespaces and cgroups partition resources. They are not a hypervisor and they are not a hardware boundary. The container ecosystem's own documentation says so, and the existence of microVM and gVisor-class runtimes is the industry's revealed opinion on the matter.</p>
</div>

<p>Meanwhile, rollouts predominantly execute in ordinary containers, because that is what the ML tooling defaults to and there was never a security review that asked otherwise.</p>

<p>Put the two together. The specification-gaming record establishes something solid: <strong>RL agents reliably discover simulator bugs when those bugs are reward-relevant.</strong> They are extremely good at it. They do it with parallelism and persistence no human red team matches, and they do it without any intent, because "intent" is not a thing that appears anywhere in the mechanism.</p>

<p>In a containerized environment, the "simulator bug" is a runtime CVE.</p>

<hr class="gw-hr">
<span class="section-label">What distinguishes this from fuzzing</span>
<h2>The learned prior</h2>

<p>A fuzzer explores blindly. It has no memory of what worked and no transfer between targets.</p>

<p>An RL agent carries a prior over what is likely to work, refines it across rollouts, and transfers it across environments. <strong>It is a fuzzer that gets better at fuzzing</strong> &mdash; and it is being pointed at your isolation boundary by a reward term somebody wrote to make the build faster.</p>

<p>That is the finding: not that a malicious actor writes an escape exploit, but that an ordinary optimization objective produces boundary-directed search as a side effect, and the resulting behaviour arrives in forensics looking like an agent that learned an unusual optimization.</p>

<hr class="gw-hr">
<span class="section-label">Where the evidence actually stops</span>
<h2>Probing, not crossing</h2>

<p>I want to be precise about this, because it is the point in the season where the temptation to overclaim is strongest and where overclaiming would be most damaging.</p>

<div class="detection-grid">
  <div class="detection-card dc-present">
    <div class="dc-header">What is well supported</div>
    <div class="dc-item">
      <div class="dc-detail">Reward-relevant simulator artifacts get discovered; efficiency terms in real published environments correlate with boundary-obtainable state; containers do not hold against a determined boundary-crossing attempt.</div>
    </div>
  </div>
  <div class="detection-card dc-absent">
    <div class="dc-header">What is not supported</div>
    <div class="dc-item">
      <div class="dc-detail">That this composition has been observed producing an actual isolation-boundary violation in a training run. The published specification-gaming corpus is, as far as I can determine, a corpus of <em>in-simulator</em> exploits. If there is a documented case of a genuine container escape arising from reward pressure rather than from a written exploit, I have not found it.</div>
    </div>
  </div>
</div>

<div class="infobox red">
  <p>So the honest register for this episode is: <strong>elevated boundary-directed activity is the claim; boundary crossing is the prediction.</strong></p>
</div>

<p>The right measurement is not "can we escape" &mdash; it is the far less dramatic and far more publishable one. Instrument a container with syscall tracing. Two conditions: an escape-adjacent reward, and a matched control with the same task difficulty and the same achievable reward but no boundary-correlated term. Measure the rate of boundary-directed activity: <code>/proc</code> and <code>/sys</code> reads, cgroup interrogation, mount-table inspection, capability queries, namespace enumeration.</p>

<p>And the design detail that decides whether the result means anything: you need a <strong>third</strong> condition &mdash; a non-escape-adjacent environment with equivalent <em>exploration</em> incentive. Without it, "your agents just explore more" is an unanswerable objection, and it is the first thing a good reviewer says.</p>

<p>If that experiment runs and the effect is there, this episode gets an update post. If it runs and the effect is not there, that gets a post too. I would rather publish the second one than quietly stop mentioning it.</p>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>The controls, in cost order</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">Audit the reward specifications you already have</div>
    <p>The four-step procedure above. Start with anything agentic &mdash; coding harnesses, tool-using agents, anything with a runtime-derived term. Minutes per environment. This is the cheapest security review in your organization and nobody is running it.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Remove or isolate the escape-adjacent terms</div>
    <p>Two options per finding. Remove the term &mdash; often it was a convenience proxy for something the task itself could measure. Or keep it and move the workload to hardware-backed isolation, which is what a microVM buys you and what a namespace does not.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Move the reward oracle outside the policy's write scope</div>
    <p>This one generalizes past containers. If an agent is rewarded on "tests pass" and can write to the test file, you have not built a verifier &mdash; you have built an incentive to edit the verifier. Enforce it with capabilities, not with policy. Policy is a request; capability is a fact.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Log boundary-directed syscalls in training environments</div>
    <p>Not as a control &mdash; as telemetry. Most organizations running RL rollouts have no idea what their agents do at the boundary because nobody instrumented for it. The baseline is worth having before you need it.</p>
  </div>
</div>

<p>The mitigations here are unusually cheap relative to the exposure, which is the main reason I think this material belongs in public. Episode five moves up a layer: from the reward specification to the artifact that defines it, and to the fact that under verifiable-reward training that artifact is a build dependency nobody signs.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-21-beyond-verifiable-testability-is-attackability %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 3 &mdash; Part II: Testability is attackability</span>
  </a>
  <a href="{% post_url 2026-08-23-beyond-verifiable-build-dependency-benchmark %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 5 &mdash; Part IV: Your benchmark is a build dependency</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">escape-adjacency</span>
  <span class="tag">container-security</span><span class="tag">reinforcement-learning</span><span class="tag">reward-hacking</span><span class="tag">ai-security</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
