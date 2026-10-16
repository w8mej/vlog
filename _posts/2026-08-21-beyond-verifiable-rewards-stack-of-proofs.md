---
layout: post
title: "Part I — The one asymmetry underneath all of it"
date: 2026-08-21 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 2
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-1.jpg   # full-bleed hero, 16:7
image_alt: "A single counterexample outweighing a stack of proofs on a balance"
description: "An exploit is an existential claim that carries its own witness. A security property is a universal claim over a model you cannot verify from inside the system. Uniform capability acceleration does not scale those two things equally."
excerpt: "An exploit is an existential claim that carries its own witness. A security property is a universal claim over a model you cannot verify from inside the system. Uniform capability acceleration does not scale those two things equally."
read_time: 12
key_takeaways:
  - "Offense needs one witness against the real system; defense needs a proof against a model of it, and the model is not verifiable from inside."
  - "Measurement, training, and authorization all require a witness-bearing predicate — which is why the same capabilities resist all three for one structural reason."
  - "Uniform capability acceleration is not neutral: it scales existential search faster than it scales the construction of adversary models."
tags:
  - beyond-verifiable-reward
  - season-4
  - ai-security
  - formal-methods
  - threat-modeling
  - offense-defense-balance
takeaways:
  - "Offense needs one witness against the real system; defense needs a proof against a model of it, and the model is not verifiable from inside."
  - "Measurement, training, and authorization all require a witness-bearing predicate — which is why the same capabilities resist all three for one structural reason."
  - "Uniform capability acceleration is not neutral: it scales existential search faster than it scales the construction of adversary models."
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 2 of 12</span>
  </div>
  <h2 class="ep-title-display">Part I</h2>
  <p class="ep-header-tagline">The one asymmetry underneath all of it</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">If you only read one episode of this season, read this one. Almost everything that follows is a consequence.</p>
  <p class="ep-lede">An exploit is an existential claim. <em>There exists an input that produces this behaviour.</em> It comes with its own certificate: run it. The witness is the proof, verification is execution, and nobody has to trust the person who found it.</p>
  <p class="ep-lede">A security property is universally quantified. <em>For all inputs, this behaviour does not occur.</em> There is no finite object you can hand someone that settles it. You cannot run a <code>&forall;</code>.</p>
  <p class="ep-lede">That is the asymmetry. It is old &mdash; older than any of the technology in this season &mdash; and it explains a surprising amount.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The correction</span>
<h2>The version of this claim that is too strong</h2>

<p>You will find people, including me in earlier drafts, stating it like this: <em>security properties carry no witness and cannot be verified.</em></p>

<p>That is false, and it is false in a way that a formal-methods reviewer will produce in one line. Non-interference is a <code>&forall;</code>-property with a decision procedure on finite systems. Information-flow type systems establish <code>&forall;</code>-properties by construction. Cryptographic reduction proofs establish <code>&forall;</code>-properties under stated assumptions. seL4 exists. Constant-time-code verification exists. If universally quantified security properties genuinely admitted no verification, an entire productive discipline would be a hallucination.</p>

<p>So here is the bounded version, which is both true and sharper:</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Bounded Asymmetry</div>
  <p><strong>Security properties are universally quantified over an adversary model. Within a stated model they can be proved. The model itself is not verifiable from inside the system.</strong></p>
</div>

<p>The asymmetry survives the correction. It just relocates, and it relocates to a more interesting place. Offense needs one witness <strong>against the real system</strong>. Defense needs a proof <strong>against a model of it</strong>. The residual risk does not live in the proof. It lives in the gap between the model and the system &mdash; which is, more or less, a definition of the job.</p>

<p>That relocation is the whole of security engineering. Every attack you have ever admired was, structurally, a demonstration that the model omitted something. Rowhammer said the memory model omitted physics. Spectre said the ISA model omitted microarchitecture. Every parser differential says the specification model omitted a second parser.</p>

<hr class="gw-hr">
<span class="section-label">The consequence</span>
<h2>Why three different problems are one problem</h2>

<p>Take three things people complain about separately.</p>

<div class="conditions-grid">
  <div class="condition-card">
    <div class="cond-num">01</div>
    <h3>Measurement</h3>
    <p>We cannot benchmark the capabilities that matter most &mdash; conjecture quality, definitional fecundity, explanatory power. Every proposed metric turns out to score something adjacent.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">02</div>
    <h3>Training</h3>
    <p>We cannot optimize for them either. Reinforcement learning from verifiable reward works spectacularly where the reward is a cheap mechanical check, and stalls where it is not.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">03</div>
    <h3>Authorization</h3>
    <p>We cannot write policy about them. A policy engine needs a predicate it can evaluate on a request, and "is this agent doing something conceptually dangerous" is not one.</p>
  </div>
