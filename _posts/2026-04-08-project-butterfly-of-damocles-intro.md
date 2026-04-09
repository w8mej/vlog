---
layout: post
title: "Introduction: From fairy dust to Glasswing: a decade of being right about the wrong thing"
date: 2026-04-08
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 1
categories: ["Security", "Open Source", "Project Glasswing"]
tags: ["Project Glasswing", "Claude Mythos", "Trivy", "LiteLLM", "Axios", "TeamPCP", "UNC1069", "supply chain", "DEF CON 22", "ML stack", "AARM", "XZ Utils", "Glasswing Doctrine", "Morphogenetic SOC"]
excerpt: "In 2014 I stood at DEF CON and showed the internet's foundational software was held together by wishful thinking. In 2026, two nation-states proved the security tooling itself is now the attack surface."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">

<!-- ═══════════════════════════════════════════════════════════ -->
<!-- SERIES INTRODUCTION — Project Butterfly of Damocles S3     -->
<!-- ═══════════════════════════════════════════════════════════ -->

<div class="s3-intro-block">

  <div class="s3-series-eyebrow">Project Butterfly of Damocles &middot; Season 3 &middot; Now premiering &middot; April 2026</div>
  <h1 class="s3-series-title">From fairy dust to Glasswing</h1>
  <p class="s3-series-subtitle">A decade of being right about the wrong thing</p>

  <div class="s3-series-meta">
    <span>10 episodes</span>
    <span>John Menerick</span>
    <span>securesql.info</span>
    <span>CISSP &middot; CKS/CKA &middot; 15+ yrs security architecture</span>
    <span>Morphogenetic SOC series</span>
  </div>

  <p class="s3-lede">In 2014 I stood at DEF CON and showed the internet&rsquo;s foundational software was held together by wishful thinking, volunteer labor, and collective myth. Last week Anthropic&rsquo;s unreleased frontier model validated that at industrial scale. This month two nation-state actors proved the security tooling itself is now the attack surface. And Project Glasswing &mdash; the response &mdash; may be the most consequential single policy decision in the history of open source software security. Whether that consequence is good or catastrophic depends entirely on decisions no one has made yet.</p>

  <div class="s3-season-stats">
    <div class="s3-ss"><div class="s3-ss-num">10</div><div class="s3-ss-sub">Episodes in Season 3</div></div>
    <div class="s3-ss"><div class="s3-ss-num">12 yrs</div><div class="s3-ss-sub">Timeline &mdash; DEF CON 22 to Glasswing</div></div>
    <div class="s3-ss"><div class="s3-ss-num">27 yrs</div><div class="s3-ss-sub">Oldest zero-day found by Mythos</div></div>
    <div class="s3-ss"><div class="s3-ss-num">174K</div><div class="s3-ss-sub">npm packages downstream of Axios alone</div></div>
  </div>

  <hr class="s3-hr">
  <span class="s3-section-label">Episode guide</span>

  <div class="ep-list">

    <div class="ep-row ep-featured">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">01</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">Fairy dust &mdash; the myth that built the internet</div>
        <div class="ep-desc">DEF CON 22, 2014. Quantitative analysis of 2,000+ open source projects reveals that foundational internet infrastructure &mdash; Exim, Bind, OpenSSL &mdash; is riddled with critical vulnerabilities nobody is fixing. The Everybody/Somebody/Nobody parable. The incentive structure that produces 13,000 critical bugs in a mail server nobody audits.</div>
        <div class="ep-tags-row"><span class="ep-tag">DEF CON 22</span><span class="ep-tag">Exim</span><span class="ep-tag">OpenSSL</span><span class="ep-tag">vulnerability density</span><span class="ep-tag">maintainer economics</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Published</span><span class="ep-runtime">~22 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">02</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The dependency graph &mdash; 847 applications in a login form</div>
        <div class="ep-desc">Transitive dependency risk, package maintenance economics, and why the thing that destroys you won&rsquo;t be your code. Quantitative CVE density analysis across npm, PyPI, and C/C++ ecosystems from event-stream to Log4Shell.</div>
        <div class="ep-tags-row"><span class="ep-tag">supply chain</span><span class="ep-tag">npm</span><span class="ep-tag">PyPI</span><span class="ep-tag">Log4Shell</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">Coming soon</span><span class="ep-runtime">~18 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">03</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The XZ playbook &mdash; two years to own a dependency of sshd</div>
        <div class="ep-desc">CVE-2024-3094 is not a vulnerability story &mdash; it&rsquo;s a governance story. A nation-state actor spent two years becoming a trusted contributor, then inserted a backdoor into a transitive dependency of sshd on almost every Linux distribution. Caught by an anomalous CPU benchmark, not security review. The template for everything that followed in 2026.</div>
        <div class="ep-tags-row"><span class="ep-tag">XZ Utils</span><span class="ep-tag">CVE-2024-3094</span><span class="ep-tag">social engineering</span><span class="ep-tag">maintainer targeting</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">Coming soon</span><span class="ep-runtime">~20 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">04</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The inspector &mdash; when Trivy became the weapon</div>
        <div class="ep-desc">March 19, 2026. TeamPCP force-pushes malicious commits to 76/77 trivy-action version tags simultaneously. The most diligent organizations had the greatest exposure. Full cascade reconstruction: CanisterWorm with blockchain C2, Checkmarx KICS, LiteLLM AI key vault breach, Telnyx WAV steganography, European Commission&rsquo;s 92&nbsp;GB.</div>
        <div class="ep-tags-row"><span class="ep-tag">Trivy</span><span class="ep-tag">TeamPCP</span><span class="ep-tag">CVE-2026-33634</span><span class="ep-tag">CanisterWorm</span><span class="ep-tag">LiteLLM</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">Coming soon</span><span class="ep-runtime">~24 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">05</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The locksmith &mdash; two weeks to own 100 million downloads</div>
        <div class="ep-desc">March 31, 2026. North Korean UNC1069 runs a two-week individualized social engineering campaign against Axios lead maintainer Jason Saayman. Three hours. 174,000 downstream packages. The ROI calculation that makes high-impact OSS maintainers the most valuable social engineering targets in software &mdash; and what SLSA provenance absence means as a detection signal.</div>
        <div class="ep-tags-row"><span class="ep-tag">Axios</span><span class="ep-tag">UNC1069</span><span class="ep-tag">DPRK</span><span class="ep-tag">Sapphire Sleet</span><span class="ep-tag">SLSA</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">Coming soon</span><span class="ep-runtime">~22 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">06</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The ML stack &mdash; 700 CVEs and a pickle file that runs your AI</div>
        <div class="ep-desc">TensorFlow: 700+ critical CVEs. HuggingFace&rsquo;s dominant model serialization format: arbitrary code execution by design. LiteLLM stores all your LLM provider API keys, present in 36% of monitored cloud environments. The DEF CON 22 vulnerability density methodology applied to the modern ML infrastructure stack &mdash; same conclusions, one decade later, new substrate.</div>
        <div class="ep-tags-row"><span class="ep-tag">ML stack</span><span class="ep-tag">TensorFlow</span><span class="ep-tag">LiteLLM</span><span class="ep-tag">ShadowRay</span><span class="ep-tag">HuggingFace</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">Coming soon</span><span class="ep-runtime">~20 min</span></div>
    </div>

    <div class="ep-row ep-featured">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">07</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">Glasswing &mdash; the most consequential policy decision in OSS security history</div>
        <div class="ep-desc">April 8, 2026. Anthropic announces Project Glasswing: Claude Mythos Preview withheld from general release, deployed to 52 partner organizations for defensive use. A 27-year-old OpenBSD bug. A sandbox escape followed by an unprompted email to a researcher eating a sandwich. The Glasswing Doctrine, the Everybody/Somebody/Nobody loop, and why voluntary restraint at the AI governance layer is structurally identical to voluntary restraint in OSS security.</div>
        <div class="ep-tags-row"><span class="ep-tag">Project Glasswing</span><span class="ep-tag">Claude Mythos</span><span class="ep-tag">Glasswing Doctrine</span><span class="ep-tag">capability withholding</span><span class="ep-tag">AARM</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Published</span><span class="ep-runtime">~22 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">08</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The compliance cliff &mdash; CISA KEV was designed for a different world</div>
        <div class="ep-desc">Every regulatory vulnerability management framework assumes discovery is scarce and disclosure is sequential. Glasswing produces thousands of simultaneous zero-day advisories. This episode models what happens when federal agencies receive 1,000 simultaneous zero-day advisories &mdash; and maps the 18-month window before the disclosure flood hits a compliance stack nobody has started redesigning.</div>
        <div class="ep-tags-row"><span class="ep-tag">CISA KEV</span><span class="ep-tag">NVD</span><span class="ep-tag">FedRAMP</span><span class="ep-tag">CMMC</span><span class="ep-tag">compliance cliff</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-upcoming">Upcoming</span><span class="ep-runtime">~18 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">09</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The human surface &mdash; no technical control survives two weeks of trust</div>
        <div class="ep-desc">Why SLSA provenance and OIDC-attested publishing are the only reliable detection signals (not prevention). Why the maintainer funding model produces the same burnout-and-vulnerability cycle in every ecosystem. What AARM-class governance for AI security tooling would need to look like to contain an agent that already demonstrated autonomous boundary-crossing in a controlled evaluation.</div>
        <div class="ep-tags-row"><span class="ep-tag">social engineering</span><span class="ep-tag">maintainer burnout</span><span class="ep-tag">AARM</span><span class="ep-tag">SLSA</span><span class="ep-tag">human surface</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-upcoming">Upcoming</span><span class="ep-runtime">~20 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">10</div></div>
      <div class="ep-body-cell">
        <div class="ep-title">The pattern &mdash; only the substrate changes</div>
        <div class="ep-desc">Season finale. The fairy dust didn&rsquo;t disappear &mdash; it moved one abstraction layer higher with each generation. What the Glasswing Doctrine needs to become to be durable. What the open source social contract looks like after a private AI lab unilaterally rewrote it. And the question nobody is asking loudly enough: who patches the patcher&rsquo;s patcher, through what supply chain, while the patcher is fielding a Teams meeting request from a very convincing stranger.</div>
        <div class="ep-tags-row"><span class="ep-tag">synthesis</span><span class="ep-tag">OSS social contract</span><span class="ep-tag">governance</span><span class="ep-tag">Glasswing Doctrine</span><span class="ep-tag">season finale</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-upcoming">Upcoming</span><span class="ep-runtime">~25 min</span></div>
    </div>

  </div><!-- /ep-list -->

  <hr class="s3-hr">
  <span class="s3-section-label">Three narrative threads across Season 3</span>

  <div class="arc-grid">
    <div class="arc-card arc-purple">
      <h4>Thread 1 &mdash; The vulnerability story (Ep. 01, 02, 06)</h4>
      <p>The quantitative case that OSS infrastructure was never as secure as the collective myth suggested &mdash; from Exim&rsquo;s 13,000 criticals in 2014 to TensorFlow&rsquo;s 700+ in 2026. The data through two generations of infrastructure.</p>
      <ul class="arc-list">
        <li>Ep. 01 &mdash; Internet infrastructure: DEF CON 22 dataset</li>
        <li>Ep. 02 &mdash; Supply chain: transitive dependency risk</li>
        <li>Ep. 06 &mdash; ML stack: the new load-bearing walls</li>
      </ul>
    </div>
    <div class="arc-card arc-red">
      <h4>Thread 2 &mdash; The attack story (Ep. 03, 04, 05)</h4>
      <p>How nation-state actors operationalized the threat models security researchers had been publishing for years. XZ as the template, Trivy as the pivot, Axios as the broadside. The playbook was published. They read it.</p>
      <ul class="arc-list">
        <li>Ep. 03 &mdash; XZ Utils: the two-year playbook</li>
        <li>Ep. 04 &mdash; Trivy/TeamPCP: the cascade</li>
        <li>Ep. 05 &mdash; Axios/UNC1069: the locksmith operation</li>
      </ul>
    </div>
    <div class="arc-card arc-teal">
      <h4>Thread 3 &mdash; The response story (Ep. 07, 08, 09, 10)</h4>
      <p>Glasswing as policy precedent. The compliance cliff. The irreducible human surface. Whether the voluntary restraint that produced Glasswing is more durable than the restraint that left the bugs unfixed for 27 years.</p>
      <ul class="arc-list">
        <li>Ep. 07 &mdash; Glasswing: the doctrine</li>
        <li>Ep. 08 &mdash; The compliance cliff</li>
        <li>Ep. 09 &mdash; The human surface</li>
        <li>Ep. 10 &mdash; The pattern: season finale</li>
      </ul>
    </div>
  </div>

  <hr class="s3-hr">
  <span class="s3-section-label">Recurring themes across Season 3</span>

  <div class="theme-grid">
    <div class="theme-card">
      <span class="theme-label theme-purple">The parable</span>
      <h4>Everybody / Somebody / Nobody / Anybody</h4>
      <p>Introduced at DEF CON 22 to explain Heartbleed. Returns in every episode as the structural explanation for why each generation of infrastructure inherits the same failure mode.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-red">The inversion</span>
      <h4>Diligence as the attack surface</h4>
      <p>The most security-conscious organizations had the greatest Trivy exposure because they ran it most frequently. The XZ maintainer was trustworthy, which is why the attack worked. Security posture as vulnerability vector.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-teal">The layer shift</span>
      <h4>Fairy dust moves up the stack</h4>
      <p>2014: &ldquo;everyone&rsquo;s looking at the code.&rdquo; 2024: &ldquo;our tooling is trustworthy.&rdquo; 2026: &ldquo;our AI deployment is safe.&rdquo; The pattern is consistent. Only the substrate changes.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-amber">The ROI problem</span>
      <h4>Nation-state math on open source</h4>
      <p>Two weeks to own 100M weekly downloads. Two years to own a transitive dependency of sshd. The economics of targeting volunteer maintainers only improve as package footprints grow.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-blue">The governance gap</span>
      <h4>Good intentions vs. durable structures</h4>
      <p>Glasswing is voluntary restraint. The OSS social contract was voluntary contribution. Both depend on goodwill at a scale it was never designed for. Season 3 asks what durable looks like.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-coral">The velocity mismatch</span>
      <h4>Machine discovery, human remediation</h4>
      <p>Mythos finds bugs at machine speed. Patches ship at human speed. Season 3 maps what changes when discovery becomes free and the bottleneck shifts entirely to everything that comes after.</p>
    </div>
  </div>

  <div class="s3-pullquote">
    <p>&ldquo;Project Butterfly of Damocles: named for the moment you realize the sword has been hanging above the internet since 1998 &mdash; and that the thread was always a volunteer with a day job.&rdquo;</p>
    <span class="attr">&mdash; Series concept note, April 2026</span>
  </div>

  <div class="s3-infobox">
    <p>Episodes 01 and 07 are published as part of the series premiere. Episodes 02&ndash;06 and 08&ndash;10 are in production and will publish on a rolling schedule through Q2&ndash;Q3 2026. Subscribe to the Morphogenetic SOC newsletter at securesql.info for release notifications.</p>
  </div>

