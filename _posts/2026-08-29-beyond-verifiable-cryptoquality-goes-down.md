---
layout: post
title: "Part X — The assurance ledger"
date: 2026-08-29 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 11
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-10.jpg   # full-bleed hero, 16:7
image_alt: "A ledger with one column growing and the other unattended"
description: "The practical security of a cryptographic primitive is not a theorem. It is a function of accumulated public expert-years of failed cryptanalysis. That makes it a quantity — and unlike a theorem, a quantity can go down."
excerpt: "The practical security of a cryptographic primitive is not a theorem. It is a function of accumulated public expert-years of failed cryptanalysis. That makes it a quantity — and unlike a theorem, a quantity can go down."
read_time: 15
takeaways:
  - "Primitive assurance is attention-dependent: it rests on how many qualified people attacked a construction and failed, which is a number nobody currently reports."
  - "Automated capability does not lift both sides of that ledger equally, because cryptanalysis is existential search with a cheap oracle and security proof is not."
  - "This is a structural exposure argument, not a documented campaign. The measurements that would move it from inference to evidence are archival, public, and unrun."
tags:
  - beyond-verifiable-reward
  - season-4
  - cryptography
  - post-quantum
  - assurance
  - science-policy
  - ai-security
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 11 of 12</span>
  </div>
  <h2 class="ep-title-display">Part X</h2>
  <p class="ep-header-tagline">The assurance ledger</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede"><strong>Epistemic status, stated first rather than last.</strong> This episode is a structural argument about a mechanism. It is not a documented campaign, and I am not asserting that anyone is executing it. The individual claims &mdash; that primitive assurance is attention-dependent, that the qualified analyst pool for some assumption families is small, that cryptanalysis is more automatable than security proof &mdash; are each defensible on their own. The composition of them into a single exposure is an inference. I am publishing it because the measurements that would settle it are cheap, public, and unrun, and because an exposure that nobody has named cannot be managed.</p>
  <p class="ep-lede">I am putting that paragraph at the top because in an earlier draft it was at the bottom, after the argument, and episode nine is about exactly what happens to a qualifier that arrives downstream of the claim it qualifies.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The thing we do not say out loud</span>
<h2>Assurance is a quantity, not a theorem</h2>

<p>Ask why you trust AES.</p>

<p>The honest answer is not "because it has been proven secure." No deployed symmetric primitive has been proven secure in any absolute sense, and no one working in the field thinks otherwise. The honest answer is:</p>

<div class="callout-box cb-red" style="text-align: center;">
  <p><strong>A large number of highly qualified people attacked it, in public, for a long time, and failed.</strong></p>
</div>

<p>That is the actual basis. It is a good basis &mdash; it is arguably the <em>only</em> basis available for the primitives we depend on &mdash; but it is worth noticing what kind of thing it is. It is not a mathematical fact about the construction. It is an empirical fact about <strong>how much expert attention has been spent trying to break it and how that attention was distributed.</strong></p>

<p>Which means primitive assurance is a <em>quantity</em>. Something closer to <code>P(no successful attack | N expert-years of public cryptanalysis)</code> than to a theorem. The structured competitions &mdash; AES, SHA-3, the post-quantum process &mdash; are the mechanism by which we accumulate that quantity, and the competition records are, in effect, the receipts.</p>

<div class="infobox red">
  <p>And here is the thing about quantities that is not true about theorems. <strong>Theorems do not decay. Quantities can go down.</strong></p>
</div>

<hr class="gw-hr">
<span class="section-label">The ledger</span>
<h2>Two columns, moving independently</h2>

<p>Split the quantity into the two terms that actually determine it.</p>

<div class="conditions-grid">
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">The defender-side term</h3>
    <p>Public expert-years spent analysing primitives and the mathematical assumption families beneath them &mdash; lattice problems, isogenies, code-based assumptions. It is produced by a specific, small, identifiable population: academic researchers, government analysts, and a modest number of industry cryptographers, funded by academic and government support for foundational mathematics.</p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">The attacker-side term</h3>
    <p>Effective analysis capacity applied to breaking the same constructions. It is not fully observable and it never has been.</p>
  </div>
</div>

<p>Assurance depends on the relationship between them. And these two terms are driven by completely different processes: the first by funding structures, graduate pipelines, and what a research community considers a worthwhile problem; the second by capability and incentive.</p>

<p>Now bring forward the asymmetry from episode two. <strong>Cryptanalysis is existential search with a mechanically checkable success condition.</strong> Does the distinguisher work? Does the attack recover the key? That is <code>&exists;</code>-shaped, self-verifying, and &mdash; in the vocabulary of episode three &mdash; highly grindable. Security argument is <code>&forall;</code>-shaped over a model, has no cheap oracle, and does not accelerate the same way.</p>

<div class="infobox">
  <p>So automated capability does not lift both columns equally. It lifts the column that is <code>&exists;</code>-shaped and grindable, and leaves most of the other column where it was.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The exposure</span>