</div>

<p>These are usually treated as three fields with three literatures. They are one structural fact seen from three angles: <strong>each requires a computable, witness-bearing predicate evaluable within budget.</strong> The capabilities in question are <code>&forall;</code>-shaped over infinite futures. They carry no witness. So they resist measurement, training, and authorization &mdash; for exactly one reason, not three.</p>

<div class="infobox">
  <p>That unification is worth more than it looks. It means a breakthrough in any one of them is a breakthrough in the others, and it means proposals that solve one by assuming the others are solved are circular. A meta-verifier that adjudicates conceptual value is not a new control; it is the same missing predicate with a model wrapped around it.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The bias</span>
<h2>Acceleration is not neutral</h2>

<p>Here is where the asymmetry stops being philosophy.</p>

<p>Suppose capability improves uniformly &mdash; the same lift for everyone, attacker and defender alike. That sounds balanced. It is not.</p>

<p>The attacker's task is existential search under a cheap, mechanical oracle. Did the exploit fire? The program crashed or it did not. Constraint solving, symbolic execution, fuzzing an execution path, searching a gadget space &mdash; all of these have exactly the structure that automated search is good at, and all of them self-verify on success.</p>

<p>The defender's task splits in two. Proving a property within a model <em>is</em> automatable, and that side genuinely accelerates. But <strong>constructing the model</strong> &mdash; deciding what the adversary can read, write, influence, and observe; noticing that memory has physics; noticing that there are two parsers &mdash; is not existential search under a cheap oracle. It is the thing that has no oracle at all.</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Automation Split</div>
  <p>So uniform acceleration scales <code>&exist;</code>-search fast, scales in-model verification fast, and leaves model construction where it was. The offense-defense balance shifts not because attackers get better tools but because <strong>the defender's bottleneck was never in the part that got faster.</strong></p>
</div>

<p>You can predict from this which defensive work will and will not benefit from automation, and the prediction is checkable. Verification, fuzzing your own code, differential testing, invariant inference &mdash; these accelerate. Threat modelling, trust-boundary identification, and the judgement about what your assumptions omit do not, and if anything they get harder as systems get more complex faster than your model of them does.</p>

<hr class="gw-hr">
<span class="section-label">The tell</span>
<h2>Assurance deflation</h2>

<p>There is a name for the resulting condition and it is worth adopting: <strong>assurance deflation.</strong> Deployed capability scales quickly. Formal assurance scales slowly. Under competitive pressure organizations deploy the capability anyway, and the objective security margin shrinks relative to the capability even though nothing visibly breaks.</p>

<p>Nothing visibly breaks is the point. Assurance deflation has no incident, no alert, and no line in the risk register. It shows up as an organization whose documented control set is unchanged while the thing being controlled has moved two orders of magnitude. The controls are still there. They are just controlling a smaller and smaller fraction of what the system now does.</p>

<p>Episode eight is about a specific, quantifiable instance of this: defence stacks whose documented layer count has grown while their effective layer count has not.</p>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>What to do with this</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">Write down your adversary model and date it</div>
    <p>Not the threat model for a system &mdash; the adversary model itself: what can this party read, write, influence, and observe? Most organizations have never written it down, which means it cannot be reviewed, cannot be versioned, and cannot be found to be wrong.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Audit the model, not the controls</div>
    <p>Control audits are <code>&forall;</code>-proofs within a model, and they will pass. The interesting question is which assumption in the model is doing the most work and what happens when it is false. Rank your assumptions by blast radius on failure. That list is usually short and usually surprising.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Stop treating automation lift as symmetric in planning</div>
    <p>When you evaluate a security tool that promises capability improvement, ask which side of the split it lands on. If it accelerates in-model verification, budget for it &mdash; it works. If it claims to accelerate model construction, ask how, specifically, because that is the claim that is almost always wrong.</p>
  </div>
</div>

<p>The rest of the season is instances. Grindability, escape-adjacency, vacuous certificates, correlated controls, illusory comprehension &mdash; each is a different place where the model omitted something and the omission was the whole story.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-20-beyond-verifiable-reward-intro %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 1 &mdash; Introduction: Every capability you want, an adversary wants more</span>
  </a>
  <a href="{% post_url 2026-08-21-beyond-verifiable-testability-is-attackability %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 3 &mdash; Part II: Testability is attackability</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">ai-security</span>
  <span class="tag">formal-methods</span><span class="tag">threat-modeling</span><span class="tag">offense-defense-balance</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
