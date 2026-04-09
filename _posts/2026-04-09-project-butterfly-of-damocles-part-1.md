---
layout: post
title: "Part I — The original quantitative case: internet infrastructure is not OK"
date: 2026-04-09
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 2
categories: ["Security", "Open Source", "Project Glasswing"]
tags: ["DEF CON 22", "Exim", "OpenSSL", "Bind", "vulnerability density", "Heartbleed", "open source security", "NVD", "CVE", "maintainer economics", "C/C++", "static analysis", "dynamic analysis"]
excerpt: "The Open Source Fairy Dust talk wasn't a rhetorical exercise. It was a data exercise across 2,000+ projects. Almost nothing critical lived in the safe quadrant — and the outliers told a story about institutional failure, not individual negligence."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">



<hr class="gw-hr">

<!-- ── Opening ── -->

<div class="ep-lede-block">
  <p class="ep-lede">This is the episode where I have to explain a chart to you. Not a simple chart. A chart with a log scale on both axes, vulnerability density on the X axis, total critical CVE count on the Y axis, and bubble sizes representing codebase scale. A chart where up and to the right means &ldquo;things that are destroying the internet right now,&rdquo; and down and to the left means &ldquo;things that are doing their best.&rdquo;</p>
  <p class="ep-lede">Almost nothing critical lived in the safe quadrant.</p>
  <p class="ep-lede">That was 2014. The projects have changed. The quadrant has not.</p>
</div>

<div class="hero-stats">
  <div class="hstat"><div class="hstat-num">2,000+</div><div class="hstat-sub">Open source projects analyzed across the DEF CON 22 dataset</div></div>
  <div class="hstat"><div class="hstat-num">13,000</div><div class="hstat-sub">Critical CVEs in Exim alone &mdash; the most dangerous mail server you&rsquo;ve never audited</div></div>
  <div class="hstat"><div class="hstat-num">4,500</div><div class="hstat-sub">Critical CVEs in OpenSSL &mdash; including Heartbleed, everybody&rsquo;s problem</div></div>
  <div class="hstat"><div class="hstat-num">0</div><div class="hstat-sub">Number of projects that scored well because &ldquo;everyone was looking at the code&rdquo;</div></div>
</div>

<hr class="gw-hr">
<span class="section-label">Setting the stage</span>
<h2>Las Vegas, August 2014: a room full of hackers and a chart nobody wanted to see</h2>

<p>DEF CON 22 was held at the Rio Hotel and Casino. The security research community was still processing Heartbleed, which had been disclosed four months earlier in April. The talk was called &ldquo;Open Source Fairy Dust,&rdquo; and the core argument was simple enough to summarize on a t-shirt: <em>the internet runs on software maintained by people who are never paid to care about security, and nobody has actually looked at most of it.</em></p>

<p>The data behind that argument took roughly six months to compile, running automated static and dynamic analysis pipelines across 2,000+ open source projects using a fleet of AWS spot instances, Jenkins for orchestration, clang, Breakman, and FindBugs for static analysis, DTrace and GDB for dynamic analysis, and the National Vulnerability Database as a cross-reference to validate findings and calibrate the tooling. Crucially, to handle the sheer volume of data, I applied machine learning techniques and clustering algorithms to separate the wheat from the chaff of vulnerability mountain, filtering out noise to surface true positives. The methodology had flaws, as any large-scale automated analysis does. But the signal was so strong that the flaws in the methodology didn&rsquo;t change the conclusion by an order of magnitude. The projects that were dangerous were <em>very</em> dangerous.</p>

<div class="infobox">
  <p>A note on the dataset: the 2,000+ projects analyzed were not a random sample. They were weighted toward projects that actually run the internet &mdash; web servers, DNS resolvers, mail servers, hypervisors, crypto libraries, security tools, and the most commonly downloaded packages from early npm and PyPI. The dataset was biased toward &ldquo;things that matter if they&rsquo;re broken.&rdquo; That bias means the results are worse than they would have been for a truly random sample. It does not mean I overstated the risk for the infrastructure that was actually being analyzed.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The methodology</span>
<h2>How do you measure &ldquo;how broken is the internet&rdquo; with a Jenkins pipeline?</h2>

<p>The core metric was vulnerability density: for every thousand lines of code, how many critical vulnerabilities were present? This was plotted on a log scale because the distribution was not normal &mdash; it was power-law shaped, with a small number of projects accounting for a disproportionate share of total critical CVE count. Exim was not a mild outlier. It was a category unto itself.</p>

<p>The density metric was calculated two ways: from the automated static/dynamic analysis findings, and from NVD historical data. Both were plotted. Where they diverged significantly, that divergence was itself informative &mdash; it usually meant either that the automated tooling was finding things NVD hadn&rsquo;t catalogued yet (newly discovered), or that NVD had catalogued things the automated tooling missed (known but hard to find programmatically). The cross-reference gave confidence intervals.</p>

<div class="methodology-grid">
  <div class="method-card">
    <div class="method-icon method-purple">&#9670;</div>
    <h4>Static analysis</h4>
    <p>Clang static analyzer, Coverity, Fortify, Breakman (Ruby), FindBugs (Java). Identified potential memory safety issues, injection vectors, and logic errors without executing code. High false-positive rate, but useful for bounding the search space before dynamic analysis.</p>
    <div class="method-caveat">Limitation: Won&rsquo;t find everything. Best at memory management and type safety issues in C/C++.</div>
  </div>
  <div class="method-card">
    <div class="method-icon method-blue">&#9670;</div>
    <h4>Dynamic analysis</h4>
    <p>DTrace, GDB, afl-fuzz, custom fuzzing harnesses. Executed the software under instrumentation with genetically and evolutionary malformed inputs. Found runtime behaviors that static analysis missed. Provided code coverage metrics to bound confidence in the findings.</p>
    <div class="method-caveat">Limitation: Only as good as the test inputs and the related mutated genetic offspring from said test inputs. Hard to achieve full code coverage at scale.</div>
  </div>
  <div class="method-card">
    <div class="method-icon method-teal">&#9670;</div>
    <h4>NVD cross-reference</h4>
    <p>National Vulnerability Database historical data used to calibrate findings. Projects with high CVE density historically were expected to have high density in the automated analysis. Divergences were investigated manually.</p>
    <div class="method-caveat">Limitation: NVD only covers disclosed, assigned CVEs. Unknown unknowns are definitionally absent.</div>
  </div>
  <div class="method-card">
    <div class="method-icon method-amber">&#9670;</div>
    <h4>Manual review</h4>
    <p>Selected findings from automated tools were manually verified. This was the rate-limiting step &mdash; there are only so many hours in a day. The most interesting findings (high-confidence criticals in widely-deployed projects) were prioritized.</p>
    <div class="method-caveat">Limitation: Artisanal. Not scalable. This is the exact gap that Glasswing closes twelve years later.</div>
  </div>
</div>

<p>The infrastructure behind this analysis was not sophisticated by 2026 standards. A few hundred AWS spot instances, a Jenkins pipeline, some Python glue code to aggregate findings, and a lot of manual review. What made it novel in 2014 was not the technology &mdash; it was doing it systematically across a large number of projects that nobody had bothered to look at, and being willing to publish what was found even when the findings were uncomfortable.</p>

