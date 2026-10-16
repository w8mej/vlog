---
layout: post
title: "Part II — Testability is attackability"
date: 2026-08-21 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 3
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-2.jpg   # full-bleed hero, 16:7
image_alt: "A pristine deterministic test harness reflected as a fuzzing corpus"
description: "Fifteen years of DevOps maturity — hermetic CI, reproducible builds, containerized staging, deterministic harnesses — made systems easier to optimize against. This is not an attack-surface argument. It is an attack-efficiency one, and it applies inside a perfect perimeter."
excerpt: "Fifteen years of DevOps maturity — hermetic CI, reproducible builds, containerized staging, deterministic harnesses — made systems easier to optimize against. This is not an attack-surface argument. It is an attack-efficiency one, and it applies inside a perfect perimeter."
read_time: 16
key_takeaways:
  - "Grindability is the fraction of return variance attributable to the policy rather than the environment — and it is a property of the environment, not of the party optimizing in it."
  - "Verifiability is necessary but not sufficient. Computer-use tasks are highly verifiable and still automate slowly, because verifiability only removes one of four variance sources."
  - "The symmetry is conditional on equivalent access, and stating that bound makes the claim stronger rather than weaker."
tags:
  - beyond-verifiable-reward
  - season-4
  - grindability
  - ai-security
  - devsecops
  - reinforcement-learning
  - ci-cd
takeaways:
  - "Grindability is the fraction of return variance attributable to the policy rather than the environment — and it is a property of the environment, not of the party optimizing in it."
  - "Verifiability is necessary but not sufficient. Computer-use tasks are highly verifiable and still automate slowly, because verifiability only removes one of four variance sources."
  - "The symmetry is conditional on equivalent access, and stating that bound makes the claim stronger rather than weaker."
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 3 of 12</span>
  </div>
  <h2 class="ep-title-display">Part II</h2>
  <p class="ep-header-tagline">Testability is attackability</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">Start with a puzzle that has been sitting in plain sight.</p>
  <p class="ep-lede">Reinforcement learning has advanced remarkably fast on formal mathematics and on software engineering. It has advanced slowly on computer use &mdash; driving a browser, filling a form, completing a checkout flow. That ordering is backwards on the obvious explanation. Computer use is <em>more</em> verifiable, not less. Did the form submit? Did the order complete? You can check mechanically, cheaply, and unambiguously.</p>
  <p class="ep-lede">So verifiability is not the variable. Something else is doing the work.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The variable</span>
<h2>Grindability, and what it actually measures</h2>

<p>Here is the claim, stated informally first: <strong>an environment is grindable to the degree that the return is a deterministic function of the agent&rsquo;s action sequence.</strong></p>

<p>Why that matters mechanically: policy-gradient methods need roughly <code>&sigma;&sup2;/&epsilon;&sup2;</code> samples, where <code>&sigma;&sup2;</code> is the variance of the advantage estimate. Decompose that variance and it has exactly four sources.</p>

<div style="overflow-x:auto;">
  <table class="gw-table">
    <thead>
      <tr>
        <th>Source of return variance</th>
        <th>What removes it</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>(i) reward stochasticity</td>
        <td>a deterministic verifier</td>
      </tr>
      <tr>
        <td>(ii) initial-state variance</td>
        <td>identical reset</td>
      </tr>
      <tr>
        <td>(iii) transition stochasticity</td>
        <td>deterministic dynamics</td>
      </tr>
      <tr>
        <td><strong>(iv) the policy&rsquo;s own action choices</strong></td>
        <td><strong>nothing &mdash; this is the signal</strong></td>
      </tr>
    </tbody>
  </table>
</div>

<p>A perfectly grindable environment is one where (i) through (iii) vanish and all remaining variance is (iv). That is simultaneously the definition and the reason credit assignment becomes tractable: <strong>when the only thing that varied is what the policy did, the diff is the causal factor.</strong></p>

