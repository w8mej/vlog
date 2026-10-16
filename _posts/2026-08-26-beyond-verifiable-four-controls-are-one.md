---
layout: post
title: "Part VII — Your four controls are one control"
date: 2026-08-26 00:00:00 -0800
categories: Security
series: beyond-verifiable-reward
series_title: "Beyond Verifiable Reward"
season: 4
episode: 8
episode_total: 12
image: /images/2026/beyond-verifiable-reward-part-7.jpg   # full-bleed hero, 16:7
image_alt: "Four defensive layers casting a single shadow"
description: "Nuclear safety engineering has been quantifying common-cause failure since the 1970s. If your classifier, judge, monitor and reviewer share a base model, that literature already has a number for what you actually have — and it is not four."
excerpt: "Nuclear safety engineering has been quantifying common-cause failure since the 1970s. If your classifier, judge, monitor and reviewer share a base model, that literature already has a number for what you actually have — and it is not four."
read_time: 13
takeaways:
  - "Redundant controls only multiply if their failures are independent, and controls sharing a base model do not fail independently."
  - "The effective-layer-count formula is imported from common-cause failure analysis, not invented here; the contribution is measuring the correlation term for model-based stacks."
  - "Prompt injection is an information-flow control failure, not an input-validation failure — and the correct formal apparatus for it is fifty years old."
tags:
  - beyond-verifiable-reward
  - season-4
  - defense-in-depth
  - common-cause-failure
  - prompt-injection
  - information-flow-control
  - ai-security
---

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 4 &middot; Beyond Verifiable Reward &middot; Episode 8 of 12</span>
  </div>
  <h2 class="ep-title-display">Part VII</h2>
  <p class="ep-header-tagline">Your four controls are one control</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">Open a modern AI security architecture diagram and count the layers. An input classifier. A model-based judge on the output. A runtime monitor. A human reviewer, model-assisted.</p>
  <p class="ep-lede">Four controls. Defence in depth. The risk register says the residual risk after four independent layers is very small, because that is what four independent layers means.</p>
  <p class="ep-lede">Now ask the question that makes the number go away: <strong>what do those four layers share?</strong></p>
  <p class="ep-lede">Usually: the same base model, or four fine-tunes of it. Which means they share a representation, a set of learned priors, and &mdash; critically &mdash; a set of blind spots. An input crafted to defeat one of them is not facing four independent tests. It is facing one test, four times, with slightly different framing.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The import</span>
<h2>This is common-cause failure, and it is not a new problem</h2>

<p>I want to be careful with attribution here, because this is a case where AI security is about to reinvent something that another discipline has done properly for fifty years.</p>

<p>The independence assumption in redundant systems was tested experimentally in the 1980s in the software-engineering literature on multi-version programming, and it failed: independently developed versions of the same program, written by different teams to the same specification, produced <strong>correlated</strong> failures. Programmers make similar mistakes on similar hard cases because the hard cases are hard for structural reasons, not random ones.</p>

<p>Safety-critical engineering absorbed that lesson and built quantitative machinery for it. Nuclear and process safety have used beta-factor and multiple-Greek-letter models to quantify common-mode failure in redundant systems since the 1970s. These are not obscure. They are in the standards. They are what a reliability engineer reaches for on the first day of an assessment.</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Common-Cause Formula</div>
  <p>The quantity that falls out, for exchangeable layers with pairwise failure correlation <code>&rho;</code>:</p>
  <p style="font-family: monospace; font-size: 1.1rem; margin: .75rem 0;"><strong>k_eff &approx; k / (1 + (k &minus; 1)&rho;)</strong></p>
  <p>At <code>&rho; = 0.9</code> and <code>k = 4</code>, <code>k_eff &approx; 1.2</code>. <strong>Four documented controls are approximately 1.2 actual controls.</strong></p>
</div>

<p>The formula is theirs. The contribution available to us is not the algebra &mdash; it is measuring <code>&rho;</code> for model-based defence stacks, which nobody has published, and reporting <code>k_eff</code> as a standard figure the way availability engineering reports MTBF.</p>