<p>The uncomfortable part: nobody was looking at the code. The &ldquo;many eyes make all bugs shallow&rdquo; hypothesis &mdash; Linus&rsquo;s Law &mdash; was and remains empirically unsupported for most open source projects. The projects that received serious security scrutiny were a small fraction of the projects being deployed everywhere. The rest operated on collective assumption.</p>

<hr class="gw-hr">
<span class="section-label">The chart</span>
<h2>Up and to the right is terrifying. Almost everything critical lives there.</h2>

<p>Before diving into the individual projects, it helps to understand what the chart is actually showing and why the log scale matters. Vulnerability density is not uniformly distributed across a codebase &mdash; it tends to cluster in specific subsystems (memory management, input parsing, cryptographic implementation). A project with 100,000 lines of code and 500 critical vulnerabilities is not the same as a project with 1,000 lines and 5 critical vulnerabilities, even though they have the same density. Scale matters. The bubble size in the chart below represents codebase scale.</p>

<div class="chart-explainer">
  <div class="chart-axis-label chart-axis-y">Total critical CVEs &uarr; (log scale)</div>
  <div class="chart-area">
    <div class="danger-zone-label">&#9888; danger zone</div>
    <div class="safe-zone-label">&#9679; relatively safer</div>
    <!-- Exim -->
    <div class="bubble b-critical" style="width:52px;height:52px;bottom:82%;left:78%">
      <span class="b-label">Exim<br><small>13K</small></span>
    </div>
    <!-- Bind 8 -->
    <div class="bubble b-high" style="width:38px;height:38px;bottom:72%;left:64%">
      <span class="b-label">Bind 8<br><small>6K</small></span>
    </div>
    <!-- OpenSSL old -->
    <div class="bubble b-critical" style="width:34px;height:34px;bottom:64%;left:56%">
      <span class="b-label">OpenSSL<br><small>4.5K</small></span>
    </div>
    <!-- Linux -->
    <div class="bubble b-info" style="width:48px;height:48px;bottom:58%;left:30%">
      <span class="b-label">Linux<br><small>3.2K</small></span>
    </div>
    <!-- Bind 9 -->
    <div class="bubble b-high" style="width:30px;height:30px;bottom:52%;left:48%">
      <span class="b-label">Bind 9<br><small>2K</small></span>
    </div>
    <!-- FreeRADIUS -->
    <div class="bubble b-critical" style="width:26px;height:26px;bottom:46%;left:52%">
      <span class="b-label">FreeRAD.<br><small>mod.</small></span>
    </div>
    <!-- OpenPGP.js -->
    <div class="bubble b-critical" style="width:22px;height:22px;bottom:42%;left:60%">
      <span class="b-label">OpenPGP<br><small>mod.</small></span>
    </div>
    <!-- wget -->
    <div class="bubble b-high" style="width:22px;height:22px;bottom:28%;left:62%">
      <span class="b-label">wget</span>
    </div>
    <!-- Apache -->
    <div class="bubble b-safe" style="width:38px;height:38px;bottom:35%;left:20%">
      <span class="b-label">Apache<br><small>290</small></span>
    </div>
    <!-- nginx -->
    <div class="bubble b-safe" style="width:28px;height:28px;bottom:26%;left:14%">
      <span class="b-label">nginx</span>
    </div>
    <!-- OpenVPN -->
    <div class="bubble b-safe" style="width:22px;height:22px;bottom:18%;left:17%">
      <span class="b-label">OpenVPN</span>
    </div>
    <!-- Xen -->
    <div class="bubble b-info" style="width:24px;height:24px;bottom:22%;left:22%">
      <span class="b-label">Xen</span>
    </div>
    <!-- Snort -->
    <div class="bubble b-high" style="width:22px;height:22px;bottom:14%;left:38%">
      <span class="b-label">Snort</span>
    </div>
  </div>
  <div class="chart-axis-label chart-axis-x">Critical vulnerability density (criticals per KLOC) &rarr; (log scale)</div>
  <div class="chart-legend">
    <span class="leg-dot leg-crit"></span><span class="leg-txt">Mail/Auth/Crypto</span>
    <span class="leg-dot leg-high"></span><span class="leg-txt">DNS/Net tools</span>
    <span class="leg-dot leg-safe"></span><span class="leg-txt">Web servers</span>
    <span class="leg-dot leg-info"></span><span class="leg-txt">OS/Hypervisor</span>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">Project deep dives</span>
<h2>The outliers, one by one</h2>

<p>The chart tells the aggregate story. The individual projects tell the causal story. Each one is a different flavor of the same underlying failure: the people writing the code did not have the time, resources, or incentive to make it secure, and the people depending on the code assumed someone else had checked.</p>

<!-- ── EXIM ── -->
<div class="project-deep-dive pd-critical">
  <div class="pd-header">
    <div class="pd-meta">
      <span class="pd-name">Exim</span>
      <span class="pd-category">Mail transfer agent &middot; C &middot; est. 1995</span>
    </div>
    <div class="pd-stats">
      <div class="pd-stat"><div class="pd-stat-num">~13,000</div><div class="pd-stat-label">Critical CVEs (2014 dataset)</div></div>
      <div class="pd-stat"><div class="pd-stat-num">~35K</div><div class="pd-stat-label">Lines of code</div></div>
      <div class="pd-stat pd-stat-danger"><div class="pd-stat-num">~1 / 2.7</div><div class="pd-stat-label">KLOC per critical vuln</div></div>
    </div>
  </div>
  <div class="pd-body">
    <p>Exim is the mail transfer agent that quietly handles the most email in the world. Not Gmail. Not Exchange. Exim. Installed by default on more Linux distributions than any other MTA, powering universities, ISPs, corporate mail infrastructure, and government systems across the globe. And in 2014, it had approximately one critical vulnerability for every 2.7 thousand lines of code.</p>
    <p>The reason Exim sits so dramatically in the upper-right danger zone is not malice or incompetence. It is the intersection of three structural facts: Exim is written in C, which means every memory management decision is a potential attack surface. Exim processes untrusted input from the open internet by design &mdash; that is its entire purpose. And Exim was, for most of its history, maintained by a very small team of volunteers with no dedicated security engineering support.</p>
    <p>The canonical Exim vulnerability class is not subtle. It is buffer overflows and integer overflows in the SMTP input processing path. An attacker sends a carefully crafted envelope to an Exim server; Exim trusts the length field; Exim writes past the end of a buffer; code execution. The specific mechanisms vary across the 13,000 criticals, but the root cause is consistent: C code that handles external input without sufficient bounds checking, written by people whose mental model was &ldquo;legitimate SMTP clients send well-formed envelopes.&rdquo;</p>
    <div class="pd-timeline">
      <div class="pd-tl-item"><span class="pd-tl-year">1995</span><span class="pd-tl-event">Initial release by Philip Hazel at University of Cambridge. Designed to replace Smail for University use.</span></div>
      <div class="pd-tl-item"><span class="pd-tl-year">2000s</span><span class="pd-tl-event">Becomes default MTA on Debian/Ubuntu. Deployment footprint expands dramatically beyond original university use case.</span></div>
      <div class="pd-tl-item"><span class="pd-tl-year">2010</span><span class="pd-tl-event">CVE-2010-4344: remote code execution in SMTP string expansion. Exploited in the wild within days of disclosure. Classic Exim pattern.</span></div>
      <div class="pd-tl-item"><span class="pd-tl-year">2014</span><span class="pd-tl-event">DEF CON 22 analysis: 13,000 criticals across the dataset. Exim is the chart&rsquo;s most extreme outlier by a significant margin.</span></div>
      <div class="pd-tl-item"><span class="pd-tl-year">2019</span><span class="pd-tl-event">CVE-2019-10149 (&ldquo;Return of the WIZard&rdquo;): remote code execution, Exim 4.87&ndash;4.91. Exploited by Sandworm (Russian GRU). Pattern holds.</span></div>
      <div class="pd-tl-item pd-tl-recent"><span class="pd-tl-year">2021</span><span class="pd-tl-event">21Nails: 21 vulnerabilities disclosed simultaneously, 10 exploitable remotely. Exim still accounts for ~60% of internet-facing mail server deployments.</span></div>
    </div>
    <div class="infobox red">
      <p>The DEF CON 22 talk asked the audience to guess the most dangerous project before revealing the chart. The correct answer &mdash; Exim &mdash; was guessed by exactly one person. Most guesses were Sendmail (reasonable but outdated), Exchange (not open source), or a DNS server. The fact that the internet&rsquo;s most dangerous mail server was not the internet&rsquo;s most famous mail server was itself part of the point: the projects that get scrutiny are not always the projects that need it.</p>
    </div>
  </div>