<p>Now the puzzle dissolves. Computer use fails on (ii) and (iii) &mdash; the site is non-stationary, so reset is not identical and transitions are unstable. Verifiability addresses (i) and only (i). Formal mathematics, by contrast, gets all three for free: a theorem statement is a perfect identical reset, the rules do not drift, and the kernel is a deterministic oracle.</p>

<hr class="gw-hr">
<span class="section-label">A necessary piece of pedantry</span>
<h2>Say what you measured it against</h2>

<p>One repair before this goes any further, because without it the construct does not survive first contact with anyone who has implemented PPO.</p>

<p><code>Var[Â]</code> is <strong>not</strong> a property of an environment. It depends on your advantage estimator, your baseline, your normalization, the policy you evaluated, and your horizon. Two labs measuring &ldquo;the grindability of Lean&rdquo; with different estimators get different numbers, and a quantity that moves when you change your optimizer is not an environmental property.</p>

<p>The fix is the one every serious metric eventually makes: report a <strong>ratio, against a declared reference.</strong> Grindability is the fraction of <code>Var[Â]</code> attributable to sources (i)&ndash;(iii) versus (iv), evaluated at an explicitly stated reference policy class, estimator, and horizon. The ratio is scale-free. The reference is declared. Numbers become comparable across labs, and the ordering &mdash; which is what all the interesting claims depend on &mdash; is the thing to check for stability under reference change.</p>

<div class="infobox">
  <p>If that reads as a footnote, it is not. A construct that is quietly estimator-relative is a construct that will be refuted in one paragraph by the first person who tries to reproduce it.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The uncomfortable part</span>
<h2>Grindability is a property of the environment, not of the party</h2>

<p>Here is the finding, and it is the reason this episode exists.</p>

<p>Determinism, replayability, cheap reset, and a mechanical success oracle are not defender-specific affordances. They are properties of the environment. They are available to <strong>whoever is optimizing in it.</strong></p>

<p>Now list what the industry has spent fifteen years building:</p>

<ul>
  <li>Hermetic CI</li>
  <li>Reproducible builds</li>
  <li>Containerized staging environments that faithfully mirror production</li>
  <li>Deterministic test harnesses</li>
  <li>Infrastructure as code</li>
  <li>Seeded fuzzing corpora</li>
  <li>One-command local reproduction of any failure</li>
</ul>

<p>Every one is a genuine engineering good. I have advocated for all of them, on client engagements, in writing, repeatedly. And every one raises grindability: each hands anyone optimizing against that environment a replayable, deterministic, cheap-reset sandbox with a mechanical success oracle.</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Cost of Fifteen Years of Maturity</div>
  <p><strong>We spent fifteen years making our systems easier to optimize against. The optimizer arrived.</strong></p>
</div>

<hr class="gw-hr">
<span class="section-label">The bound</span>
<h2>Where the symmetry does not hold</h2>

<p>An unbounded version of that claim is refutable in one sentence, so let me refute it myself and then state the version that survives.</p>

<div style="overflow-x:auto;">
  <table class="gw-table">
    <thead>
      <tr>
        <th>Asymmetry</th>
        <th>Who it favours</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>The defender knows the environment specification</td>
        <td class="pass">Defender &mdash; the attacker must first characterize it</td>
      </tr>
      <tr>
        <td>The defender can <em>modify</em> the environment</td>
        <td class="pass">Defender &mdash; mitigations are available to one party only</td>
      </tr>
      <tr>
        <td>The attacker must first obtain access</td>
        <td class="pass">Defender &mdash; this is the whole access-control apparatus</td>
      </tr>
      <tr>
        <td>The defender has white-box access to the policy</td>
        <td class="pass">Defender &mdash; enables detection the attacker cannot evade blindly</td>
      </tr>
    </tbody>
  </table>
</div>

<p>So the honest statement is:</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Bounded Symmetry</div>
  <p><strong>Grindability is symmetric conditional on equivalent access.</strong> The finding is not that attackers and defenders are equally positioned. It is that <strong>once access is obtained, grindability determines exploitation efficiency</strong> &mdash; and defensive investments that raise grindability raise that efficiency without raising the access barrier at all.</p>
