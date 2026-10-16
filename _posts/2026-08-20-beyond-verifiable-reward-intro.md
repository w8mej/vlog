---
layout: post
title: "Introduction — Every capability you want, an adversary wants more"
date: 2026-08-20 00:00:00 -0800
series: beyond-verifiable-reward
series_name: "Beyond Verifiable Reward"
image: /images/2026/beyond-verifiable-reward-intro.jpg   # full-bleed hero, 16:7
image_alt: "A single object casting two different shadows on opposing walls"
takeaways:
  - "Capability is not indexed by intent — the same learned representations and search procedures serve the beneficial and the adversarial reading."
  - "A capability proposal with no threat model does not produce a neutral design; it produces a design pattern whose first competent implementation is an attack platform."
  - "Every architectural proposal can be assigned a price of benignity — the performance it gives up when you specify the adversary it was never specified against."
season: 4
episode: 1
episode_total: 12
categories: ["Security"]
tags: ["beyond-verifiable-reward", "season-4", "ai-security", "rlvr", "agentic-security", "threat-modeling", "dual-use"]
excerpt: "The literature on machine mathematics and verifiable reward was written without an adversary in the room. The systems that instantiate it are containerized, credentialed, and network-attached. This is the reading that literature never got."
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 1 of 12</span>
  </div>
  <h2 class="ep-title-display">Introduction</h2>
  <p class="ep-header-tagline">Every capability you want, an adversary wants more</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">There is a body of work — large, serious, and growing fast — on what happens when machines start doing mathematics. Not arithmetic. Mathematics: generating conjectures, producing definitions worth building on, searching proof spaces, learning from environments where success is mechanically checkable. It is some of the most interesting technical writing being produced right now.</p>
  <p class="ep-lede">It was written almost entirely without an adversary in the room.</p>
  <p class="ep-lede">That is not a criticism of the people doing it. It is a description of the frame. The work reasons about <em>idealized</em> systems — proofs, axioms, abstractions, search procedures, elegance — and it reasons about them well. But the systems that will actually instantiate those ideas are containerized, credentialed, network-attached, multi-tenant, and adversarially exposed. Between the idea and the deployment sits an entire discipline that the idea's authors were not writing for.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The translation</span>
<h2>Four mappings that do most of the work</h2>

<p>Read a capability paper with a security engineer's eye and the same four substitutions keep occurring. They are worth stating plainly, because once you have them, most of this season is derivable.</p>

<div class="conditions-grid">
  <div class="condition-card">
    <div class="cond-num">01</div>
    <h3>Proofs, axioms, definitions</h3>
    <p><strong>What it is once it ships:</strong> Hardcoded system invariants and trust assumptions. The trusted computing base.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">02</div>
    <h3>Complexity, undecidability, unbounded search</h3>
    <p><strong>What it is once it ships:</strong> Denial of service, verification exhaustion, checker fail-open.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">03</div>
    <h3>State-space expansion, abstraction shifts</h3>
    <p><strong>What it is once it ships:</strong> Side channels, state poisoning, sandbox escape.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">04</div>
    <h3>Theoretical equivalence, representational choice</h3>
    <p><strong>What it is once it ships:</strong> Translation-layer friction, parser differentials, confused deputy.</p>
  </div>
</div>

<div class="infobox">
  <p>A note on what this table is and is not. It is a <strong>mapping schema</strong> — a disciplined way of asking the second question about a first-order claim. It is not a soundness theorem. There is a version of this framing dressed in abstract-interpretation vocabulary, with a Galois connection and a claim of over-approximation, and I have written that version. It does not survive contact with a formal-methods reviewer, for a reason worth stating out loud in episode one: soundness of an abstraction is a theorem <em>relative to a concrete semantics</em>, and the concrete domain here is prose. Claiming otherwise is decoration. What the schema does earn is a discipline. Apply it consistently and the same governing observation falls out every time.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The governing observation</span>
<h2>Capability is not indexed by intent</h2>

<p>Cross-domain bridging is aggregation attack. Context refresh is safety-state reset. Systematic entropy injection is best-of-N jailbreaking. Unbounded autonomous exploration is unmonitored dwell time. Testability is attackability.</p>
<p>None of those are wordplay. Each is the same computational object with the objective function relabelled. The mechanism does not know which reading you intended, because the substrate is objective-agnostic: capability decomposes into learned representations and search over those representations, and neither is indexed by user intent.</p>

<div class="callout-box cb-red">
  <div class="callout-label">The No-Free-Lunch Result for Representational Safety</div>
  <p>This has a sharp consequence that is easy to state and uncomfortable to sit with. If the features that implement cross-domain analogy substantially overlap with the features that implement dangerous knowledge composition, then <strong>there is no feature-level intervention that removes the attack capability without removing the mathematical capability.</strong></p>
</div>