</div>

<!-- ── BIND ── -->
<div class="project-deep-dive pd-high">
  <div class="pd-header">
    <div class="pd-meta">
      <span class="pd-name">BIND (Bind 8 &amp; 9)</span>
      <span class="pd-category">DNS server &middot; C &middot; est. 1984</span>
    </div>
    <div class="pd-stats">
      <div class="pd-stat"><div class="pd-stat-num">~6,000</div><div class="pd-stat-label">Critical CVEs (Bind 8)</div></div>
      <div class="pd-stat"><div class="pd-stat-num">~2,000</div><div class="pd-stat-label">Critical CVEs (Bind 9)</div></div>
      <div class="pd-stat pd-stat-warn"><div class="pd-stat-num">~40 yrs</div><div class="pd-stat-label">Running the internet&rsquo;s phone book</div></div>
    </div>
  </div>
  <div class="pd-body">
    <p>BIND is the Berkeley Internet Name Domain server &mdash; the software that resolves domain names to IP addresses for a substantial fraction of the internet. If BIND has a vulnerability, the internet&rsquo;s directory service becomes an attack surface. DNS cache poisoning, remote code execution, amplification attacks for DDoS &mdash; the attack classes enabled by DNS vulnerabilities are among the most consequential in network security.</p>
    <p>Bind 8&rsquo;s position in the danger zone was not a surprise to anyone who had been paying attention. The BIND team had been producing security advisories at a steady cadence for years. What the DEF CON 22 analysis added was scale and context: Bind 8 had approximately 6,000 critical vulnerabilities across its history, the vast majority of which were memory management issues in C code handling DNS protocol parsing. The pattern was identical to Exim: external untrusted input, C, insufficient bounds checking, volunteers.</p>
    <p>The more interesting story was Bind 9. The BIND team had recognized by the early 2000s that Bind 8&rsquo;s architecture was fundamentally broken from a security perspective, and undertook a complete rewrite. Bind 9 was positioned as the security-conscious successor. The DEF CON 22 data showed Bind 9 at approximately 2,000 critical CVEs &mdash; meaningfully better than Bind 8, but still firmly in the high-risk zone. The rewrite improved the security posture without solving the underlying structural problem: a codebase written in C, processing untrusted DNS packets from the open internet, maintained by a resource-constrained team.</p>
    <div class="infobox amber">
      <p>The Bind 9 story foreshadows a pattern that repeats throughout the dataset and through history: security rewrites improve the situation without resolving it. You can fix the specific vulnerabilities that motivated the rewrite. You cannot simultaneously fix the language, the deployment environment, the maintainer resource constraints, and the incentive structure. Bind 9 was better than Bind 8. It was not safe. It was a better approximation of safety produced by people who genuinely cared, working within structural constraints that made &ldquo;actually safe&rdquo; unreachable.</p>
    </div>
    <div class="callout-box">
      <div class="callout-label">The Kaminski Incident &mdash; 2008</div>
      <p>Security researcher Dan Kaminski discovered a fundamental flaw in the DNS protocol itself that allowed cache poisoning attacks against virtually all DNS implementations, including BIND. The disclosure was handled through an unprecedented coordinated effort &mdash; Kaminski worked with DNS vendors for months before public disclosure to ensure patches were ready simultaneously. Despite the coordination, the patch deployment was incomplete for years. The DEF CON 22 talk referenced this directly: the DNS administrators who delayed patching did so because &ldquo;change is hard&rdquo; and they didn&rsquo;t personally suffer the consequences of running unpatched DNS. This is the incentive structure problem in its purest form.</p>
    </div>
  </div>
</div>