<hr class="gw-hr">
<span class="section-label">Two honest caveats</span>
<h2>What that number does and does not tell you</h2>

<div class="conditions-grid">
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;"><code>&rho; = 0.9</code> is illustrative</h3>
    <p>It is doing all the rhetorical work in that paragraph, and I picked it because it is plausible for four fine-tunes of one base. At <code>&rho; = 0.3</code>, <code>k_eff &approx; 2.1</code>, which is a much less arresting result. Until someone measures the real value for real stacks, the defensible claim is directional: <em>shared-base controls have <code>k_eff</code> materially below <code>k</code>, and nobody currently reports either number.</em></p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">The formula assumes exchangeable layers</h3>
    <p>Real stacks are heterogeneous &mdash; a classifier, a judge, a monitor and a human reviewer are not four draws from one distribution. Heterogeneity generally helps, and it means the single-<code>&rho;</code> model is a simplification. It does not rescue a stack whose heterogeneity is cosmetic.</p>
  </div>
</div>

<div class="infobox">
  <p>Both caveats point the same direction: <strong>measure it.</strong> The study is straightforward &mdash; take a set of model-based controls sharing a base, collect failure data across a common input set, estimate pairwise correlation, report <code>k_eff</code> with a confidence interval. It would be the most quotable and most immediately actionable number in this season.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The generalization</span>
<h2>One theorem, two applications</h2>

<p>Here is the part I find most interesting, because it unifies two things that are usually discussed by different people at different conferences.</p>

<ul class="bullets">
  <li><strong>Search portfolios</strong> work because decorrelated strategies explore different parts of a space. If your strategies are correlated, the portfolio buys nothing &mdash; you paid for <code>k</code> searches and got roughly one.</li>
  <li><strong>Defence in depth</strong> works because decorrelated controls fail on different inputs. If your controls are correlated, the stack buys nothing.</li>
</ul>

<p>Same theorem. Same correlation term. And the shared base model correlates <em>both</em> &mdash; it makes your search portfolio less diverse and your defence stack less independent, simultaneously, for the same reason.</p>

<div class="callout-box cb-red">
  <div class="callout-label">The Dual Property</div>
  <p>Which produces the uncomfortable dual of it: <strong>ensembling decorrelated strategies to find a solution and ensembling decorrelated attempts to bypass a filter are structurally the same operation.</strong> Diversity is a search primitive. A bypass is a search. The property you want for one is the property that helps the other, and it is not possible to have the first without the second.</p>
</div>

<div class="infobox">
  <p>A related and often-missed point: <strong>a probabilistic refusal boundary is a rate limiter, not a control.</strong> If a request is refused with some probability and retried, the well-studied theory of restart schedules for heavy-tailed runtimes says a caller who restarts on a good schedule gets a substantial improvement over naive retry. The refusal does not hold. It taxes. Those are different things and the risk register usually records the second as the first.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The other correlation</span>
<h2>Prompt injection is not an input-validation failure</h2>

<p>While we are importing from disciplines that solved things already.</p>

<p>Prompt injection is routinely posed as an input-validation problem, which leads to sanitization approaches, which do not work, which surprises people. It is not an input-validation failure. It is an <strong>information-flow control failure.</strong></p>

<p>Look at the mechanism. Instructions, retrieved documents, tool outputs, and conversation history occupy one address space with no provenance labels. Nothing in the architecture constrains how low-integrity data influences high-integrity control flow. That is not a missing filter. That is a missing lattice.</p>

<p>The formal apparatus is fifty years old: Denning's information-flow lattice model, and Biba integrity as the specific property being violated &mdash; <strong>low-integrity data influencing high-integrity decisions.</strong> The decentralized label model and its implementations extended it. This machinery is mature and it is almost never cited in the prompt-injection literature.</p>

<p><em>(That "almost never" is a claim about a corpus and I should hold myself to the standard I set in episode one: it is my impression from reading in the area, not a count. If someone runs the count and it comes back high, I will say so.)</em></p>