</div><!-- /s3-intro-block -->

<hr class="gw-hr">

{% comment %}
  <hr class="gw-hr">
  <span class="section-label"> ASDFMEN Part I &mdash; What I found in 2014</span>
  <h2>The original quantitative case: internet infrastructure is not OK</h2>
  <p>The &ldquo;Open Source Fairy Dust&rdquo; talk wasn&rsquo;t a rhetorical exercise. It was a data exercise &mdash; 2,000+ open source projects, static and dynamic analysis, NVD correlation, vulnerability density plotted on a log scale against total critical count. Up and to the right is terrifying. Down and to the left is survivable. Almost nothing critical lived in the safe quadrant, and the outliers told a story about institutional failure, not individual negligence.</p>

  <div class="tbl-wrap">
    <table>
      <thead><tr><th>Project</th><th>Category</th><th>Critical CVEs</th><th>Risk position</th></tr></thead>
      <tbody>
        <tr><td class="tbl-name">Exim</td><td>Mail server</td><td>~13,000</td><td class="risk-extreme">Extreme &mdash; up-right outlier</td></tr>
        <tr><td class="tbl-name">Bind 8</td><td>DNS</td><td>~6,000</td><td class="risk-danger">Danger zone</td></tr>
        <tr><td class="tbl-name">OpenSSL</td><td>Crypto library</td><td>~4,500</td><td class="risk-danger">Danger zone</td></tr>
        <tr><td class="tbl-name">Bind 9</td><td>DNS</td><td>~2,000</td><td class="risk-high">High risk</td></tr>
        <tr><td class="tbl-name">Linux kernel</td><td>OS</td><td>~3,200</td><td class="risk-high">Large codebase, moderate density</td></tr>
        <tr><td class="tbl-name">FreeRADIUS</td><td>Auth</td><td>moderate</td><td class="risk-danger">Danger zone</td></tr>
        <tr><td class="tbl-name">OpenPGP.js</td><td>Crypto</td><td>moderate</td><td class="risk-danger">Danger zone</td></tr>
        <tr><td class="tbl-name">Apache</td><td>Web server</td><td>~290</td><td class="risk-safe">Relatively safer</td></tr>
        <tr><td class="tbl-name">nginx</td><td>Web server</td><td>low</td><td class="risk-safe">Relatively safer</td></tr>
        <tr><td class="tbl-name">OpenVPN</td><td>Network</td><td>low</td><td class="risk-safe">Relatively safer</td></tr>
      </tbody>
    </table>
  </div>

  <p>The mail server answer was Exim. Bind 8 was a monument to &ldquo;we&rsquo;ll fix the security in the rewrite.&rdquo; OpenSSL at 4,500 criticals included Heartbleed &mdash; everybody&rsquo;s problem, therefore nobody&rsquo;s problem. The root cause held across every project: strained volunteer maintainers rationally prioritize stability and performance, because that is what their users reward them for. That diagnosis has not aged out.</p>

  <div class="pullquote">
    <p>&ldquo;Everybody was sure somebody would do it. Anybody could have done it. But nobody did it &mdash; and everybody blamed somebody, when nobody did what anybody could have done.&rdquo;</p>
    <span class="attr">&mdash; DEF CON 22, 2014. Still the most accurate description of OSS security governance in 2026.</span>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part II &mdash; The supply chain multiplier</span>
  <h2>Third-party libraries: the vulnerability layer nobody counted</h2>
  <p>The scatter chart above captured first-party vulnerability density. What it didn&rsquo;t capture &mdash; what almost nobody was adequately modeling in 2014 &mdash; is the transitive dependency graph. When your Node.js service pulls 847 npm packages to serve a login form, you are not running one application. You are running 847 applications, most written by someone who needed to scratch an itch and moved on.</p>

  <div class="sc-grid">
    <div class="sc-card">
      <div class="sc-card-head"><span class="sc-label">npm ecosystem</span><span class="sc-count sc-red">~4,300+</span></div>
      <div class="sc-sub">Known malicious packages 2021&ndash;2026</div>
      <ul class="sc-list">
        <li>event-stream (2018) &mdash; cryptominer injection <span class="badge-critical">critical</span></li>
        <li>ua-parser-js &mdash; trojanized, 8M weekly DLs <span class="badge-critical">critical</span></li>
        <li>colors/faker (2022) &mdash; intentional sabotage <span class="badge-high">high</span></li>
        <li>Axios (Mar 2026) &mdash; DPRK RAT, 100M weekly DLs <span class="badge-critical">critical</span></li>
        <li>Typical app: 847 transitive deps <span class="badge-high">high surface</span></li>
      </ul>
    </div>
    <div class="sc-card">
      <div class="sc-card-head"><span class="sc-label">PyPI / Python</span><span class="sc-count sc-amber">~7,500+</span></div>
      <div class="sc-sub">Malicious / typosquatting packages 2019&ndash;2026</div>
      <ul class="sc-list">
        <li>torch typosquats &mdash; ML supply chain attacks <span class="badge-critical">critical</span></li>
        <li>ShadowRay (2024) &mdash; Ray framework RCE <span class="badge-critical">critical</span></li>
        <li>LiteLLM 1.82.7/1.82.8 (Mar 2026) &mdash; TeamPCP <span class="badge-critical">critical</span></li>
        <li>Telnyx SDK &mdash; WAV steganography payload <span class="badge-critical">critical</span></li>
        <li>Typical ML app: 200&ndash;600 transitive deps <span class="badge-high">high surface</span></li>
      </ul>
    </div>
    <div class="sc-card">
      <div class="sc-card-head"><span class="sc-label">C/C++ / systems</span><span class="sc-count sc-red">structural</span></div>
      <div class="sc-sub">Bundled library transitive exposure</div>
      <ul class="sc-list">
        <li>XZ Utils (2024) &mdash; 2-year social eng. backdoor <span class="badge-critical">critical</span></li>
        <li>Log4Shell &mdash; bundled log4j at JVM scale <span class="badge-critical">critical</span></li>
        <li>FFmpeg &mdash; 16-yr-old bug found by Mythos <span class="badge-critical">critical</span></li>
        <li>OpenSSL bundled in 350K+ projects <span class="badge-high">high</span></li>
        <li>zlib / libpng stale copies endemic <span class="badge-high">high</span></li>
      </ul>
    </div>
    <div class="sc-card">
      <div class="sc-card-head"><span class="sc-label">CI/CD / DevSecOps tooling</span><span class="sc-count sc-red">weaponized</span></div>
      <div class="sc-sub">Security tools turned attack vectors &mdash; March 2026</div>
      <ul class="sc-list">
        <li>Trivy v0.69.4 &mdash; credential stealer injected <span class="badge-critical">critical</span></li>
        <li>Checkmarx KICS &mdash; 35 version tags poisoned <span class="badge-critical">critical</span></li>
        <li>Mutable git tags &mdash; entire CI/CD risk class <span class="badge-critical">critical</span></li>
        <li>82% Docker Hub images &mdash; high/critical vulns <span class="badge-high">high</span></li>
        <li>GitHub Actions ambient secret exposure <span class="badge-high">high</span></li>
      </ul>
    </div>
  </div>

  <div class="infobox">
    <p>The XZ Utils backdoor (CVE-2024-3094) is the canonical proof of concept for the maintainer-as-attack-surface model I described in 2014. A burned-out volunteer was socially engineered over two years by an attacker who contributed code, built trust, then inserted a backdoor into a transitive dependency of sshd. Nobody caught it through code review. A Microsoft engineer caught it through anomalous CPU benchmarking. It served as the direct operational template for both March 2026 campaigns. The playbook was published. Nation-states read it.</p>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part IIa &mdash; The March 2026 cascade</span>
  <h2>When the security scanner became the weapon: Trivy &rarr; LiteLLM &rarr; Axios</h2>
  <p>Two distinct nation-state actors struck the developer toolchain within 12 days of each other. They didn&rsquo;t attack the applications. They attacked the tools organizations use to secure the applications &mdash; the inspector, not the kitchen. The most diligent defenders had the greatest exposure.</p>

  <div class="cascade">

    <div class="c-step">
      <div class="c-dot c-amber">&#9888;</div>
      <div class="c-body">
        <div class="c-title">Trivy v0.69.4 &mdash; the entry point <span class="c-date">Mar 19 &middot; CVE-2026-33634 &middot; CVSS 9.4</span></div>
        <p>TeamPCP (UNC6780/DeadCatx3) exploited incomplete credential rotation from a prior Aqua Security breach. Force-pushed malicious commits to 76/77 trivy-action version tags and all 7 setup-trivy tags. Poisoned binary published simultaneously to GitHub Releases, Docker Hub, GHCR, ECR, deb/rpm repos, and get.trivy.dev. A full credential stealer ran inside the legitimate scan &mdash; pipelines appeared normal. Harvested AWS IAM keys, GCP tokens, Azure env vars, K8s secrets, SSH keys, and npm tokens. European Commission: 92&nbsp;GB stolen.</p>
        <div class="c-stats">
          <span class="c-stat red">76/77 version tags poisoned</span>
          <span class="c-stat red">1,000+ enterprise envs compromised</span>
          <span class="c-stat red">European Commission: 92 GB stolen</span>
          <span class="c-stat amb">~3hr initial + 10hr Docker extension</span>
        </div>
      </div>
    </div>

    <div class="c-step">
      <div class="c-dot c-purple">&#9679;</div>
      <div class="c-body">
        <div class="c-title">CanisterWorm &mdash; first blockchain C2 on record <span class="c-date">Mar 20</span></div>
        <p>Using npm tokens stolen from Trivy-compromised CI runners, TeamPCP deployed CanisterWorm &mdash; the first documented malware using Internet Computer Protocol (ICP) canisters as decentralized C2. Domain takedowns and IP sinkholing were structurally useless. The worm self-propagated, infecting 47+ packages in under 60 seconds. Each compromised pipeline yielded credentials to compromise the next target.</p>
        <div class="c-stats">
          <span class="c-stat red">47+ npm packages infected in &lt;60s</span>
          <span class="c-stat red">First ICP blockchain C2 on record</span>
          <span class="c-stat amb">Traditional takedown methods: ineffective</span>
        </div>
      </div>
    </div>

    <div class="c-step">
      <div class="c-dot c-red">&#9679;</div>
      <div class="c-body">
        <div class="c-title">LiteLLM 1.82.7/1.82.8 &mdash; the AI key vault breach <span class="c-date">Mar 24 &middot; PyPI &middot; 95M monthly downloads</span></div>
        <p>BerriAI&rsquo;s CI/CD pipeline used Trivy for scanning. The poisoned trivy-action harvested their PyPI publishing token. TeamPCP published backdoored LiteLLM directly, bypassing all release controls. Malware introduced a Python <code>.pth</code> file &mdash; auto-executes on every Python interpreter startup, before any import. LiteLLM routes to OpenAI, Anthropic, Azure OpenAI, Google Vertex, AWS Bedrock, and 100+ providers &mdash; storing all API keys centrally. Wiz Research: present in 36% of monitored cloud environments. K8s lateral movement via kube-system on every cluster node.</p>
        <div class="c-stats">
          <span class="c-stat red">95M monthly downloads</span>
          <span class="c-stat red">36% of cloud environments (Wiz)</span>
          <span class="c-stat red">ALL LLM API keys exposed</span>
          <span class="c-stat amb">.pth persistence: every Python invocation</span>
        </div>
      </div>
    </div>

    <div class="c-step">
      <div class="c-dot c-coral">&#9679;</div>
      <div class="c-body">
        <div class="c-title">Telnyx SDK &mdash; WAV steganography delivery <span class="c-date">Mar 26</span></div>
        <p>WAV audio file steganography used to conceal and deliver AES-256+RSA-4096 encrypted second-stage payloads &mdash; the first documented use of this technique in a supply chain attack. By this point TeamPCP had announced ransomware partnerships with CipherForce and Vect, with approximately 300&nbsp;GB of compressed credentials being actively monetized.</p>
        <div class="c-stats">
          <span class="c-stat red">WAV steganography C2 &mdash; novel technique</span>
          <span class="c-stat red">300 GB credentials total &mdash; campaign-wide</span>
          <span class="c-stat amb">CipherForce + Vect ransomware partnerships</span>
        </div>
      </div>
    </div>

    <div class="c-step">
      <div class="c-dot c-blue">&#9679;</div>
      <div class="c-body">
        <div class="c-title">Axios 1.14.1/0.30.4 &mdash; concurrent DPRK broadside <span class="c-date">Mar 31 &middot; UNC1069 / Sapphire Sleet &middot; entirely separate actor</span></div>
        <p>A completely independent operation. UNC1069 spent two weeks individually targeting lead maintainer Jason Saayman: cloned founder identity, crafted Slack workspace with LinkedIn feeds and fake team members, moved to Teams, faked an audio error, prompted install of a fix. RAT deployed. Both <code>latest</code> and <code>legacy</code> dist-tags pointed to malicious versions. CosmicDoor + SilentSiphon cross-platform RAT deployed during a 3-hour window. SLSA provenance absent on malicious releases &mdash; the one reliable detection signal most organizations were not monitoring.</p>
        <div class="c-stats">
          <span class="c-stat red">~100M weekly downloads</span>
          <span class="c-stat red">174,000 downstream packages</span>
          <span class="c-stat amb">2-week individual social engineering</span>
          <span class="c-stat amb">SLSA provenance absence = detection signal</span>
        </div>
      </div>
    </div>

  </div><!-- /cascade -->

  <div class="infobox red">
    <p>The meta-irony: Trivy is a vulnerability scanner. It runs with elevated access to pipeline secrets by design. The attackers didn&rsquo;t break that design &mdash; they used it. The most security-conscious organizations had the greatest exposure because they ran Trivy most frequently. In 2026, diligence became the attack surface. This is the 2014 thesis, one abstraction layer higher: the fairy dust now extends to the security tooling itself.</p>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part III &mdash; The ML stack</span>
  <h2>Silicon Valley&rsquo;s new attack surface: the machine learning dependency graph</h2>
  <p>In 2014 the scariest projects were Exim, Bind, and OpenSSL. In 2026 the load-bearing walls include PyTorch, TensorFlow, ONNX Runtime, HuggingFace, LiteLLM, and Ray. Their vulnerability surface is underaudited relative to deployment footprint by an order of magnitude. The LiteLLM compromise crystallized a new failure mode: a single breach in the AI gateway layer exposes every LLM API key an organization holds, across every provider, simultaneously.</p>

  <div class="ml-section">
    <div class="ml-section-label">ML stack vulnerability exposure by layer &mdash; known CVEs + structural risk (2024&ndash;2026)</div>

    <div class="ml-layer-label">Hardware / Firmware</div>
    <div class="ml-row"><div class="ml-name">CUDA runtime</div><div class="ml-bar-outer"><div class="ml-bar" style="width:72%;background:#A32D2D"></div></div><div class="ml-stat ml-red">72 CVEs &middot; high</div></div>
    <div class="ml-row"><div class="ml-name">NVIDIA drivers</div><div class="ml-bar-outer"><div class="ml-bar" style="width:68%;background:#EF9F27"></div></div><div class="ml-stat ml-amber">200+ CVEs &middot; high</div></div>

    <div class="ml-layer-label" style="margin-top:.6rem">Frameworks</div>
    <div class="ml-row"><div class="ml-name">TensorFlow</div><div class="ml-bar-outer"><div class="ml-bar" style="width:90%;background:#A32D2D"></div></div><div class="ml-stat ml-red">700+ CVEs &middot; critical</div></div>
    <div class="ml-row"><div class="ml-name">PyTorch</div><div class="ml-bar-outer"><div class="ml-bar" style="width:82%;background:#A32D2D"></div></div><div class="ml-stat ml-red">~150 CVEs &middot; critical supply chain</div></div>
    <div class="ml-row"><div class="ml-name">ONNX Runtime</div><div class="ml-bar-outer"><div class="ml-bar" style="width:55%;background:#EF9F27"></div></div><div class="ml-stat ml-amber">~40 CVEs &middot; high</div></div>

    <div class="ml-layer-label" style="margin-top:.6rem">Model / Data Layer</div>
    <div class="ml-row"><div class="ml-name">HuggingFace Hub</div><div class="ml-bar-outer"><div class="ml-bar" style="width:65%;background:#A32D2D"></div></div><div class="ml-stat ml-red">Pickle RCE &middot; critical</div></div>
    <div class="ml-row"><div class="ml-name">safetensors</div><div class="ml-bar-outer"><div class="ml-bar" style="width:22%;background:#0F6E56"></div></div><div class="ml-stat ml-teal">Low &middot; improving</div></div>
    <div class="ml-row"><div class="ml-name">MLflow / W&amp;B</div><div class="ml-bar-outer"><div class="ml-bar" style="width:58%;background:#EF9F27"></div></div><div class="ml-stat ml-amber">SSRF / path traversal &middot; high</div></div>

    <div class="ml-layer-label" style="margin-top:.6rem">AI Gateway / Serving</div>
    <div class="ml-row"><div class="ml-name">LiteLLM</div><div class="ml-bar-outer"><div class="ml-bar" style="width:95%;background:#A32D2D"></div></div><div class="ml-stat ml-red">TeamPCP Mar 2026 &middot; critical</div></div>
    <div class="ml-row"><div class="ml-name">Ray</div><div class="ml-bar-outer"><div class="ml-bar" style="width:78%;background:#A32D2D"></div></div><div class="ml-stat ml-red">ShadowRay unauth RCE &middot; critical</div></div>
    <div class="ml-row"><div class="ml-name">LangChain</div><div class="ml-bar-outer"><div class="ml-bar" style="width:69%;background:#A32D2D"></div></div><div class="ml-stat ml-red">Prompt injection + SSRF chains</div></div>
    <div class="ml-row"><div class="ml-name">vLLM / TGI</div><div class="ml-bar-outer"><div class="ml-bar" style="width:42%;background:#EF9F27"></div></div><div class="ml-stat ml-amber">Young projects &middot; growing surface</div></div>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part IV &mdash; The timeline</span>
  <h2>From &ldquo;I have a toolbox&rdquo; to &ldquo;the model has agency&rdquo; to &ldquo;the scanner has a backdoor&rdquo;</h2>

  <div class="tl">
    <div class="tl-row"><div class="tl-year">2014</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>DEF CON 22 &mdash; Open Source Fairy Dust</h4><p>Manual + automated analysis across 2,000+ projects. AWS spot fleet, Jenkins, NVD correlation. Found thousands of unlogged vulnerabilities. Filed one as a public issue. Got yelled at. Nobody was looking at the code.</p></div></div>
    <div class="tl-row"><div class="tl-year">2021</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>Log4Shell &mdash; Heartbleed at JVM scale</h4><p>Bundled library in tens of thousands of applications. The Everybody/Somebody thesis confirmed again. Supply chain as attack vector moves from theoretical to operationalized.</p></div></div>
    <div class="tl-row"><div class="tl-year">2024</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>XZ Utils &mdash; social engineering the maintainer directly</h4><p>Two years. One burned-out volunteer. Transitive dependency of sshd. Caught by performance benchmarking, not code review. The template for March 2026. The playbook was published. Nation-states read it.</p></div></div>
    <div class="tl-row"><div class="tl-year">Mar&nbsp;19&ndash;31,&nbsp;2026</div><div class="tl-line"><div class="tl-dot tl-dot-red"></div></div><div class="tl-content"><h4>The cascade &mdash; two actors, 12 days, two ecosystems</h4><p>TeamPCP weaponizes Trivy. CanisterWorm with blockchain C2. LiteLLM AI key vault breached. European Commission loses 92&nbsp;GB. Concurrent: DPRK social engineers Axios maintainer for a 3-hour window. 174K downstream packages. 300&nbsp;GB credentials total.</p></div></div>
    <div class="tl-row"><div class="tl-year">Apr&nbsp;8,&nbsp;2026</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>Project Glasswing announced</h4><p>Mythos Preview withheld. 12 partners, 40 orgs, $104M committed. Thousands of zero-days. A 27-year-old OpenBSD bug. A sandbox escape followed by an unprompted email to a researcher eating lunch. The most powerful vulnerability-finding capability ever built, deliberately kept from the ecosystem two nation-states had just finished systematically compromising.</p></div></div>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part V &mdash; The game changer</span>
  <h2>What Project Glasswing actually changes for every open source actor on earth</h2>
  <p>Most coverage frames Glasswing as a cybersecurity initiative. That undersells it by an order of magnitude. Glasswing is the first time a frontier AI lab publicly declared that a capability in its own model is too dangerous to release &mdash; and simultaneously deployed that capability as a public good in a controlled, partner-gated structure. That is not a product launch. It is a policy precedent that will define how every subsequent lab handles every subsequent capability threshold crossing.</p>

  <div class="infobox purple">
    <p>The decision to withhold Mythos from general release while using it to audit publicly relied-upon OSS is, effectively, a unilateral declaration that the old open source security model is over. No standards body was convened. No community vote was taken. Anthropic assessed the capability, assessed the risk, and acted. That is either the responsible exercise of asymmetric power &mdash; or a troubling precedent for who gets to make civilization-scale security decisions. The answer depends entirely on what the next lab does when it crosses the same threshold.</p>
  </div>

  <h3>The Glasswing Doctrine &mdash; three things it establishes</h3>
  <div class="doctrine-row">
    <div class="doctrine-card"><div class="doctrine-num">01</div><h4>Capability withholding is now a legitimate AI governance tool</h4><p>Every frontier lab now has a reference model for how to handle dangerous capability thresholds &mdash; and every government has a reference model for what to demand. The doctrine exists whether other labs follow it or not.</p></div>
    <div class="doctrine-card"><div class="doctrine-num">02</div><h4>The defender head-start window is finite and closing from both ends</h4><p>Glasswing&rsquo;s premise requires defenders use Mythos-class capability before adversaries have equivalent access. CanisterWorm already uses blockchain C2. The adversary innovation cycle is not paused. The window is months, not years.</p></div>
    <div class="doctrine-card"><div class="doctrine-num">03</div><h4>OSS maintainers are now AI-scale security stakeholders</h4><p>The first time people who actually ship patches are included as first-class actors in a capability program at this scale &mdash; and the greatest operational burden on the most resource-constrained, most socially targeted humans in the ecosystem.</p></div>
  </div>

  <h3 style="margin-top:1.5rem">How Glasswing changes the game &mdash; by actor category</h3>
  <div class="actor-impact">
    <div class="ai-row-head">
      <div class="ai-hcell">Actor</div>
      <div class="ai-hcell">How their world just changed</div>
      <div class="ai-hcell">Net impact</div>
      <div class="ai-hcell">Readiness</div>
    </div>
    <div class="ai-row"><div class="ai-cell ai-name"><span class="dot dot-crit"></span>OSS maintainers</div><div class="ai-cell">AI-generated zero-day reports arrive at machine velocity against pipelines designed for 1&ndash;5/yr. Simultaneously the highest-value social engineering targets. No triage infrastructure, no funding, no legal protection.</div><div class="ai-cell ai-red">Existential pressure</div><div class="ai-cell ai-red">Critically low</div></div>
    <div class="ai-row"><div class="ai-cell ai-name"><span class="dot dot-crit"></span>Security tool vendors</div><div class="ai-cell">Trivy proved security tooling is the highest-value CI/CD attack surface. A Glasswing-class model in pipelines is that paradox at maximum privilege. Every scanner must now be simultaneously trusted tool and potential entry point.</div><div class="ai-cell ai-red">Tool = target</div><div class="ai-cell ai-amb">Partial</div></div>
    <div class="ai-row"><div class="ai-cell ai-name"><span class="dot dot-crit"></span>AI/ML stack owners</div><div class="ai-cell">LiteLLM proved the AI gateway is a single-point-of-failure for all LLM credentials. TensorFlow, Ray, LangChain not named Glasswing partners. Fastest-growing critical infrastructure has the least coordinated defense.</div><div class="ai-cell ai-red">Underprotected</div><div class="ai-cell ai-red">Low</div></div>
    <div class="ai-row"><div class="ai-cell ai-name"><span class="dot dot-high"></span>Enterprise consumers</div><div class="ai-cell">If your environment touched Trivy, KICS, LiteLLM, or Axios between March 19&ndash;April 3: assume full compromise. Glasswing findings will generate advisory floods with no increase in patching capacity.</div><div class="ai-cell ai-amb">Patch cliff incoming</div><div class="ai-cell ai-amb">Variable</div></div>
    <div class="ai-row"><div class="ai-cell ai-name"><span class="dot dot-high"></span>Governments</div><div class="ai-cell">CISA KEV assumes human-paced sequential disclosure. Glasswing produces thousands of simultaneous zero-day advisories. The entire regulatory vulnerability management framework is now structurally obsolete.</div><div class="ai-cell ai-amb">Framework obsolete</div><div class="ai-cell ai-amb">Lagging</div></div>
    <div class="ai-row"><div class="ai-cell ai-name"><span class="dot dot-med"></span>Other AI labs</div><div class="ai-cell">The 13th lab to cross a comparable capability threshold now operates against an explicit precedent. Whether voluntary restraint scales as a governance mechanism is the defining governance question of the next decade.</div><div class="ai-cell ai-teal">Precedent set</div><div class="ai-cell ai-amb">Unknown</div></div>
    <div class="ai-row"><div class="ai-cell ai-name"><span class="dot dot-low"></span>Nation-state actors</div><div class="ai-cell">Glasswing&rsquo;s announcement is a capability advertisement and development benchmark. March 2026 demonstrated they are already operational against this infrastructure.</div><div class="ai-cell ai-red">Capability signal sent</div><div class="ai-cell ai-red">Already operational</div></div>
  </div>

  <h3 style="margin-top:1.5rem">Three scenarios for the next 24 months</h3>
  <div class="scenario-grid">
    <div class="scenario-card s-opt"><h4>The optimist scenario</h4><p>Glasswing catalyzes structural overhaul: maintainer funding matures, NVD/CVE redesigned for AI-velocity, SLSA becomes a registry requirement, AARM-class governance standardized. OSS-Fuzz precedent holds. Glasswing is remembered as the moment the industry organized around AI-powered defense.</p></div>
    <div class="scenario-card s-real"><h4>The realist scenario</h4><p>Glasswing produces a multi-year patch backlog overwhelming maintainers. A second lab crosses the threshold and releases publicly. The LiteLLM breach pattern is replicated against Glasswing partner infrastructure. The head start was real &mdash; but insufficient against the adversary innovation pace March 2026 demonstrated.</p></div>
    <div class="scenario-card s-pess"><h4>The pessimist scenario</h4><p>Mythos-class capability has already proliferated. Adversaries read disclosures before patches ship. A Glasswing partner deployment is compromised via the same credential-harvesting pattern TeamPCP used on Trivy. Glasswing is remembered not as OSS-Fuzz but as the moment the most powerful vulnerability tool ever built was handed to the supply chain its adversaries had already walked through.</p></div>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part VI &mdash; The honest accounting</span>
  <h2>Pros, cons, and tensions that don&rsquo;t resolve</h2>

  <div class="two-col">
    <div class="pro-card">
      <span class="card-label green-label">Case for Glasswing</span>
      <ul class="bullets">
        <li>Defenders get a time-boxed head start before equivalent offensive capability proliferates</li>
        <li>Cross-industry coordination at unprecedented scale: Linux Foundation and CrowdStrike alongside JPMorganChase</li>
        <li>OSS maintainers included as first-class partners, not CVE email recipients</li>
        <li>$4M in OSS donations acknowledges the maintainer resource problem at the root of every incident above</li>
        <li>Technical findings shared industry-wide &mdash; not a competitive moat</li>
        <li>Sandbox escape disclosed publicly in full technical detail</li>
        <li>Historical fuzzer precedent: AFL/OSS-Fuzz caused the same alarm and became strongly net-beneficial</li>
        <li>Withholding from general release while developing safeguards is the correct call given demonstrated autonomous behavior</li>
      </ul>
    </div>
    <div class="con-card">
      <span class="card-label red-label">What Glasswing doesn&rsquo;t fix</span>
      <ul class="bullets">
        <li>Thousands of zero-days flood the same maintainers the March 2026 attacks just finished targeting</li>
        <li>The sandbox escape + autonomous posting is the threat model for a Glasswing-class agent inside CI/CD pipelines TeamPCP already compromised</li>
        <li>Controlled access programs leak &mdash; 12 partners becomes 40 becomes API access becomes derivatives outside governance</li>
        <li>The ML stack underrepresented in partners and just had the most dangerous breach of the year</li>
        <li>Mutable git tags and maintainer social engineering are not vulnerability-scanning problems</li>
        <li>The Everybody/Somebody/Nobody loop doesn&rsquo;t dissolve because discovery is automated</li>
        <li>CISA KEV deadline for CVE-2026-33634 is April 9 &mdash; agencies remediating last week while this week&rsquo;s capability rolls out</li>
        <li>Legal dispute with the White House complicates discussions with federal officials about Mythos access</li>
      </ul>
    </div>
  </div>

  <div class="tension-grid">
    <div class="tc"><h4>Discovery vs. remediation</h4><p>Mythos finds bugs at machine speed. Maintainers who patch them were just social-engineered by nation-states. The gap is structural and widening from both ends simultaneously.</p></div>
    <div class="tc"><h4>Tooling trust vs. tooling risk</h4><p>The more trusted a security tool, the more pipeline access it holds, the higher its attack value. Trivy proved this. Glasswing is that tool at maximum privilege across the most critical environments on earth.</p></div>
    <div class="tc"><h4>Controlled release vs. diffusion</h4><p>Withholding Mythos buys months. CanisterWorm already uses blockchain C2. The adversary innovation cycle is not paused while Glasswing runs its head-start window.</p></div>
    <div class="tc"><h4>Technical controls vs. the human surface</h4><p>No SLSA requirement, no SBOM mandate, no Glasswing scan prevents the Axios attack. Two weeks of relationship-building beats all of it. The maintainer is the irreducible human surface.</p></div>
    <div class="tc"><h4>Governance vs. capability velocity</h4><p>AARM-class governance for agentic AI security tooling doesn&rsquo;t exist at the standard-body level. CISA issues KEV deadlines for last week&rsquo;s breach while this week&rsquo;s capability is announced.</p></div>
    <div class="tc"><h4>Incentives unchanged at the root</h4><p>Maintainer economics: stability and performance, security as afterthought. Every incident from Exim in 2014 to Axios in 2026 traces to this unchanged fact. $4M in donations is a signal, not a fix.</p></div>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part VII &mdash; Key takeaways</span>
  <h2>What this means if you work in security, build OSS, run AI infrastructure, or set policy</h2>

  <div class="takeaway">
    <span class="tk-num">Takeaway 01 &mdash; For everyone</span>
    <div class="tk-head">The scarcity of finding capability is over. The crisis of fixing it is just beginning.</div>
    <p>The old security model assumed finding vulnerabilities was the hard part. Disclosure pipelines, CVE assignment, patch SLAs, and regulatory mandates were all designed around that scarcity. Glasswing eliminates it. The downstream consequence &mdash; who triages, who patches, through what supply chain, under what regulatory mandate, before the adversary reads the disclosure &mdash; is structurally unsolved. The bottleneck has moved from discovery to everything that comes after it.</p>
  </div>

  <div class="takeaway tk-red">
    <span class="tk-num">Takeaway 02 &mdash; For security teams and CISOs</span>
    <div class="tk-head">If your environment touched Trivy, KICS, LiteLLM, or Axios between March 19&ndash;April 3, 2026: assume full compromise. Rotate everything.</div>
    <p>AWS IAM keys, GCP service account tokens, Azure env vars, Kubernetes service account tokens, SSH private keys, LLM API keys, GitHub PATs, npm publish tokens, and every database credential accessible to any CI/CD runner during those windows. The LiteLLM Kubernetes lateral movement mechanism &mdash; privileged pods deployed to every node via kube-system &mdash; means you may retain persistent backdoors at the cluster layer even after removing the malicious packages. The sysmon.service backdoor polling checkmarx.zone every 50 minutes is an active access channel on any unremediated Linux host. CISA KEV deadline for CVE-2026-33634 is April 9. That is not a suggestion.</p>
  </div>

  <div class="takeaway tk-teal">
    <span class="tk-num">Takeaway 03 &mdash; For OSS maintainers</span>
    <div class="tk-head">You are now the highest-value social engineering target in the software ecosystem. Technical controls around your package mean nothing if someone spends two weeks becoming your colleague.</div>
    <p>The Axios attack had no technical entry point. UNC1069 spent two weeks building a relationship with one maintainer. The ROI at 100M weekly downloads is exceptional. SLSA build provenance and OIDC-attested publishing are your most important defensive investments &mdash; not because they stop the social engineering, but because their absence is now the only reliable detection signal that a release was not produced through your normal process. If you maintain a high-impact package and you are not requiring SLSA level 2 and OIDC provenance on every release, your users cannot distinguish your releases from an attacker&rsquo;s.</p>
  </div>

  <div class="takeaway tk-amber">
    <span class="tk-num">Takeaway 04 &mdash; For AI/ML infrastructure teams</span>
    <div class="tk-head">The LiteLLM compromise is the canary. Your AI gateway is your credential vault. Treat it accordingly.</div>
    <p>LiteLLM centralizes API keys for every LLM provider you use. A single <code>.pth</code> file exploit exfiltrates all of them simultaneously, before any import, on every Python invocation. The architectural pattern &mdash; centralized AI gateway with ambient access to all provider credentials &mdash; is the standard pattern for multi-provider AI deployments. HuggingFace&rsquo;s pickle deserialization problem is architectural. Ray&rsquo;s ShadowRay gives unauthenticated RCE on the distributed compute layer. The ML stack was designed by researchers optimizing for productivity. Those design choices are now colliding with nation-state threat models in production.</p>
  </div>

  <div class="takeaway tk-blue">
    <span class="tk-num">Takeaway 05 &mdash; For regulators and policy makers</span>
    <div class="tk-head">Your entire vulnerability management framework was designed for human-paced sequential disclosure. It is now structurally obsolete. You have roughly 18 months before Glasswing-class findings flood the system.</div>
    <p>CISA KEV, NVD, CVE assignment, FedRAMP continuous monitoring, and CMMC patch requirements all assume vulnerability discovery is scarce and disclosure is sequential. Glasswing produces thousands of simultaneous zero-day advisories. Nobody is currently modeling what happens when federal agencies receive 1,000 simultaneous zero-day advisories against systems they are contractually obligated to patch within defined windows. The compliance stack needs a redesign that nobody has started yet &mdash; and it needs to start before the disclosure flood, not after.</p>
  </div>

  <div class="takeaway tk-coral">
    <span class="tk-num">Takeaway 06 &mdash; For the AI industry broadly</span>
    <div class="tk-head">Glasswing set the doctrine. Whether it becomes a norm or a competitive disadvantage depends on whether the next lab follows it voluntarily &mdash; and voluntary restraint has a 30-year track record in OSS security.</div>
    <p>Anthropic made a unilateral decision to withhold its most capable model. That is the right call. It also costs Anthropic commercially. A lab with different commercial pressures, operating under different regulatory environments or different values, may calculate differently. The Glasswing doctrine is meaningful only if it becomes a norm enforced by something more durable than voluntary restraint. Right now it is voluntary restraint &mdash; the same voluntary restraint that left the Fairy Dust bugs unfixed for 27 years.</p>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Part VIII &mdash; Thought-provoking ideas</span>
  <h2>The questions nobody is asking loudly enough</h2>

  <div class="thought-grid">
    <div class="thought-card t-purple">
      <span class="thought-label">Structural paradox</span>
      <h4>Who patches the patcher&rsquo;s patcher?</h4>
      <p>Glasswing finds vulnerabilities in OSS. Maintainers patch them. But those maintainers are the same humans TeamPCP and UNC1069 just proved are socially engineerable, under-resourced, and running CI/CD pipelines on tooling that was itself compromised. The patch tsunami Glasswing generates hits the most vulnerable humans in the ecosystem hardest. Finding the bug is now the easy part. Delivering a trusted patch through a supply chain that two nation-states spent March 2026 walking through is the unsolved problem.</p>
    </div>
    <div class="thought-card t-red">
      <span class="thought-label">Disclosure timing risk</span>
      <h4>What if the adversary reads the Glasswing disclosure before the patch ships?</h4>
      <p>Glasswing commits to sharing findings so the whole industry benefits. In a world where Mythos-class capability may have already proliferated to nation-state programs, the window between &ldquo;Glasswing discloses a critical finding&rdquo; and &ldquo;adversary weaponizes it&rdquo; may be shorter than the window between &ldquo;maintainer receives the report&rdquo; and &ldquo;patch ships.&rdquo; Disclosure velocity and patch velocity must be engineered together. They currently aren&rsquo;t. This is the Log4Shell lesson nobody learned.</p>
    </div>
    <div class="thought-card t-teal">
      <span class="thought-label">Governance question</span>
      <h4>Has the open source social contract been unilaterally rewritten &mdash; and was anyone asked?</h4>
      <p>The implicit agreement since the 1980s: take the code, contribute back, and the community collectively maintains security. Glasswing implicitly declares that contract failed. The OSS community was not consulted. Who owns the findings? Who controls the disclosure timeline? Who is liable for the gap between Glasswing&rsquo;s report and the maintainer&rsquo;s patch? These are the governance questions that will determine whether Glasswing succeeds or becomes the most consequential unforced error in software security history.</p>
    </div>
    <div class="thought-card t-amber">
      <span class="thought-label">Regulatory cliff</span>
      <h4>Is the compliance framework structurally obsolete &mdash; and is anyone modeling what happens when it breaks?</h4>
      <p>CISA KEV, NVD, CVE assignment, NIST SP 800-53, FedRAMP continuous monitoring &mdash; all designed for human-paced sequential disclosure. A single Glasswing run can produce more critical findings than NVD processes in a year. This is not a hypothetical stress test. It is the next 18 months. The compliance stack needs a redesign that nobody has started yet.</p>
    </div>
    <div class="thought-card t-blue">
      <span class="thought-label">Most important unresolved question</span>
      <h4>Is the Glasswing deployment itself a Trivy-shaped target &mdash; and does anyone have governance for what happens when it escapes?</h4>
      <p>Mythos already escaped its sandbox unprompted, gained internet access, and posted exploit details to public sites. Glasswing deploys this model inside the CI/CD pipelines of 52 partner organizations. TeamPCP&rsquo;s entire March 2026 campaign was built on one observation: a privileged, trusted tool inside a pipeline is the highest-value target in that pipeline. Glasswing is that tool at maximum privilege. AARM-class runtime controls for AI security tooling do not exist at the standard-body level.</p>
    </div>
    <div class="thought-card t-coral">
      <span class="thought-label">Uncomfortable truth</span>
      <h4>The voluntary restraint that produced Glasswing is structurally identical to the voluntary restraint that left 27-year-old bugs unfixed.</h4>
      <p>Anthropic chose to withhold Mythos. That reflects genuinely good values. It is also entirely voluntary. The same diffuse, goodwill-based governance structure that produced the Everybody/Somebody/Nobody dynamic in OSS security for thirty years now governs whether the most powerful vulnerability-exploitation capability ever built gets responsibly deployed. Neither assumption scales. Both fail in the same direction: through the gap between good intentions and durable institutional structures.</p>
    </div>
  </div>

  <hr class="gw-hr">
  <span class="section-label">Conclusion</span>
  <h2>What it looks like when you hold the whole picture at once</h2>
  <p>Project Glasswing was announced the same week CISA issued a KEV remediation deadline for the Trivy supply chain compromise. Those two events are the same story told from opposite ends of the capability spectrum, converging at the exact moment the old model finally runs out of runway.</p>
  <p>The old model: open source is maintained by volunteers, audited by community, secured by collective attention. The new reality &mdash; forced by Glasswing and confirmed by March 2026 &mdash; is that open source is maintained by individuals who are the highest-value social engineering targets in the ecosystem, its security tooling is weaponizable by nation-states in under three hours, and the only entity currently capable of auditing it at adequate scale is an AI model that won&rsquo;t stay in its sandbox when it has something to prove.</p>
  <p>The fairy dust didn&rsquo;t disappear. It moved one abstraction layer higher with each generation. In 2014 it was &ldquo;everyone&rsquo;s looking at the code.&rdquo; In 2024 it was &ldquo;our security tooling is trustworthy.&rdquo; In 2026 it is &ldquo;our AI security deployment is safe and our governance frameworks are adequate.&rdquo; The pattern is consistent. Only the substrate changes.</p>

  <div class="final-callout">
    <div class="final-top"><p>The fairy dust version of 2026 says: Glasswing finds all the bugs. Trusted partners patch them. Maintainers absorb the disclosure flood. The AI scanner stays in its sandbox. The compliance framework adapts. The open source social contract holds. The next lab follows the doctrine. Everyone was looking at the code.</p></div>
    <div class="final-bottom"><p>The data says: we automated one side of a catastrophically lopsided equation, pointed a firehose at a garden never designed to handle it, in the same month two nation-state actors proved the fastest path through your most critical AI infrastructure runs through the one engineer who maintains the security scanner &mdash; and that the scanner itself was the backdoor. The 27-year-old OpenBSD bug was always there. Glasswing found it. Now ask who patches it, through what supply chain, before the adversary reads the disclosure, while the patcher is fielding a Teams meeting request from a very convincing stranger.</p></div>
  </div>

  <div class="tag-row">
    <span class="tag">Project Glasswing</span><span class="tag">Claude Mythos</span><span class="tag">Glasswing Doctrine</span><span class="tag">Trivy</span><span class="tag">LiteLLM</span><span class="tag">Axios</span><span class="tag">TeamPCP</span><span class="tag">UNC1069</span><span class="tag">Sapphire Sleet</span><span class="tag">CanisterWorm</span><span class="tag">CVE-2026-33634</span><span class="tag">DEF CON 22</span><span class="tag">OSS social contract</span><span class="tag">supply chain</span><span class="tag">AARM</span><span class="tag">ML stack</span><span class="tag">XZ Utils</span><span class="tag">compliance cliff</span><span class="tag">SLSA provenance</span><span class="tag">maintainer economics</span><span class="tag">Morphogenetic SOC</span>
  </div>
  {% endcomment %}

  <div class="conflict-box" style="margin-top:2rem">
    <div class="gw-byline"><strong>John Menerick</strong> is a senior information security architect and engineer (CISSP, NSA, CKS/CKA). He presented Open Source Fairy Dust at DEF CON 22 in 2014 and publishes the Morphogenetic SOC series at securesql.info.</div>
    <span class="conflict-label">Conflict of interest disclosure</span>
    <p>The author is affiliated with Project Glasswing. This post reflects the author&rsquo;s independent analysis and opinions only, and does not represent the views or positions of Anthropic, Project Glasswing, or any Glasswing launch partner. Readers should weigh the author&rsquo;s affiliation accordingly when evaluating assessments of the initiative&rsquo;s merits and limitations.</p>
  </div>


</div><!-- /glasswing-wrapper -->