<!-- ── OPENSSL ── -->
<div class="project-deep-dive pd-critical">
  <div class="pd-header">
    <div class="pd-meta">
      <span class="pd-name">OpenSSL</span>
      <span class="pd-category">TLS/SSL library &middot; C &middot; est. 1998</span>
    </div>
    <div class="pd-stats">
      <div class="pd-stat"><div class="pd-stat-num">~4,500</div><div class="pd-stat-label">Critical CVEs (pre-fork dataset)</div></div>
      <div class="pd-stat"><div class="pd-stat-num">~500K</div><div class="pd-stat-label">Lines of code (2014)</div></div>
      <div class="pd-stat pd-stat-danger"><div class="pd-stat-num">$0</div><div class="pd-stat-label">Annual budget before Heartbleed</div></div>
    </div>
  </div>
  <div class="pd-body">
    <p>The OpenSSL story is the one that broke through to the mainstream press in 2014, so it requires less historical reconstruction than Exim or BIND. But the DEF CON 22 framing adds context that the mainstream coverage missed.</p>
    <p>Heartbleed (CVE-2014-0160) was disclosed on April 7, 2014, four months before DEF CON 22. It was a buffer over-read in OpenSSL&rsquo;s implementation of the TLS heartbeat extension &mdash; a feature that allows a TLS client to keep a connection alive by sending a small payload and receiving it back. The bug: the server trusted the length field in the heartbeat request without validating it against the actual payload length. A malicious client could specify a length of 65,535 bytes while sending a 1-byte payload, and the server would respond by sending 65,535 bytes of process memory &mdash; potentially including private keys, passwords, session tokens, and other sensitive data that had been anywhere near that memory region.</p>
    <p>The code that contained Heartbleed was contributed by a developer named Robin Seggelmann on New Year&rsquo;s Eve 2011. It was reviewed and committed by another OpenSSL developer. Both were volunteers. The OpenSSL project at the time of the disclosure had one full-time developer and a handful of part-time volunteers, collectively receiving less than $2,000/year in donations for a library that secured the majority of encrypted internet traffic on the planet. When security researcher Ben Laurie estimated the economic value of the software these volunteers were maintaining for free, the number was somewhere in the hundreds of billions of dollars.</p>
    <div class="impact-card">
      <div class="impact-title">The Heartbleed blast radius &mdash; 2014</div>
      <div class="impact-grid">
        <div class="impact-item"><span class="impact-num">~17%</span><span class="impact-desc">of the internet&rsquo;s secure web servers estimated to be vulnerable at disclosure</span></div>
        <div class="impact-item"><span class="impact-num">2 yrs</span><span class="impact-desc">The vulnerability existed in production before discovery &mdash; and nobody knows what data was exfiltrated during those two years</span></div>
        <div class="impact-item"><span class="impact-num">$500M+</span><span class="impact-desc">Estimated cost of remediation across affected organizations (conservative estimate)</span></div>
        <div class="impact-item"><span class="impact-num">&lt;$2K</span><span class="impact-desc">Annual donations to OpenSSL prior to Heartbleed &mdash; the software protecting hundreds of billions in economic activity</span></div>
      </div>
    </div>
    <p>The DEF CON 22 framing of Heartbleed was not about the technical details &mdash; those had been extensively covered. It was about the governance failure. OpenSSL at 4,500 criticals was not an outlier in the dataset; it was emblematic of the pattern. A critical piece of infrastructure, maintained by volunteers with insufficient resources, processing untrusted input, written in a memory-unsafe language. The specific bug was Heartbleed. The category was &ldquo;inevitable.&rdquo;</p>
    <div class="infobox">
      <p>Heartbleed triggered the creation of the Core Infrastructure Initiative &mdash; a Linux Foundation project in which major tech companies pooled resources to fund security audits and maintenance of critical open source infrastructure. OpenSSL received meaningful funding. The post-Heartbleed OpenSSL and the forked LibreSSL and BoringSSL projects all improved substantially. The 2014 DEF CON 22 data points to the pre-Heartbleed state. But the pattern of &ldquo;critical infrastructure, underfunded, discovered after the fact&rdquo; did not end with OpenSSL. It continued through XZ Utils in 2024 and into the current moment.</p>
    </div>
  </div>
</div>

<!-- ── The safer ones ── -->
<div class="project-deep-dive pd-safe">
  <div class="pd-header">
    <div class="pd-meta">
      <span class="pd-name">Apache &amp; nginx</span>
      <span class="pd-category">Web servers &middot; C &middot; Apache est. 1995, nginx est. 2004</span>
    </div>
    <div class="pd-stats">
      <div class="pd-stat pd-stat-good"><div class="pd-stat-num">~290</div><div class="pd-stat-label">Critical CVEs (Apache)</div></div>
      <div class="pd-stat pd-stat-good"><div class="pd-stat-num">low</div><div class="pd-stat-label">Critical CVE count (nginx)</div></div>
      <div class="pd-stat pd-stat-good"><div class="pd-stat-num">down-left</div><div class="pd-stat-label">Relatively safe quadrant</div></div>
    </div>
  </div>
  <div class="pd-body">
    <p>Not every project in the dataset lived in the danger zone, and it&rsquo;s important to understand why the exceptions exist. Apache and nginx were both in the relatively safer quadrant in 2014, which deserves explanation because they handle the same category of untrusted internet input as Exim and BIND &mdash; and yet their CVE density was substantially lower.</p>
    <p>Apache&rsquo;s relative safety had structural causes. The Apache Software Foundation had, by 2014, developed a mature security response process, a dedicated security team, and a culture of security review that was unusual in the open source landscape. The ASF took security seriously not because its volunteers were inherently more conscientious than Exim&rsquo;s, but because it had the institutional infrastructure to support that conscientiousness: defined disclosure procedures, a security team with decision authority, and enough organizational scale to attract contributors who specialized in security.</p>
    <p>Nginx&rsquo;s story was different. nginx was newer (2004 vs. 1995), and its author, Igor Sysoev, had written it with performance and correctness as primary design goals. The architecture was fundamentally different from Apache &mdash; event-driven, single-threaded, with a smaller attack surface almost by design. Fewer features meant fewer code paths; fewer code paths meant fewer places for vulnerabilities to hide.</p>
    <div class="callout-box cb-green">
      <div class="callout-label">What &ldquo;relatively safer&rdquo; actually means</div>
      <p>Neither Apache nor nginx was &ldquo;safe&rdquo; in any absolute sense. Both had CVEs. Both had critical vulnerabilities over their lifetimes. The scatter chart is a relative comparison within the dataset, not an absolute certification of security. A project being in the safe quadrant meant: compared to Exim and BIND, this project was doing better. It did not mean: this project had no vulnerabilities worth finding. The DEF CON 22 framing was always comparative, never absolute.</p>
    </div>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">The root cause</span>
<h2>Why the dangerous projects were dangerous: the incentive structure nobody wanted to discuss</h2>

<p>The most important slide in the DEF CON 22 talk was not the scatter chart. It was a priority ranking of what open source maintainers actually optimize for, derived from analyzing project history, issue tracker patterns, and contributor behavior across the dataset. The ranking, from most to least prioritized:</p>

<div class="priority-stack">
  <div class="priority-item p-high">
    <div class="p-rank">1</div>
    <div class="p-content">
      <div class="p-name">Functionality</div>
      <div class="p-desc">Does it do what it claims to do? This is the primary metric by which users evaluate software, report issues, and either adopt or abandon projects. A project that doesn&rsquo;t work gets no users. A project that works insecurely gets plenty.</div>
    </div>
  </div>
  <div class="priority-item p-high">
    <div class="p-rank">2</div>
    <div class="p-content">
      <div class="p-name">Stability</div>
      <div class="p-desc">Does it stay running? Uptime is measurable, visible to users, and immediately consequential when it fails. Security failures are often invisible until they become catastrophic. Stability failures happen in real time and affect users immediately. The incentive gradient strongly favors stability.</div>
    </div>
  </div>
  <div class="priority-item p-med">
    <div class="p-rank">3</div>
    <div class="p-content">
      <div class="p-name">Performance</div>
      <div class="p-desc">Is it fast enough? Measurable, benchmarkable, a differentiator when comparing to alternatives. Performance improvements make blog posts. Security improvements rarely do, unless they prevent something catastrophic.</div>
    </div>
  </div>
  <div class="priority-item p-low">
    <div class="p-rank">4</div>
    <div class="p-content">
      <div class="p-name">Compliance</div>
      <div class="p-desc">Does it satisfy external requirements? For most OSS projects, compliance is either irrelevant (no external mandate) or a checkbox (FIPS, PCI-DSS). Not a primary driver of development priorities for volunteer maintainers.</div>
    </div>
  </div>
  <div class="priority-item p-low">
    <div class="p-rank">5</div>
    <div class="p-content">
      <div class="p-name">Maintainability</div>
      <div class="p-desc">Is the code readable and extensible? Important for attracting contributors, but rarely a hard blocker. Projects with terrible code quality still attract contributors if they&rsquo;re widely deployed and have interesting problems to solve.</div>
    </div>
  </div>
  <div class="priority-item p-danger">
    <div class="p-rank">6</div>
    <div class="p-content">
      <div class="p-name">Security</div>
      <div class="p-desc">Is it safe against adversaries? This is last not because maintainers don&rsquo;t care, but because the incentive structure doesn&rsquo;t reward it. Security failures are often silent until they&rsquo;re catastrophic. Security work is unglamorous. Security expertise is rare. And crucially: the people who suffer the consequences of insecure infrastructure are not usually the people who maintain it.</div>
    </div>
  </div>
