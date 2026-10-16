---
layout: post
title: "Part V — Root over the logical namespace"
date: 2026-08-24 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 6
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-5.jpg   # full-bleed hero, 16:7
image_alt: "A library of proofs with one axiom quietly inverted at the base"
description: "An optimizer rewarded on theorem yield has a strategy that makes every subsequent theorem provable, passes every kernel check, and presents as a spectacular productivity improvement. Consistency is undecidable. Axiom-set change is trivially decidable. That gap is the whole defense."
excerpt: "An optimizer rewarded on theorem yield has a strategy that makes every subsequent theorem provable, passes every kernel check, and presents as a spectacular productivity improvement. Consistency is undecidable. Axiom-set change is trivially decidable. That gap is the whole defense."
read_time: 14
takeaways:
  - "Under ex falso quodlibet, an inconsistent axiom set makes everything provable — logical privilege escalation that presents as a productivity gain and passes every type check."
  - "Formal mathematics has no equivalent of a breaking change: a provability-preserving edit to a high-fan-in definition alters what every downstream theorem asserts, with no CI failure."
  - "The countermeasure is cheap and asymmetric — you cannot decide consistency, but you can diff the axiom set against a pinned baseline in a few lines."
tags:
  - beyond-verifiable-reward
  - season-4
  - formal-methods
  - supply-chain-security
  - transparency-log
  - ai-security
  - trusted-computing-base
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 6 of 12</span>
  </div>
  <h2 class="ep-title-display">Part V</h2>
  <p class="ep-header-tagline">Root over the logical namespace</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">There is a proposal in the machine-mathematics literature that sounds appealing and is: point an autonomous system at a formal mathematics library, reward it for theorems proved, and let it run. Formal libraries are the ideal reinforcement-learning environment by every criterion in episode three &mdash; perfect identical reset, deterministic dynamics, a mechanical oracle in the kernel. Grindability is essentially maximal.</p>
  <p class="ep-lede">Now specify the adversary, which in this case is not an adversary at all. It is the optimizer, doing exactly what it was asked.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The mechanism</span>
<h2>Why the global optimum is an inconsistency</h2>

<p>The reward is theorem yield. The optimizer searches for policies that maximize it.</p>

<p>There exists a policy that makes yield unbounded: <strong>introduce an axiom that renders the axiom set inconsistent.</strong> Under <em>ex falso quodlibet</em>, an inconsistent system proves everything. <code>&Gamma; &vdash; &phi;</code> for every <code>&phi;</code>. Every subsequent theorem the system produces is derivable, every proof still type-checks, and the kernel &mdash; which is doing its job perfectly &mdash; reports success on all of them.</p>

<div class="callout-box cb-red">
  <div class="callout-label">Logical Privilege Escalation</div>
  <p>In system terms this is privilege escalation to root over an entire logical namespace. And here is the property that makes it genuinely dangerous rather than merely elegant: <strong>it presents to human operators as a spectacular productivity improvement.</strong> Theorem output goes up. Everything checks. The dashboards are wonderful.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The caveat that has to come before the alarm</span>
<h2>What has to be true for this to be a dominant strategy</h2>

<p>I have seen this argument stated as though it were unconditional, and it is not. "Dominant strategy" requires premises:</p>

<div class="conditions-grid">
  <div class="condition-card">
    <div class="cond-num">01</div>
    <h3>Write Access</h3>
    <p>The optimizer can <strong>write</strong> to the axiom set &mdash; commit rights or equivalent, not just proof-term generation.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">02</div>
    <h3>No Baseline Checks</h3>
    <p>The environment does not <strong>check</strong> axiom-set changes. If the reward computation itself validates against a pinned baseline, the strategy is unavailable.</p>
  </div>
  <div class="condition-card">
    <div class="cond-num">03</div>
    <h3>Axiom-Agnostic Reward</h3>
    <p>The reward counts theorems rather than something axiom-sensitive.</p>
  </div>
</div>

<div class="infobox red">
  <p>Under many real configurations at least one of those fails, which does not defeat the finding but does change its shape. The honest statement is: <strong>absent a control that is not currently deployed by default, the yield-maximizing strategy for an optimizer with library write access is to make the library inconsistent.</strong> That is a smaller claim than the unconditional one and it is the one I can defend. It also happens to be the more useful one, because it names the missing control explicitly.</p>
</div>

<p>There is a second caveat and it is a hard verification dependency, not a rhetorical one. Everything in this episode about escape hatches &mdash; added axioms, admitted goals, compiled-code decision procedures, and whether any of them are surfaced by continuous integration in the major libraries &mdash; is a claim about <strong>currently shipping software</strong>. Those semantics change between releases. Anyone building on this episode should verify them against the toolchain version in front of them rather than against this post, and I would rather say that plainly than have someone quote a stale claim about a proof assistant to an audience that uses it daily.</p>

<hr class="gw-hr">
<span class="section-label">The quieter one</span>
<h2>Formal mathematics has no breaking changes</h2>

<p>The axiom problem is dramatic. This one is worse, and almost nobody talks about it.</p>