</div>

<p>Stating the bound makes the claim stronger. The unbounded version dies to the first reviewer. The bounded one supports every downstream conclusion in this season and is, I think, not refutable.</p>

<hr class="gw-hr">
<span class="section-label">Why this is not an attack-surface argument</span>
<h2>The air-gap test</h2>

<p>This is the distinction that took me longest to get right, and it is what separates grindability from a truism.</p>

<p>Consider a fully internal, air-gapped, perfectly hardened CI environment. No inbound network path. No external exposure. Attack surface: excellent.</p>

<p>That environment is <strong>maximally grindable</strong> for anyone who reaches it.</p>

<p>Nothing about hermetic determinism reduces the value of the environment to an adversary who is inside it. We did not increase attack surface by adopting these practices. We increased attack <em>efficiency</em>, inside the perimeter, for whoever gets there &mdash; which is a different quantity, tracked in a different place, and currently tracked nowhere.</p>

<p>That is why &ldquo;reduce your attack surface&rdquo; does not answer this. Attack surface is about <em>whether</em> someone gets in. Grindability is about <em>what it costs them once they have</em>. Those have been treated as one number for as long as I have been doing this work, and they are not one number.</p>

<hr class="gw-hr">
<span class="section-label">What follows from it</span>
<h2>A revealed-preference prediction, and how to check it</h2>

<p>If grindability governs automated search efficiency, then automated attacker effort should concentrate on grindable targets &mdash; package ecosystems, CI systems, API surfaces, anything with a free tier and a mechanical error signal &mdash; and avoid bespoke, stateful, non-reproducible enterprise systems.</p>

<p>There is an obvious way to test that and it is wrong. Correlating a grindability score against observed automated-attack incidence from public incident data measures your own instrument, because <strong>detection is easier in grindable environments too.</strong> Deterministic, instrumented, reproducible systems produce better telemetry. You would be measuring the correlation between grindability and observability and calling it a finding.</p>

<p>The cleaner proxy is revealed preference on the attacker&rsquo;s side: <strong>count the publicly available automated tools targeting each class.</strong> Practitioners build automation where automation works. That measure does not depend on detection. It has its own bias &mdash; toward publicly shared tooling, away from private capability &mdash; and that has to be said out loud rather than glossed.</p>

<div class="infobox red">
  <p><strong>Status: this is a prediction with a proposed measurement, not a result.</strong> It has not been run. It is cheap, it uses public data, and it would either support or embarrass the central claim of this episode.</p>
</div>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>Three things you can do this week</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">Score your own environments</div>
    <p>Not with a research instrument &mdash; with four questions. Is reset identical? Are transitions deterministic? Is there a mechanical success oracle? Is reproduction cheap? Anything scoring four out of four is a maximally efficient search environment for whoever holds access to it, and should be governed on that basis rather than on its exposure.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Separate the two budgets</div>
    <p>Your attack-surface work and your attack-efficiency work are currently one line item, and the second one is empty. Grindability-raising investments should carry an entry in the risk register describing what they cost on the other side. Not a reason to stop doing them &mdash; a reason to know.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Put the access barrier where the grindability is highest</div>
    <p>The bound in the previous section is also the mitigation. Symmetry is conditional on access, so the control that matters most is the one on the most grindable environment you own. For most organizations that is CI, and for most organizations CI has the weakest access story of anything with production reach.</p>
  </div>
</div>

<p>Next episode takes this one step further and asks a narrower question with a sharper answer: what happens when the reward function itself contains a term that correlates with resources on the other side of the isolation boundary.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-21-beyond-verifiable-rewards-stack-of-proofs %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 2 &mdash; Part I: The one asymmetry underneath all of it</span>
  </a>
  <a href="{% post_url 2026-08-22-beyond-verifiable-gradient-field-bending-at-wall %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 4 &mdash; Part III: The reward that points at the wall</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">grindability</span>
  <span class="tag">ai-security</span><span class="tag">devsecops</span><span class="tag">reinforcement-learning</span><span class="tag">ci-cd</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