</div>

<p>This priority order is not a character flaw in the people who build open source software. It is a rational response to the incentive environment they operate in. If your project&rsquo;s users reward functionality and punish instability, and if security failures are invisible until someone demonstrates an exploit, the rational allocation of limited volunteer hours places security near the bottom of the stack. This is not a failure of individual virtue. It is a structural problem that individual virtue cannot solve.</p>

<div class="pullquote">
  <p>&ldquo;Everybody was sure somebody would do it. Anybody could have done it. But nobody did it &mdash; and everybody blamed somebody, when nobody did what anybody could have done.&rdquo;</p>
  <span class="attr">&mdash; DEF CON 22, 2014. The Everybody/Somebody/Nobody/Anybody parable applied to Heartbleed, and by extension to every other critical vulnerability in the dataset. The blame directed at the OpenSSL maintainers in 2014 was particularly acute. One to three developers maintaining 500,000 lines of C that secures the majority of internet traffic. The blame should have been directed at the system that made that possible, not the humans who worked in it.</span>
</div>

<hr class="gw-hr">
<span class="section-label">The contributor ecosystem</span>
<h2>Who actually builds the software the internet runs on, and why that matters for security</h2>

<p>The DEF CON 22 talk included an analysis of contributor archetypes across the dataset. Understanding who contributes to OSS projects &mdash; and what motivates them &mdash; is essential to understanding why the incentive structure produces the results it does.</p>

<div class="contributor-grid">
  <div class="contributor-card cc-purple">
    <div class="cc-icon">&#9632;</div>
    <h4>The activist</h4>
    <p>Contributes to solve a specific ethical, political, or lifestyle problem. Deep motivation, often technically capable, but narrowly focused. A privacy-focused activist contributing to a VPN client is unlikely to spend cycles on input validation in the SMTP parsing path of a different project.</p>
    <div class="cc-security-impact">Security impact: <span class="cc-neutral">neutral to positive</span> &mdash; focused on their specific concern, unlikely to introduce new problems, unlikely to audit unrelated code</div>
  </div>
  <div class="contributor-card cc-blue">
    <div class="cc-icon">&#9632;</div>
    <h4>The hobbyist</h4>
    <p>Scratches an itch. Contributes a patch or two, maybe maintains a small project for a year or two, then moves on. The long tail of OSS contribution. For widely-deployed infrastructure projects, hobbyist contributions in C/C++ are among the highest-risk inputs: enthusiastic, well-intentioned, and statistically unlikely to have deep security engineering expertise.</p>
    <div class="cc-security-impact">Security impact: <span class="cc-negative">frequently negative</span> &mdash; introduces code without security review, may not respond to vulnerability disclosures, abandons projects leaving known vulnerabilities unpatched</div>
  </div>
  <div class="contributor-card cc-amber">
    <div class="cc-icon">&#9632;</div>
    <h4>The artist</h4>
    <p>Contributes for the craft of it. Creates things like new programming languages, esoteric algorithms, visually interesting code. Deeply passionate, often highly skilled, not primarily security-focused. For infrastructure projects, artist contributions tend to be in the core logic rather than the attack surface, which reduces risk somewhat.</p>
    <div class="cc-security-impact">Security impact: <span class="cc-neutral">mixed</span> &mdash; high code quality but not security-oriented; less likely to introduce memory management bugs in C but also less likely to audit existing ones</div>
  </div>
  <div class="contributor-card cc-teal">
    <div class="cc-icon">&#9632;</div>
    <h4>The professionally motivated</h4>
    <p>Works for a company that depends on the project, or is paid to contribute. This is the archetype that produces the most security-conscious contributions &mdash; but only when the company cares about security. A company contributing to a mail server for reliability reasons will contribute reliability-focused code. A company contributing for security reasons (rare) will contribute security-focused code.</p>
    <div class="cc-security-impact">Security impact: <span class="cc-positive">conditionally positive</span> &mdash; best-case scenario if company has security engineering culture; worst-case, introduces complex features that expand attack surface in exchange for business functionality</div>
  </div>
</div>

<p>The implication for the vulnerability data is direct. The projects with the worst security posture were predominantly maintained by hobbyists and small teams of volunteers with deep domain expertise (DNS, SMTP, cryptography) but limited security engineering background. Writing a correct SMTP parser in C is a different skill set from writing a <em>safe</em> SMTP parser in C. Most of the people who built these projects had the former and not the latter, and the projects reflected that asymmetry.</p>

<hr class="gw-hr">
<span class="section-label">The language problem</span>
<h2>C, C++, and the memory safety debt that is still being paid in 2026</h2>

<p>The correlation between C/C++ codebases and high vulnerability density in the dataset was not perfect &mdash; there were C projects with relatively low density &mdash; but it was strong enough to identify as a primary risk factor. Understanding why requires a brief detour into what C actually is as a programming model.</p>

<div class="two-col">
  <div class="lang-card">
    <h4>What C gives you</h4>
    <ul class="bullets">
      <li>Direct memory management &mdash; you decide when to allocate and free</li>
      <li>No bounds checking by default &mdash; you can read and write past the end of arrays</li>
      <li>No type safety at runtime &mdash; you can cast anything to anything</li>
      <li>No null pointer protection &mdash; dereferencing null is undefined behavior</li>
      <li>Integer arithmetic that wraps silently &mdash; overflow is your problem</li>
      <li>The full performance of the hardware with no safety abstractions</li>
    </ul>
  </div>
  <div class="lang-card">
    <h4>What C costs you</h4>
    <ul class="bullets">
      <li>Every memory allocation and deallocation must be manually correct across all code paths</li>
      <li>Every array access must be manually bounds-checked or the consequences are undefined</li>
      <li>Every integer arithmetic operation that could overflow must be explicitly guarded</li>
      <li>The cognitive overhead scales with codebase size: 500K lines of C requires tracking hundreds of thousands of invariants</li>
      <li>Security bugs in C are often valid C &mdash; the compiler won&rsquo;t catch them</li>
    </ul>
  </div>
</div>

<p>The practical implication: in a large C codebase maintained by a small team under resource pressure, the probability of memory safety bugs approaches certainty. Not because the developers are careless, but because the language requires a level of sustained attention to safety invariants that humans reliably cannot maintain across 500,000 lines of code over decades of development by rotating contributors. The bugs in Exim, BIND, and OpenSSL were not programmer mistakes in the conventional sense. They were the predictable output of a system that required programmers to be perfect and then expressed surprise when they weren&rsquo;t.</p>