<h2>What is structurally unprotected here</h2>

<p>Set aside adversaries entirely for a moment and just look at the system.</p>

<p>We depend on a quantity. The quantity is produced by a small population doing work whose applied value is genuinely hard to evidence in the short term. The funding for that population is justified by claims about long-horizon downstream value &mdash; <em>trust us, this pure mathematics will matter</em> &mdash; which is precisely the class of claim that is weakly supported by the evidence available today.</p>

<p>And there is a real, good-faith scientific debate to be had about whether that funding produces the value claimed for it. That debate is legitimate. Automated research capability makes it <em>more</em> tractable, because it raises the statistical power available for exactly the kind of retrospective study that could answer it: how much foundational mathematical output actually reaches application, over what lag, in which subfields.</p>

<p>Here is the structural point, and it does not require anybody to be acting in bad faith:</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Differential Reallocation</div>
  <p><strong>A well-conducted study of that question will produce differential results by subfield.</strong> Some areas will show transfer. Others will not. And the subfields underwriting cryptographic assumptions are, by any citation-distance measure, among the least application-adjacent in mathematics. A differential result licenses selective reallocation <em>with an evidentiary basis</em>, and the natural targets of a good-faith reallocation include the fields that produce the defender-side column.</p>
</div>

<p>There is no control anywhere in that chain. No unauthorized access, no falsified claim, no policy violation, no identifiable adversarial act. Every step is a legitimate contribution to a real debate. And expertise pools respond to funding with a lag of roughly a doctoral generation, which means by the time the effect is measurable it is already irreversible on the timescale that matters for a primitive migration.</p>

<p>The historical case study for what insufficient or misdirected scrutiny produces is the Dual_EC standardization episode, and it is worth studying precisely because the failure there was not mathematical. The mathematics was available. The scrutiny was not distributed where it needed to be.</p>

<div class="infobox">
  <p>The same structure threatens safety-assurance expertise more broadly, for what it is worth: the pool qualified to assess autonomy safety cases is small, its funding rests on accident-prevention claims that are hard to evidence, and a well-argued deflationary case about it would shrink that pool by the identical mechanism.</p>
</div>

<hr class="gw-hr">
<span class="section-label">What would settle it</span>
<h2>Three measurements, all archival, all public</h2>

<p>This is where the episode earns its place, because the inference above is testable and the tests are cheap.</p>

<div class="conditions-grid">
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Expert-years per primitive</h3>
    <p>From competition records. The AES, SHA-3, and post-quantum processes are documented in public. Participation, submissions, published analyses, teams involved. Extract them. This produces, for the first time, a defensible number for how much accumulated attention a deployed primitive actually rests on.</p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Assessor pool size</h3>
    <p>By assumption family, across eras. Enumerate the analysts qualified to attack lattice-based and code-based assumptions by publication record, and compare to the pool that attacked symmetric primitives during the AES process. <strong>If that number is materially smaller, it is the single most consequential figure in this entire season, and it should be reported prominently.</strong></p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Citation-distance baselines</h3>
    <p>By mathematical subfield. The instrument for the retrospective study, and the thing that determines whether "differential by subfield" is a real prediction or a rhetorical one. Runnable on public bibliometric data today.</p>
  </div>
</div>

<p>None of these require model access, ethics review, or anyone's cooperation. All three are archival work on public records. The reason to want them is not to win an argument &mdash; it is that a quantity we depend on has never been measured, and until it is, everyone discussing it is reasoning from vibes, including me.</p>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>For the people who can actually act on this</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">If you set research funding priorities</div>
    <p>Ask what your portfolio's cryptographic-assurance exposure is before reallocating away from foundational mathematics. Not as a veto &mdash; as a line item that currently does not exist in any portfolio review I have seen.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">If you are planning a primitive migration</div>
    <p>The assurance basis for your target primitives is an accumulated quantity, and you can ask how large it is. "Has been through a standardization process" is a proxy. The competition record is the data.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">If you build threat models</div>
    <p>Add a row. Most threat models treat primitive strength as a constant. It is a function of a number that nobody in the model is tracking, and the number is not guaranteed to be monotonic.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">If you review this argument and think it is wrong</div>
    <p>The three measurements above are how to demonstrate it, and I would genuinely rather see them run and come back reassuring than have this sit as an unfalsified worry.</p>
  </div>
</div>

<p>Next episode turns the season's instruments on the research that produced it, including the parts that did not survive.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-28-beyond-verifiable-long-dwell-time %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 10 &mdash; Part IX: Long dwell</span>
  </a>
  <a href="{% post_url 2026-09-01-beyond-verifiable-conclusion %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 12 &mdash; Conclusion: What you can price and what you can&rsquo;t</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">cryptography</span>
  <span class="tag">post-quantum</span><span class="tag">assurance</span><span class="tag">science-policy</span><span class="tag">ai-security</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