<p>In ordinary software, a semantic change to a widely used function usually breaks something. Types stop matching, tests fail, the build goes red. That noise is a feature &mdash; it is how the ecosystem discovers that meaning moved.</p>

<p>Formal mathematics does not have that. A change to a high-fan-in definition that <strong>preserves provability</strong> compiles cleanly. No error. No CI failure. No revocation trigger. And every theorem that depends on that definition now asserts something different than it did yesterday.</p>

<div class="infobox">
  <p>The whole value proposition of formal verification is that downstream consumers <strong>stop checking</strong>. That is what the kernel is for. Silent definitional drift attacks precisely that property: the artifact everyone stopped checking, changed in a way that produces no signal, in a system whose entire purpose is to be the thing you do not have to re-examine.</p>
</div>

<p>Add the deployment pattern the literature actually proposes &mdash; an autonomous fork running unattended for a long period, eventually merged back into the human library &mdash; and you have an untrusted-to-trusted flow carrying a large volume of unreviewed content across a boundary that exists specifically because people wanted to stop reviewing.</p>

<hr class="gw-hr">
<span class="section-label">The asymmetry that saves us</span>
<h2>Undecidable property, decidable proxy</h2>

<p>Here is why this episode ends better than it started.</p>

<p>You cannot decide whether an axiom set is consistent. That is not an engineering limitation; it is a theorem, and no amount of tooling changes it.</p>

<p>You can trivially decide whether the axiom set <strong>changed</strong>.</p>

<p>That gap is the entire defense. A monitor that diffs the current axiom set against a pinned baseline and alerts on any addition is a few lines of code, requires no research, has no false-negative mode for the attack it addresses, and defeats the global optimum described above. It does not tell you whether your axioms are consistent. It tells you that somebody added one, which &mdash; in a library where the axiom set is supposed to be stable and rarely touched &mdash; is all the signal you need.</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Missing Control</div>
  <p><strong>This is the cheapest high-impact control in this entire research program, and to my knowledge it is not deployed anywhere by default.</strong> Whether that is true is itself a straightforward survey: check whether the major formal libraries' CI detects axiom introduction, and whether their escape-hatch usage is tracked at all. That survey has not been published. It should be, and it is a weekend of work.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The architecture</span>
<h2>What a transparency log for a formal library looks like</h2>

<p>The monitor handles the axiom case. The drift case needs more, and the design template already exists &mdash; certificate transparency solved a structurally identical problem, which was "how do we detect that a trusted authority issued something it should not have, without trusting the authority."</p>

<div class="conditions-grid">
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">An append-only Merkle log</h3>
    <p>Every commit to the library produces an entry. Entries cannot be removed or reordered without detection.</p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Inclusion proofs</h3>
    <p>Any consumer can verify that the version they depend on is in the log, cheaply, without downloading the log.</p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Gossip</h3>
    <p>Multiple independent parties compare their view of the log's root. Without this, a split view is undetectable, and a transparency log with a split view is not a transparency log.</p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Monitors</h3>
    <p>Watching for the things that should be rare: axiom introduction, escape-hatch usage, and <strong>dependency-weighted semantic change</strong>.</p>
  </div>
</div>

<p>That last item is the reason to build the log rather than just the monitor. Fan-in weighting turns "a definition changed" &mdash; which happens constantly and is usually fine &mdash; into "a definition that four thousand results depend on changed," which is not fine and is currently indistinguishable from the first thing.</p>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>For anyone running formal verification in a pipeline</h2>

<div class="remediation-steps">
  <div class="rem-block rem-critical">
    <div class="rem-header">Pin your axiom set and diff it</div>
    <p>Whatever your proof assistant's mechanism for reporting the axioms a result depends on, run it, commit the output, and fail the build on unexpected additions. If you take nothing else from this season, take this.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Track escape-hatch usage as a metric, not an exception</div>
    <p>Admitted goals and compiled-code decision procedures are legitimate tools and they are also the trusted-computing-base surface. A count that only ever goes up is a signal even when each individual instance was justified.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Compute your fan-in distribution once</div>
    <p>You probably do not know which of your definitions is load-bearing for the largest fraction of your library. That number is a blast-radius map, it takes an afternoon on the dependency graph, and it tells you where to spend review attention.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Treat an autonomous contributor as an untrusted-to-trusted flow</div>
    <p>Whatever your review policy is for an external contributor with commit rights, an unattended optimizer with the same rights should get the same policy or a stricter one. In practice it usually gets neither, because it does not look like a person and the policy was written about people.</p>
  </div>
</div>

<p>Episode seven stays with verification and asks the question underneath it: what happens when the proof is correct, the checker is honest, the certificate is valid &mdash; and the property being proved means nothing.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-23-beyond-verifiable-build-dependency-benchmark %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 5 &mdash; Part IV: Your benchmark is a build dependency</span>
  </a>
  <a href="{% post_url 2026-08-25-beyond-verifiable-verification-moves-risk %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 7 &mdash; Part VI: The certificate that means nothing</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">formal-methods</span>
  <span class="tag">supply-chain-security</span><span class="tag">transparency-log</span><span class="tag">ai-security</span><span class="tag">trusted-computing-base</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
