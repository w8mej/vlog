---
layout: post
title: "Part I — The original quantitative case: internet infrastructure is not OK"
date: 2026-04-09
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 2
categories: ["Security", "Open Source", "Project Glasswing"]
excerpt: "The “Open Source Fairy Dust” talk wasn't a rhetorical exercise. It was a data exercise. Almost nothing critical lived in the safe quadrant."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">

  <span class="section-label">Part I</span>
  <h2>The original quantitative case: internet infrastructure is not OK</h2>
  
  <p>The &ldquo;Open Source Fairy Dust&rdquo; talk wasn&rsquo;t a rhetorical exercise. It was a data exercise &mdash; 2,000+ open source projects, static and dynamic analysis, NVD correlation, vulnerability density plotted on a log scale against total critical count. Up and to the right is terrifying. Down and to the left is survivable. Almost nothing critical lived in the safe quadrant, and the outliers told a story about institutional failure, not individual negligence.</p>

  <div class="tbl-wrap">
    <table>
      <thead><tr><th>Project</th><th>Category</th><th>Critical CVEs</th><th>Risk position</th></tr></thead>
      <tbody>
        <tr><td class="tbl-name">Exim</td><td>Mail server</td><td>~13,000</td><td style="color:var(--red-dark);font-weight:600">Extreme — up-right outlier</td></tr>
        <tr><td class="tbl-name">Bind 8</td><td>DNS</td><td>~6,000</td><td style="color:var(--red-dark)">Danger zone</td></tr>
        <tr><td class="tbl-name">OpenSSL</td><td>Crypto library</td><td>~4,500</td><td style="color:var(--red-dark)">Danger zone</td></tr>
        <tr><td class="tbl-name">Bind 9</td><td>DNS</td><td>~2,000</td><td style="color:var(--amber-dark)">High risk</td></tr>
        <tr><td class="tbl-name">Linux kernel</td><td>OS</td><td>~3,200</td><td style="color:var(--amber-dark)">Large codebase, moderate density</td></tr>
        <tr><td class="tbl-name">FreeRADIUS</td><td>Auth</td><td>moderate</td><td style="color:var(--red-dark)">Danger zone</td></tr>
        <tr><td class="tbl-name">OpenPGP.js</td><td>Crypto</td><td>moderate</td><td style="color:var(--red-dark)">Danger zone</td></tr>
        <tr><td class="tbl-name">Apache</td><td>Web server</td><td>~290</td><td style="color:var(--teal-dark)">Relatively safer</td></tr>
        <tr><td class="tbl-name">nginx</td><td>Web server</td><td>low</td><td style="color:var(--teal-dark)">Relatively safer</td></tr>
        <tr><td class="tbl-name">OpenVPN</td><td>Network</td><td>low</td><td style="color:var(--teal-dark)">Relatively safer</td></tr>
      </tbody>
    </table>
  </div>

  <p>The mail server answer was Exim. Bind 8 was a monument to &ldquo;we&rsquo;ll fix the security in the rewrite.&rdquo; OpenSSL at 4,500 criticals included Heartbleed &mdash; everybody&rsquo;s problem, therefore nobody&rsquo;s problem. The root cause held across every project: strained volunteer maintainers rationally prioritize stability and performance, because that is what their users reward them for. That diagnosis has not aged out.</p>

  <div class="pullquote">
    <p>&ldquo;Everybody was sure somebody would do it. Anybody could have done it. But nobody did it &mdash; and everybody blamed somebody, when nobody did what anybody could have done.&rdquo;</p>
    <span class="attr">&mdash; DEF CON 22, 2014. Still the most accurate description of OSS security governance in 2026.</span>
  </div>

</div>
