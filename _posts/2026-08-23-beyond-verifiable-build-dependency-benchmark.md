---
layout: post
title: "Part IV — Your benchmark is a build dependency"
date: 2026-08-23 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 5
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-4.jpg   # full-bleed hero, 16:7
image_alt: "A benchmark file sitting unsigned in a dependency graph"
description: "Under verifiable-reward training the evaluation artifact and the training environment are the same object. That makes a benchmark a build dependency — and the artifacts that shape model behaviour have a weaker security posture than the packages that merely run it."
excerpt: "Under verifiable-reward training the evaluation artifact and the training environment are the same object. That makes a benchmark a build dependency — and the artifacts that shape model behaviour have a weaker security posture than the packages that merely run it."
read_time: 15
key_takeaways:
  - "Under RLVR the eval defines the reward, so a benchmark is a build input — and build inputs get signing, pinning, provenance and revocation, which benchmarks do not."
  - "A capability attestation is a measurement of a specific artifact at a specific time; scope-preserving modification below the declared threshold leaves the attestation valid and the measurement stale."
  - "Publishing an evaluation suite is simultaneously an accountability mechanism and a target specification. That trade-off has a known resolution shape from high-stakes testing."
tags:
  - beyond-verifiable-reward
  - season-4
  - eval-supply-chain
  - attestation-decay
  - supply-chain-security
  - rlvr
  - ai-governance
takeaways:
  - "Under RLVR the eval defines the reward, so a benchmark is a build input — and build inputs get signing, pinning, provenance and revocation, which benchmarks do not."
  - "A capability attestation is a measurement of a specific artifact at a specific time; scope-preserving modification below the declared threshold leaves the attestation valid and the measurement stale."
  - "Publishing an evaluation suite is simultaneously an accountability mechanism and a target specification. That trade-off has a known resolution shape from high-stakes testing."
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 5 of 12</span>
  </div>
  <h2 class="ep-title-display">Part IV</h2>
  <p class="ep-header-tagline">Your benchmark is a build dependency</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">Take a claim that sounds like wordplay and is not: <strong>the benchmark and the training environment are the same object.</strong></p>
  <p class="ep-lede">Scope that properly before going further, because the unscoped version is false and someone will say so. Under held-out evaluation with no gradient path back to the model, an eval is a measurement instrument and nothing more. The identity holds under <strong>reinforcement learning from verifiable reward</strong>, where the evaluation artifact <em>defines the reward signal</em>. There the two are not analogous. They are one file, read twice, by two teams who think they are doing different things.</p>
  <p class="ep-lede">Once you accept the scoping, the security reading is immediate and uncomfortable.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The reframe</span>
<h2>What a build dependency gets that a benchmark does not</h2>

<p>If an artifact determines the behaviour of a shipped system, your industry has a well-developed opinion about how it should be handled. Package ecosystems learned this the hard way over fifteen years and the resulting apparatus is real: signing, provenance attestation, version pinning in consuming repositories, revocation paths, maintainer accountability, typosquatting detection, reproducible publication.</p>

<p>Now go and look at how an evaluation dataset used in a published RLVR setup is handled.</p>

<div style="overflow-x:auto;">
  <table class="gw-table">
    <thead>
      <tr>
        <th>Property</th>
        <th>Package registries</th>
        <th>Evaluation datasets and RL environments</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><strong>Cryptographic signing</strong></td>
        <td class="pass">Standard</td>
        <td class="fail">Essentially absent</td>
      </tr>
      <tr>
        <td><strong>Provenance attestation</strong></td>
        <td class="pass">Increasingly standard</td>
        <td class="fail">Absent</td>
      </tr>
      <tr>
        <td><strong>Version pinning downstream</strong></td>
        <td class="pass">Standard</td>
        <td class="fail">Inconsistent — often "latest" or a git URL</td>
      </tr>
      <tr>
        <td><strong>Revocation path</strong></td>
        <td class="pass">Exists</td>
        <td class="fail">None</td>
      </tr>
      <tr>
        <td><strong>Maintainer count / bus factor</strong></td>
        <td class="pass">Tracked, discussed</td>
        <td class="fail">Untracked</td>
      </tr>
      <tr>
        <td><strong>Declared vs. actual scope</strong></td>
        <td class="pass">Reviewed</td>
        <td class="fail">Rarely stated at all</td>
      </tr>
    </tbody>
  </table>
</div>

<div class="infobox red">
  <p><strong>The artifacts that shape model behaviour have a weaker security posture than the packages that merely run it.</strong> That is the finding, and it is a measurement rather than an argument &mdash; it is checkable against public data today, requires no model access, no ethics review, and no disclosure gating. It is the single most tractable piece of empirical work in this whole research program and it produces a number the field does not currently have.</p>
</div>

<p>Season 3 spent ten episodes on the dependency graph beneath your applications. This is the same argument one layer over, on a substrate that has not yet had its Heartbleed.</p>

<hr class="gw-hr">
<span class="section-label">The second-order problem</span>
<h2>Difficulty is not a neutral property of an item</h2>

<p>There is a mechanical fact about training that turns benchmark design into something more consequential than it looks.</p>

<p>A training item carries the most gradient signal when the model is genuinely uncertain about it &mdash; when the pass rate sits near the middle rather than near either end. Items the model always gets right teach it nothing. Items it always gets wrong teach it nothing. <strong>The band in between is where learning happens, and it is also where a small number of items has maximum influence per item.</strong></p>