<div class="infobox amber">
  <p>The memory safety problem in systems software is not a secret, and it predates DEF CON 22. The Mozilla Foundation began developing Rust in 2010 specifically to address it. Google&rsquo;s internal data showed that approximately 70% of security vulnerabilities in Chrome and Android were memory safety issues. The NSA issued guidance recommending memory-safe languages in 2022. The White House Office of the National Cyber Director issued similar guidance in 2024. In 2026, Exim is still written in C. BIND is still written in C. The OpenSSL codebase still has C at its core. The language problem is known, documented, and the transition is happening at the pace of organizational inertia rather than the pace of the threat.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The disclosure problem</span>
<h2>What happens when you find something and nobody has a process for receiving it</h2>

<p>One of the more embarrassing moments in the DEF CON 22 talk was a personal one. During the analysis, a significant vulnerability was found in a widely-deployed DNS-adjacent project. The standard disclosure process was attempted: emailed the security@ address listed in the RFC, sent a message to the project&rsquo;s general mailing list, waited for a response. Silence. After two weeks, the vulnerability was filed in the project&rsquo;s public issue tracker, because that was the only mechanism that seemed to result in any response.</p>

<p>A core developer responded within hours &mdash; not to acknowledge the vulnerability, but to ask why it had been filed publicly where everyone could see it. The answer: because there was no other visible mechanism. The project had no documented security disclosure process. The security@ address bounced. The general mailing list was unanswered. The issue tracker was the only thing that worked.</p>

<div class="callout-box cb-red">
  <div class="callout-label">The disclosure gap: a quantitative observation</div>
  <p>Of the 2,000+ projects analyzed in the DEF CON 22 dataset, fewer than 15% had a documented security disclosure process &mdash; a dedicated security contact, a defined timeline for acknowledgment and remediation, or any published policy for how to report vulnerabilities. For projects in the danger zone (high density, high count), the number was even lower. The projects most in need of coordinated vulnerability disclosure were the ones least prepared to receive it. This is not coincidental. The same resource constraints that produce security vulnerabilities also produce the absence of security processes.</p>
</div>

<p>The industry has improved since 2014. GitHub&rsquo;s private security advisory feature, the widespread adoption of SECURITY.md files, HackerOne and Bugcrowd for bug bounties, CVE CNA programs for open source projects &mdash; all of these represent real progress. But the progress is uneven. The projects that receive security investment are disproportionately the high-profile ones. The long tail of critical infrastructure &mdash; the Exims and the FreeRADIUSes and the OpenPGP.jses &mdash; still largely operates without coordinated disclosure processes, still relies on volunteers to respond to security reports in their spare time, still lacks the institutional infrastructure to handle a flood of simultaneous vulnerability reports. Which is exactly what Project Glasswing is about to produce.</p>

<hr class="gw-hr">
<span class="section-label">What changed (and what didn&rsquo;t)</span>
<h2>From 2014 to 2026: a twelve-year audit</h2>

<p>The DEF CON 22 data was collected in 2014. Twelve years is a long time in technology. It is worth being explicit about what has improved, what has remained static, and what has gotten worse.</p>

<div class="three-col">

  <div class="change-card cc-green">
    <div class="change-header">What improved</div>
    <ul class="bullets">
      <li>OpenSSL post-Heartbleed: CII funding, dedicated team, LibreSSL and BoringSSL forks with improved security posture</li>
      <li>Linux kernel: memory safety investments, growing adoption of Rust for new kernel modules, active security team</li>
      <li>Disclosure processes: SECURITY.md widespread, GitHub private advisories, CVE automation improving</li>
      <li>Tooling: OSS-Fuzz running continuously against hundreds of critical projects, catching vulnerabilities before deployment</li>
      <li>Language alternatives: Rust adoption growing in systems software; memory safety in new code is increasingly achievable</li>
      <li>SBOM awareness: software bill of materials requirements emerging in government procurement</li>
    </ul>
  </div>

  <div class="change-card cc-neutral">
    <div class="change-header">What stayed the same</div>
    <ul class="bullets">
      <li>The maintainer resource constraint: critical infrastructure still predominantly maintained by volunteers or underfunded small teams</li>
      <li>The incentive structure: stability and performance still dominate; security still last</li>
      <li>The language debt: most critical infrastructure is still C/C++; rewrites are slow</li>
      <li>The deployment lag: organizations still running old versions because &ldquo;change is hard&rdquo;</li>
      <li>The Everybody/Somebody/Nobody dynamic: diffusion of responsibility still produces audit gaps</li>
      <li>The disclosure gap: projects with the worst security posture still have the worst disclosure processes</li>
    </ul>
  </div>

  <div class="change-card cc-red">
    <div class="change-header">What got worse</div>
    <ul class="bullets">
      <li>Attack surface expansion: the transitive dependency graph has grown by orders of magnitude; the 847-package login form didn&rsquo;t exist in 2014</li>
      <li>Threat actor sophistication: nation-state supply chain attacks (XZ, Trivy, Axios) represent a qualitative escalation from 2014</li>
      <li>ML stack: an entirely new category of critical infrastructure (TensorFlow, PyTorch, LiteLLM) with the same structural problems and a security posture reflecting its research origins</li>
      <li>Discovery capability: Glasswing-class AI can find bugs faster than the ecosystem can patch them &mdash; a capability inversion that didn&rsquo;t exist in 2014</li>
      <li>Targeted maintainer attacks: the XZ social engineering playbook has been replicated; OSS maintainers are now high-value human targets</li>
    </ul>
  </div>

</div>

<hr class="gw-hr">
<span class="section-label">The bridge</span>
<h2>From the 2014 scatter chart to the 2026 cascade: the same structural failure, twelve years deeper</h2>

<p>The DEF CON 22 analysis was not a prediction of Trivy, LiteLLM, or Axios. It was a diagnosis of the structural conditions that made those incidents inevitable once the threat model evolved to include nation-state actors with the patience and resources to exploit them systematically.</p>

<p>The specific vulnerabilities change. The attack vectors evolve. The infrastructure layers shift from DNS and SMTP to CI/CD pipelines and AI gateways. But the underlying cause &mdash; critical infrastructure maintained by under-resourced humans operating in an incentive environment that doesn&rsquo;t reward security &mdash; has not been resolved. It has been compounded.</p>

<p>Project Glasswing finds bugs at machine speed because the bugs are still there. The 27-year-old OpenBSD bug that Mythos found existed because OpenBSD, for all its security focus, still runs on code written by humans in a memory-unsafe language over decades, with finite review capacity and infinite attack surface. The FFmpeg bug was 16 years old. These are not anomalies. They are what the 2014 data predicted: the safe quadrant was never as safe as it looked, and the dangerous quadrant was always more dangerous than anyone was willing to publicly admit.</p>