<p>Two other places the same missing lattice shows up:</p>

<div class="conditions-grid">
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Knowledge merging</h3>
    <p>Merging memory store <code>X</code> from compartment A with store <code>Y</code> from compartment B produces <code>X &cup; Y</code> with no surviving labels. Every downstream reader is now a confused deputy with respect to the provenance of what it read. The fix is label-preserving merge, which is a solved problem in a lattice model and an unsolved one in most agent memory implementations.</p>
  </div>
  <div class="condition-card">
    <h3 style="color:#E5E7EB; margin-bottom:.3rem;">Credential fan-out</h3>
    <p>One non-human identity, <code>N</code> concurrent agent instances. Rate limits, quotas, and anomaly detection are all computed against a principal that no longer corresponds to a single actor. Your per-principal controls are per-<code>N</code>-actors controls and nothing told you.</p>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">The way out</span>
<h2>Add something that does not argue</h2>

<p>If the problem is correlation across model-based components, the fix is not more model-based components. It is a component that fails for <strong>different reasons</strong>.</p>

<p>A deterministic policy or capability boundary does not share the base model's priors because it does not have priors. It cannot be talked out of its position, because it does not have a position &mdash; it has an enforcement point. A sufficiently well-formed argument defeats every control that has an argumentative component, which is precisely why elaborate framing outperforms direct requests against model-based safeguards. That is not a tuning failure. It is single-layer architecture, and <code>k_eff</code> is telling you so.</p>

<div class="infobox red">
  <p>The prediction, stated as one: <strong>only stacks containing at least one non-argumentative control will achieve <code>k_eff > 2</code>.</strong> That is measurable with the same study proposed above, with one extra condition.</p>
</div>

<hr class="gw-hr">
<span class="section-label">Monday</span>
<h2>Compute your own number</h2>

<div class="remediation-steps">
  <div class="rem-block rem-high">
    <div class="rem-header">List your controls and mark their base</div>
    <p>Classifier, judge, monitor, reviewer assistant, anything model-mediated. Group by shared base model. Any group of size > 1 is one control with several names.</p>
  </div>
  <div class="rem-block rem-high">
    <div class="rem-header">Estimate &rho; roughly and honestly</div>
    <p>You do not need a research study to start. Take a set of inputs that defeated one control and test them against the others. The hit rate is a crude correlation estimate and it is almost always higher than people expect.</p>
  </div>
  <div class="rem-block rem-critical">
    <div class="rem-header">Report k_eff in the risk register alongside k</div>
    <p>Two columns: documented layers, effective layers. That single change makes the problem visible to people who will never read this episode.</p>
  </div>
  <div class="rem-block rem-critical">
    <div class="rem-header">Add one non-argumentative control to any stack whose k_eff is below 2</div>
    <p>Capability scoping, deterministic policy enforcement, an allowlist at the boundary. It does not need to be sophisticated. It needs to fail for a different reason than everything else does.</p>
  </div>
</div>

<p>Next episode turns to the layer that most oversight frameworks quietly depend on and nobody has stress-tested: the human reading the explanation.</p>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-08-25-beyond-verifiable-verification-moves-risk %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 7 &mdash; Part VI: The certificate that means nothing</span>
  </a>
  <a href="{% post_url 2026-08-27-beyond-verifiable-chain-of-thought-rewritten-summary %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 9 &mdash; Part VIII: The explanation layer is the attack surface</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">beyond-verifiable-reward</span><span class="tag">season-4</span><span class="tag">defense-in-depth</span>
  <span class="tag">common-cause-failure</span><span class="tag">prompt-injection</span><span class="tag">information-flow-control</span><span class="tag">ai-security</span>
</div>

<div class="gw-byline">John Menerick is an independent principal security engineer (CISSP, CKS/CKA, NSA IAM/IEM). He publishes the Beyond Verifiable Reward series at securesql.info. The views expressed are his own and do not represent any client or employer.</div>

</div>