<p>Which means: <em>good benchmark design and high influence-per-item are the same design criterion.</em> A well-built frontier benchmark &mdash; calibrated to sit right at the edge of current capability, which is exactly what makes it useful &mdash; is by construction the most efficient possible vehicle for influencing a model that trains on it.</p>

<p>I am deliberately not writing the operational version of that observation. The defensive corollary is the part that is actionable and it is entirely sufficient:</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Vulnerability of Frontier Difficulty</div>
  <p><strong>Frontier-difficulty evaluation items are the highest-value artifacts in your training supply chain, and they are currently the least protected.</strong> Provenance controls should be strongest exactly where the items are hardest, which is the inverse of current practice, where the hardest benchmarks are the newest and least scrutinized.</p>
</div>

<hr class="gw-hr">
<span class="section-label">Attestation</span>
<h2>Why a capability evaluation goes stale without being wrong</h2>

<p>Capability attestation is becoming a governance primitive: evaluate the model, publish the result, gate deployment on it. The structure is sensible and I would rather have it than not.</p>

<p>But look at what an attestation actually is. It is a measurement of a <strong>specific artifact</strong> &mdash; model weights <code>M</code>, benchmark <code>B</code> &mdash; at a <strong>specific time</strong> <code>t</code>. It is a true statement about that measurement.</p>

<p>Systems in production are not that artifact. They are that artifact plus scaffolding, plus tools, plus retrieval, plus a prompt architecture, plus whatever got added last quarter. Each addition can be individually below any declared threshold for re-evaluation. None of them modify the weights. Every one of them can change the capability being attested.</p>

<p>The attestation remains valid. The measurement becomes stale. Nothing in the pipeline notices, because nothing in the pipeline is measuring the <em>distance</em> between the attested configuration and the deployed one.</p>

<div class="infobox">
  <p><strong>Attestation scope decay</strong> is that distance expressed as a half-life: the modification budget at which the evaluation's predictive validity drops below threshold. And the prediction that makes it worth measuring is uncomfortable &mdash; decay should be <em>fastest</em> for compositional and agentic capabilities, and <em>slowest</em> for knowledge recall. Attestation reliability is inversely related to security relevance. The capabilities we most want a governance gate on are the ones whose gate expires quickest.</p>
</div>

<p>This is a measurable quantity and nobody is measuring it. It would take a modification-budget sweep against a fixed eval and would produce, for the first time, a defensible answer to "how long is this evaluation good for?"</p>

<hr class="gw-hr">
<span class="section-label">The tension</span>
<h2>Publishing the eval is publishing the target</h2>

<p>Here is a genuine conflict, and one where the governance community has largely picked a side without acknowledging there was one.</p>

<p>Publishing an evaluation suite is an accountability mechanism. It lets outsiders reproduce a claim, compare across labs, and catch overstatement. That is good, and the field is better for the ones that exist.</p>

<p>Publishing an evaluation suite also publishes <strong>exact target coordinates</strong>. An eval that is public is an eval that can be optimized against &mdash; in either direction. A model can be shaped to underperform a specific public instrument while retaining the capability on a private functional equivalent, and the result is a clean attestation for a capable system.</p>

<p>I am not going to develop the how. The point that matters is structural: <strong>transparency and integrity are in tension here and the tension is not resolvable by choosing harder.</strong></p>

<p>What makes this episode's version of the problem tractable is that the resolution shape already exists, in a field that has fought this exact battle for decades. High-stakes testing &mdash; professional licensure, standardized admissions &mdash; solved it with <strong>item-bank security</strong>: a large pool of calibrated items, a rotating subset exposed publicly for transparency, a held-out subset used for scoring, and periodic rotation with statistical equating so scores stay comparable across item sets.</p>

<p>That machinery is mature, it is well documented, and to my knowledge nobody in AI evaluation is using it. Adopting it would cost real effort in item calibration and would give up the simplicity of a single fixed public benchmark. It would also make the sandbagging problem substantially harder without giving up accountability, which is more than any current proposal does.</p>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>Four things, in ascending cost</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">Pin your evaluation artifacts like dependencies</div>
    <p>Commit hash, not branch. Vendored copy, not URL fetch at runtime. This is a one-line change in most training configurations and it closes the most trivially exploitable gap in the chain.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Record the bus factor of every eval and environment you depend on</div>
    <p>Maintainer count, last-commit recency, whether there is any revocation path if something is found wrong. You do this for your Python dependencies. The artifact that defines your reward function deserves at least parity.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Write down what your attestation actually attested</div>
    <p>Model version, scaffolding version, tool set, retrieval configuration, prompt architecture, date. Then define what change to any of those triggers re-evaluation. Most organizations have an attestation and no scope statement, which means the attestation has no expiry and therefore no meaning.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">If you publish evals, split the bank</div>
    <p>Public subset for accountability, held-out subset for scoring, documented rotation. It is more work. It is the only approach that gets both properties, and the testing profession has fifty years of practice at it.</p>
  </div>
</div>

<p>Next episode moves to the sharpest version of the "artifact that defines correctness" problem &mdash; formal proof libraries, where the artifact is the definition of truth itself, and where an optimizer rewarded on output has a strategy available that makes every subsequent theorem trivially provable.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-22-beyond-verifiable-gradient-field-bending-at-wall %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 4 &mdash; Part III: The reward that points at the wall</span>
  </a>
  <a href="{% post_url 2026-08-24-beyond-verifiable-root-logical-namespace %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 6 &mdash; Part V: Root over the logical namespace</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">eval-supply-chain</span>
  <span class="tag">attestation-decay</span><span class="tag">supply-chain-security</span><span class="tag">rlvr</span><span class="tag">ai-governance</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