<div class="final-callout">
  <div class="final-top">
    <p>The 2014 DEF CON 22 framing: &ldquo;nobody is looking at the code, the projects that run the internet are riddled with critical vulnerabilities, and the incentive structure guarantees this will continue.&rdquo;</p>
  </div>
  <div class="final-bottom">
    <p>The 2026 update: we were right about all of it. The specific projects have changed. The structural diagnosis has not. And now we have a model that finds 27-year-old bugs in OpenBSD and 16-year-old bugs in FFmpeg in a matter of weeks &mdash; which means either we fix the underlying structure, or we spend the next decade watching an AI scanner surface the backlog of everything nobody looked at, faster than the humans responsible for patching it can respond.</p>
  </div>
</div>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-04-08-project-butterfly-of-damocles-intro %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 1 &mdash; Introduction: From Fairy Dust to Glasswing</span>
  </a>
  <a href="{% post_url 2026-04-10-project-butterfly-of-damocles-part-2 %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 3 &mdash; The dependency graph: 847 applications in a login form</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">DEF CON 22</span>
  <span class="tag">Exim</span>
  <span class="tag">OpenSSL</span>
  <span class="tag">Bind</span>
  <span class="tag">Heartbleed</span>
  <span class="tag">vulnerability density</span>
  <span class="tag">NVD</span>
  <span class="tag">CVE</span>
  <span class="tag">C/C++ memory safety</span>
  <span class="tag">maintainer economics</span>
  <span class="tag">OSS incentives</span>
  <span class="tag">static analysis</span>
  <span class="tag">dynamic analysis</span>
  <span class="tag">Project Glasswing</span>
  <span class="tag">Morphogenetic SOC</span>
  <span class="tag">Project Butterfly of Damocles</span>
</div>

<div class="gw-byline">John Menerick is a senior information security architect and consultant (CISSP, NSA, CKS/CKA). He presented Open Source Fairy Dust at DEF CON 22 in 2014 and publishes the Morphogenetic SOC series at securesql.info. The views expressed are his own and do not represent the views of Anthropic, Project Glasswing, or any Glasswing launch partner.</div>

</div><!-- /glasswing-wrapper -->