<p>I want to be careful here, because this is the first place in the season where an interesting claim outruns its evidence. That overlap is measurable — sparse autoencoders make it measurable — and as far as I can determine, nobody has measured it. Until someone does, it is a conjecture with a good motivation and a clear experiment, and I will keep calling it that. Episodes in this season will do this repeatedly: mark the line between what is shown and what is argued. If that feels pedantic, wait until episode nine, where the reason for it becomes the subject.</p>

<hr class="gw-hr">
<span class="section-label">The structural problem</span>
<h2>What a missing threat model actually costs</h2>

<p>Here is the part that took me longest to articulate, and it is the reason the season exists.</p>

<p>Every architectural proposal in the capability literature is a solution to an optimization problem specified against <em>nature</em>. Nature is a stochastic, indifferent environment that produces errors, inefficiency, and wasted effort. Nature does not have write access to your environment, does not read your reward specification, and is not trying.</p>

<p>Specify the same proposal against an adversary and the optimum moves. Sometimes a little. Sometimes it does not exist.</p>

<p>That gap is a quantity, and you can put a name and a number on it: <strong>the price of benignity</strong> — the performance an architecture gives up when you replace nature with an adversary drawn from a bounded set. The bound matters. Left unbounded, the quantity is infinite for exactly the proposals that are most interesting, and an instrument that returns infinity for the interesting cases is not an instrument. Bound the adversary to a divergence ball around nature and the useful statistic falls out immediately: <strong>how far you have to move from nature before the proposal stops working.</strong></p>

<p>Some architectures degrade gracefully. Unbounded autonomous exploration of a formal library — the flagship proposal in this literature — does not degrade at all until it collapses, because the relevant adversary has write access and a decade of unmonitored time, and nothing in the design bounds either.</p>

<div class="infobox red">
  <p>That is an admissibility criterion, not a complaint: <strong>an architecture is admissible only if its adversary set is bounded by construction.</strong> Most of the proposals in this literature have never been asked.</p>
</div>

<hr class="gw-hr">
<span class="section-label">Where this season goes</span>
<h2>Twelve episodes, four arcs</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">Arc 1: The spine (Ep 2)</div>
    <p>One asymmetry sits underneath everything else, and it is not about AI at all. Offense is an existential claim that carries its own witness. Defense is a universal claim over a model you cannot verify from inside the system.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Arc 2: The two constructs (Eps 3–5)</div>
    <p>Grindability — why the practices that made your systems testable made them optimizable against, and why that is an efficiency argument rather than an exposure argument. Escape-adjacency — what happens when a reward term correlates with resources on the other side of an isolation boundary. And the supply-chain consequence: under verifiable-reward training, your benchmark is a build dependency that nobody signs.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Arc 3: The failure surfaces (Eps 6–11)</div>
    <p>Formal libraries and logical privilege escalation. Certificates that are valid and meaningless. Defence stacks whose layers are the same layer. The explanation layer as an oversight bypass. Dwell time measured against institutional memory. And the one that I think matters most in ten years: assurance as an accumulated quantity that can go down.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Arc 4: The accounting (Ep 12)</div>
    <p>The finale: the class of trade-offs that are not trade-offs, because the good and the exposure are one property under two descriptions.</p>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">Before we start</span>
<h2>Three commitments for the season</h2>

<div class="detection-grid">
  <div class="detection-card dc-present">
    <div class="dc-header">Commitment 01: Predictions labeled</div>
    <div class="dc-item">
      <div class="dc-detail">Where a claim is a prediction rather than an observation, it will be labelled a prediction. There are several, and the labels will not be quietly dropped in later episodes.</div>
    </div>
  </div>
  <div class="detection-card dc-present">
    <div class="dc-header">Commitment 02: No staged attacks</div>
    <div class="dc-item">
      <div class="dc-detail">This season describes structural exposures — the property that makes something possible, and one worked instantiation sufficient to show the threat is real. It does not publish reusable methodology, calibration, or targeting. Where I have withheld something, I will say so rather than pretend the gap is not there.</div>
    </div>
  </div>
  <div class="detection-card dc-present">
    <div class="dc-header">Commitment 03: Dual-use ledger</div>
    <div class="dc-item">
      <div class="dc-detail">The season ships its own dual-use ledger in the finale. A body of work that documents this class of risk and does not account for its own contribution to it is not serious about the subject.</div>
    </div>
  </div>
</div>

<p>The literature this season reads is good work. The gap is not that its authors were careless. The gap is that they were solving a different problem, in a frame where the adversary is not a term in the equation — and the moment those ideas leave the whiteboard, the adversary is the only term that was left out.</p>


<div class="ep-nav-footer">
  <a href="/series/beyond-verifiable-reward/" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Series Index</span>
    <span class="ep-nav-ep-title">Beyond Verifiable Reward</span>
  </a>
  <a href="{% post_url 2026-08-21-beyond-verifiable-rewards-stack-of-proofs %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 2 &mdash; Part I: The one asymmetry underneath all of it</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">ai-security</span>
  <span class="tag">rlvr</span><span class="tag">agentic-security</span><span class="tag">threat-modeling</span><span class="tag">dual-use</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
