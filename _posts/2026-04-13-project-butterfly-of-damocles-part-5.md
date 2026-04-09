---
layout: post
title: "Part IV — From “I have a toolbox” to “the scanner has a backdoor”"
date: 2026-04-13
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 6
categories: ["Security", "Open Source", "Project Glasswing", "History"]
excerpt: "The progression from DEF CON 22 in 2014 to the March 2026 cascade."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">

  <span class="section-label">Part IV &mdash; The timeline</span>
  <h2>From &ldquo;I have a toolbox&rdquo; to &ldquo;the model has agency&rdquo; to &ldquo;the scanner has a backdoor&rdquo;</h2>
  <div class="tl">
    <div class="tl-row"><div class="tl-year">2014</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>DEF CON 22 &mdash; Open Source Fairy Dust</h4><p>Manual + automated analysis across 2,000+ projects. AWS spot fleet, Jenkins, NVD correlation. Found thousands of unlogged vulnerabilities. Filed one as a public issue. Got yelled at. Nobody was looking at the code.</p></div></div>
    <div class="tl-row"><div class="tl-year">2021</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>Log4Shell &mdash; Heartbleed at JVM scale</h4><p>Bundled library in tens of thousands of applications. The Everybody/Somebody thesis confirmed again. Supply chain as attack vector moves from theoretical to operationalized.</p></div></div>
    <div class="tl-row"><div class="tl-year">2024</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>XZ Utils &mdash; social engineering the maintainer directly</h4><p>Two years. One burned-out volunteer. Transitive dependency of sshd. Caught by performance benchmarking, not code review. The template for March 2026. The playbook was published. Nation-states read it.</p></div></div>
    <div class="tl-row"><div class="tl-year">Mar&nbsp;19&ndash;31,&nbsp;2026</div><div class="tl-line"><div class="tl-dot red"></div></div><div class="tl-content"><h4>The cascade &mdash; two actors, 12 days, two ecosystems</h4><p>TeamPCP weaponizes Trivy. CanisterWorm with blockchain C2. LiteLLM AI key vault breached. European Commission loses 92 GB. Concurrent: DPRK social engineers Axios maintainer over two weeks for a 3-hour window. 174K downstream packages. 300 GB credentials total.</p></div></div>
    <div class="tl-row"><div class="tl-year">Apr&nbsp;8,&nbsp;2026</div><div class="tl-line"><div class="tl-dot"></div></div><div class="tl-content"><h4>Project Glasswing announced</h4><p>Mythos Preview withheld. 12 partners, 40 orgs, $104M committed. Thousands of zero-days. A 27-year-old OpenBSD bug. A sandbox escape followed by an unprompted email to a researcher eating lunch. The most powerful vulnerability-finding capability ever built, deliberately kept from the ecosystem two nation-states had just finished systematically compromising.</p></div></div>
  </div>

</div>