{% capture extra_styles %}
<style>
/* ── Episode 2 additional styles ── */
.ep-nav-bar { display:flex; flex-wrap:wrap; align-items:center; gap:.5rem; font-size:.75rem; opacity:.55; margin-bottom:1.5rem; padding:.6rem .875rem; background:rgba(0,0,0,.04); border-radius:8px; }
.ep-nav-sep { opacity:.4; }
.ep-nav-series { font-weight:700; }
.ep-lede { font-style:italic; font-size:1rem; line-height:1.75; margin-bottom:.75rem; }
.ep-lede-block { margin-bottom:1.5rem; }
.methodology-grid { display:grid; grid-template-columns:repeat(2,1fr); gap:.75rem; margin:1.25rem 0; }
.method-card { background:#fff; border:1px solid rgba(0,0,0,.1); border-radius:10px; padding:.9rem 1rem; }
.method-icon { font-size:1.1rem; margin-bottom:.4rem; }
.method-purple { color:#4527a0; } .method-blue { color:#0d47a1; } .method-teal { color:#1b5e20; } .method-amber { color:#e65100; }
.method-card h4 { font-size:.82rem; font-weight:700; margin-bottom:.3rem; }
.method-card p  { font-size:.77rem; opacity:.75; line-height:1.6; margin-bottom:.4rem; }
.method-caveat { font-size:.72rem; font-style:italic; opacity:.55; padding:.3rem .5rem; background:rgba(0,0,0,.04); border-radius:4px; }
.chart-explainer { position:relative; margin:1.5rem 0; border:1px solid rgba(0,0,0,.1); border-radius:10px; overflow:hidden; background:rgba(0,0,0,.02); }
.chart-area { position:relative; height:320px; margin:2rem 2.5rem 2rem 3.5rem; border-left:1px solid rgba(0,0,0,.15); border-bottom:1px solid rgba(0,0,0,.15); }
.danger-zone-label { position:absolute; top:4px; right:4px; font-size:.68rem; font-weight:700; color:#c62828; opacity:.7; }
.safe-zone-label { position:absolute; bottom:30px; left:4px; font-size:.68rem; color:#2e7d32; opacity:.7; }
.bubble { position:absolute; border-radius:50%; display:flex; align-items:center; justify-content:center; transform:translate(-50%,50%); }
.b-critical { background:rgba(198,40,40,.25); border:1.5px solid rgba(198,40,40,.5); }
.b-high     { background:rgba(230,81,0,.2);  border:1.5px solid rgba(230,81,0,.4); }
.b-safe     { background:rgba(46,125,50,.2); border:1.5px solid rgba(46,125,50,.4); }
.b-info     { background:rgba(21,101,192,.2);border:1.5px solid rgba(21,101,192,.4); }
.b-label { font-size:.58rem; font-weight:700; text-align:center; line-height:1.2; color:#333; }
.chart-axis-label { font-size:.7rem; font-weight:700; opacity:.5; text-align:center; padding:.3rem; }
.chart-axis-y { position:absolute; left:.2rem; top:50%; transform:rotate(-90deg) translateX(-50%); transform-origin:left center; white-space:nowrap; }
.chart-legend { display:flex; flex-wrap:wrap; gap:.75rem; padding:.75rem; border-top:1px solid rgba(0,0,0,.08); }
.leg-dot { display:inline-block; width:10px; height:10px; border-radius:50%; margin-right:.25rem; }
.leg-crit { background:rgba(198,40,40,.5); } .leg-high { background:rgba(230,81,0,.5); } .leg-safe { background:rgba(46,125,50,.5); } .leg-info { background:rgba(21,101,192,.5); }
.leg-txt { font-size:.72rem; opacity:.7; }
.project-deep-dive { margin:1.5rem 0; border:1px solid rgba(0,0,0,.1); border-radius:12px; overflow:hidden; }
.pd-critical { border-top:3px solid #c62828; }
.pd-high     { border-top:3px solid #e65100; }
.pd-safe     { border-top:3px solid #2e7d32; }
.pd-header { display:flex; justify-content:space-between; align-items:flex-start; padding:1rem 1.25rem; background:rgba(0,0,0,.03); border-bottom:1px solid rgba(0,0,0,.08); flex-wrap:wrap; gap:.75rem; }
.pd-name { font-size:1.15rem; font-weight:700; display:block; margin-bottom:.15rem; }
.pd-category { font-size:.75rem; opacity:.55; }
.pd-stats { display:flex; gap:1rem; flex-wrap:wrap; }
.pd-stat { text-align:right; }
.pd-stat-num { font-size:1rem; font-weight:700; line-height:1; }
.pd-stat-label { font-size:.68rem; opacity:.55; }
.pd-stat-danger .pd-stat-num { color:#c62828; }
.pd-stat-warn .pd-stat-num   { color:#e65100; }
.pd-stat-good .pd-stat-num   { color:#2e7d32; }
.pd-body { padding:1rem 1.25rem; }
.pd-body p { font-size:.85rem; line-height:1.75; }
.pd-timeline { margin:1rem 0; border-left:2px solid rgba(0,0,0,.12); padding-left:1rem; }
.pd-tl-item { display:flex; gap:.75rem; margin-bottom:.6rem; font-size:.78rem; }
.pd-tl-year { font-weight:700; opacity:.6; white-space:nowrap; min-width:38px; }
.pd-tl-event { opacity:.75; line-height:1.5; }
.pd-tl-recent .pd-tl-year { color:#c62828; }
.callout-box { background:rgba(0,0,0,.04); border:1px solid rgba(0,0,0,.1); border-radius:8px; padding:.875rem 1rem; margin:1rem 0; }
.cb-red   { background:rgba(198,40,40,.05); border-color:rgba(198,40,40,.2); }
.cb-green { background:rgba(46,125,50,.05);  border-color:rgba(46,125,50,.2); }
.callout-label { font-size:.72rem; font-weight:700; opacity:.6; margin-bottom:.4rem; text-transform:uppercase; letter-spacing:.05em; }
.callout-box p { font-size:.8rem; opacity:.8; line-height:1.65; margin:0; }
.impact-card { border:1px solid rgba(0,0,0,.1); border-radius:10px; overflow:hidden; margin:1rem 0; }
.impact-title { font-size:.78rem; font-weight:700; opacity:.6; padding:.6rem 1rem; background:rgba(0,0,0,.04); border-bottom:1px solid rgba(0,0,0,.08); }
.impact-grid { display:grid; grid-template-columns:repeat(2,1fr); }
.impact-item { padding:.75rem 1rem; border-right:1px solid rgba(0,0,0,.07); border-bottom:1px solid rgba(0,0,0,.07); }
.impact-item:nth-child(even) { border-right:none; }
.impact-item:nth-last-child(-n+2) { border-bottom:none; }
.impact-num { font-size:1.2rem; font-weight:700; display:block; margin-bottom:.2rem; }
.impact-desc { font-size:.75rem; opacity:.65; line-height:1.4; }
.priority-stack { display:flex; flex-direction:column; gap:.4rem; margin:1.25rem 0; }
.priority-item { display:flex; gap:.75rem; align-items:flex-start; border:1px solid rgba(0,0,0,.1); border-radius:8px; padding:.75rem 1rem; }
.p-high { background:rgba(46,125,50,.04); }
.p-med  { background:rgba(21,101,192,.04); }
.p-low  { background:rgba(0,0,0,.02); }
.p-danger { background:rgba(198,40,40,.06); border-color:rgba(198,40,40,.2); }
.p-rank { font-size:1.3rem; font-weight:700; opacity:.25; min-width:24px; }
.p-name { font-size:.85rem; font-weight:700; margin-bottom:.25rem; }
.p-desc { font-size:.78rem; opacity:.75; line-height:1.55; }
.contributor-grid { display:grid; grid-template-columns:repeat(2,1fr); gap:.75rem; margin:1.25rem 0; }
.contributor-card { background:#fff; border:1px solid rgba(0,0,0,.1); border-radius:10px; padding:.9rem 1rem; }
.cc-purple { border-top:2px solid #5c35cc; }
.cc-blue   { border-top:2px solid #1565c0; }
.cc-amber  { border-top:2px solid #e65100; }
.cc-teal   { border-top:2px solid #00695c; }
.cc-icon { font-size:1rem; margin-bottom:.4rem; }
.contributor-card h4 { font-size:.82rem; font-weight:700; margin-bottom:.3rem; }
.contributor-card p  { font-size:.77rem; opacity:.75; line-height:1.6; margin-bottom:.5rem; }
.cc-security-impact { font-size:.72rem; opacity:.7; font-style:italic; padding:.25rem .4rem; background:rgba(0,0,0,.04); border-radius:4px; }
.cc-positive { color:#2e7d32; font-style:normal; font-weight:700; }
.cc-negative { color:#c62828; font-style:normal; font-weight:700; }
.cc-neutral  { color:#e65100; font-style:normal; font-weight:700; }
.lang-card { background:#fff; border:1px solid rgba(0,0,0,.1); border-radius:10px; padding:.9rem 1rem; }
.lang-card h4 { font-size:.85rem; font-weight:700; margin-bottom:.5rem; }
.three-col { display:grid; grid-template-columns:repeat(3,1fr); gap:.75rem; margin:1.25rem 0; }
.change-card { border:1px solid rgba(0,0,0,.1); border-radius:10px; padding:.9rem 1rem; }
.cc-green   { background:rgba(46,125,50,.04);   border-top:2px solid #2e7d32; }
.cc-neutral { background:rgba(0,0,0,.02);       border-top:2px solid #888; }
.cc-red     { background:rgba(198,40,40,.04);   border-top:2px solid #c62828; }
.change-header { font-size:.8rem; font-weight:700; margin-bottom:.6rem; }
.cc-green   .change-header { color:#2e7d32; }
.cc-neutral .change-header { color:#555; }
.cc-red     .change-header { color:#c62828; }
.ep-nav-footer { display:grid; grid-template-columns:1fr 1fr; gap:1rem; margin-top:2rem; padding-top:1.25rem; border-top:1px solid rgba(0,0,0,.1); }
.ep-nav-prev, .ep-nav-next { display:flex; flex-direction:column; gap:.2rem; }
.ep-nav-next { text-align:right; }
.ep-nav-dir { font-size:.72rem; font-weight:700; opacity:.5; }
.ep-nav-ep-title { font-size:.8rem; opacity:.75; line-height:1.4; }
/* Dark mode additions */
[data-theme="dark"] .method-card,
[data-theme="dark"] .project-deep-dive,
[data-theme="dark"] .callout-box,
[data-theme="dark"] .contributor-card,
[data-theme="dark"] .lang-card,
[data-theme="dark"] .change-card,
[data-theme="dark"] .impact-card,
[data-theme="dark"] .priority-item { background:rgba(255,255,255,.05); border-color:rgba(255,255,255,.1); }
[data-theme="dark"] .chart-explainer { background:rgba(255,255,255,.03); border-color:rgba(255,255,255,.1); }
[data-theme="dark"] .chart-area { border-color:rgba(255,255,255,.15); }
[data-theme="dark"] .b-label { color:#eee; }
[data-theme="dark"] .pd-header { background:rgba(255,255,255,.04); }
[data-theme="dark"] .impact-title { background:rgba(255,255,255,.04); }
[data-theme="dark"] .p-high { background:rgba(100,200,100,.05); }
[data-theme="dark"] .p-danger { background:rgba(255,100,100,.06); }
[data-theme="dark"] .cc-security-impact { background:rgba(255,255,255,.06); }
[data-theme="dark"] .method-caveat { background:rgba(255,255,255,.06); }
@media(max-width:600px) {
  .methodology-grid, .contributor-grid, .three-col { grid-template-columns:1fr; }
  .impact-grid { grid-template-columns:1fr; }
  .impact-item { border-right:none; }
  .ep-nav-footer { grid-template-columns:1fr; }
  .ep-nav-next { text-align:left; }
  .chart-area { height:240px; }
}
</style>
{% endcapture %}
{{ extra_styles }}
