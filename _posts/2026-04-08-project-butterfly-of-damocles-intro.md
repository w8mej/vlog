---
layout: post
title: "From fairy dust to Glasswing: a decade of being right about the wrong thing"
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

  <div class="s3-series-header">
    <div class="s3-series-badge">
      <span class="s3-badge-dot" aria-hidden="true"></span>
      Season 3 &middot; Threat Intelligence Series
    </div>
    <h2 class="s3-series-title-display">Project Butterfly<br>of Damocles</h2>
    <p class="s3-series-subtitle-display">A twelve-year retrospective on the supply chain attack surface &mdash; DEF&nbsp;CON&nbsp;22 to the Glasswing Doctrine</p>
  </div>

  <p class="s3-lede">In 2014 I stood at DEF CON and showed the internet&rsquo;s foundational software was held together by wishful thinking, volunteer labor, and collective myth. Last week Anthropic&rsquo;s unreleased frontier model validated that at industrial scale. This month two nation-state actors proved the security tooling itself is now the attack surface. And Project Glasswing &mdash; the response &mdash; may be the most consequential single policy decision to date in the history of open source software security. Whether that consequence is good or catastrophic depends entirely on decisions no one has made yet.</p>

  <div class="s3-season-stats">
    <div class="s3-ss"><div class="s3-ss-num">9</div><div class="s3-ss-sub">Episodes in Season 3</div></div>
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
        <div class="ep-title"><a href="{% post_url 2026-04-09-project-butterfly-of-damocles-part-1 %}">Fairy dust &mdash; the myth that built the internet</a></div>
        <div class="ep-desc">DEF CON 22, 2014. Quantitative analysis of 2,000+ open source projects reveals that foundational internet infrastructure &mdash; Exim, Bind, OpenSSL &mdash; is riddled with critical vulnerabilities nobody is fixing. The Everybody/Somebody/Nobody parable. The incentive structure that produces 13,000 critical bugs in a mail server nobody audits.</div>
        <div class="ep-tags-row"><span class="ep-tag">DEF CON 22</span><span class="ep-tag">Exim</span><span class="ep-tag">OpenSSL</span><span class="ep-tag">vulnerability density</span><span class="ep-tag">maintainer economics</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Available now</span><span class="ep-runtime">~22 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">02</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-10-project-butterfly-of-damocles-part-2 %}">The dependency graph &mdash; 847 applications in a login form</a></div>
        <div class="ep-desc">Transitive dependency risk, package maintenance economics, and why the thing that destroys you won&rsquo;t be your code. Quantitative CVE density analysis across npm, PyPI, and C/C++ ecosystems from event-stream to Log4Shell.</div>
        <div class="ep-tags-row"><span class="ep-tag">supply chain</span><span class="ep-tag">npm</span><span class="ep-tag">PyPI</span><span class="ep-tag">Log4Shell</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Available now</span><span class="ep-runtime">~18 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">03</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-11-project-butterfly-of-damocles-part-3 %}">The XZ playbook &mdash; two years to own a dependency of sshd</a></div>
        <div class="ep-desc">CVE-2024-3094 is not a vulnerability story &mdash; it&rsquo;s a governance story. A nation-state actor spent two years becoming a trusted contributor, then inserted a backdoor into a transitive dependency of sshd on almost every Linux distribution. Caught by an anomalous CPU benchmark, not security review. The template for everything that followed in 2026.</div>
        <div class="ep-tags-row"><span class="ep-tag">XZ Utils</span><span class="ep-tag">CVE-2024-3094</span><span class="ep-tag">social engineering</span><span class="ep-tag">maintainer targeting</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Available now</span><span class="ep-runtime">~20 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">04</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-12-project-butterfly-of-damocles-part-4 %}">The inspector &mdash; when Trivy became the weapon</a></div>
        <div class="ep-desc">March 19, 2026. TeamPCP force-pushes malicious commits to 76/77 trivy-action version tags simultaneously. The most diligent organizations had the greatest exposure. Full cascade reconstruction: CanisterWorm with blockchain C2, Checkmarx KICS, LiteLLM AI key vault breach, Telnyx WAV steganography, European Commission&rsquo;s 92&nbsp;GB.</div>
        <div class="ep-tags-row"><span class="ep-tag">Trivy</span><span class="ep-tag">TeamPCP</span><span class="ep-tag">CVE-2026-33634</span><span class="ep-tag">CanisterWorm</span><span class="ep-tag">LiteLLM</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Available now</span><span class="ep-runtime">~24 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">05</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-13-project-butterfly-of-damocles-part-5 %}">The locksmith &mdash; two weeks to own 100 million downloads</a></div>
        <div class="ep-desc">March 31, 2026. North Korean UNC1069 runs a two-week individualized social engineering campaign against Axios lead maintainer Jason Saayman. Three hours. 174,000 downstream packages. The ROI calculation that makes high-impact OSS maintainers the most valuable social engineering targets in software &mdash; and what SLSA provenance absence means as a detection signal.</div>
        <div class="ep-tags-row"><span class="ep-tag">Axios</span><span class="ep-tag">UNC1069</span><span class="ep-tag">DPRK</span><span class="ep-tag">Sapphire Sleet</span><span class="ep-tag">SLSA</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Available now</span><span class="ep-runtime">~22 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">06</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-14-project-butterfly-of-damocles-part-6 %}">The ML stack &mdash; 700 CVEs and a pickle file that runs your AI</a></div>
        <div class="ep-desc">TensorFlow: 700+ critical CVEs. HuggingFace&rsquo;s dominant model serialization format: arbitrary code execution by design. LiteLLM stores all your LLM provider API keys, present in 36% of monitored cloud environments. The DEF CON 22 vulnerability density methodology applied to the modern ML infrastructure stack &mdash; same conclusions, one decade later, new substrate.</div>
        <div class="ep-tags-row"><span class="ep-tag">ML stack</span><span class="ep-tag">TensorFlow</span><span class="ep-tag">LiteLLM</span><span class="ep-tag">ShadowRay</span><span class="ep-tag">HuggingFace</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-live">Available now</span><span class="ep-runtime">~20 min</span></div>
    </div>

    <div class="ep-row ep-featured">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-label">07</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-15-project-butterfly-of-damocles-part-7 %}">Glasswing &mdash; the most consequential policy decision in OSS security history</a></div>
        <div class="ep-desc">April 8, 2026. Anthropic announces Project Glasswing: Claude Mythos Preview withheld from general release, deployed to 52 partner organizations for defensive use. A 27-year-old OpenBSD bug. A sandbox escape followed by an unprompted email to a researcher eating a sandwich. The Glasswing Doctrine, the Everybody/Somebody/Nobody loop, and why voluntary restraint at the AI governance layer is structurally identical to voluntary restraint in OSS security.</div>
        <div class="ep-tags-row"><span class="ep-tag">Project Glasswing</span><span class="ep-tag">Claude Mythos</span><span class="ep-tag">Glasswing Doctrine</span><span class="ep-tag">capability withholding</span><span class="ep-tag">AARM</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">[Forthcoming]</span><span class="ep-runtime">~22 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">08</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-16-project-butterfly-of-damocles-part-8 %}">The compliance cliff &mdash; CISA KEV was designed for a different world</a></div>
        <div class="ep-desc">Every regulatory vulnerability management framework assumes discovery is scarce and disclosure is sequential. Glasswing produces thousands of simultaneous zero-day advisories. This episode models what happens when federal agencies receive 1,000 simultaneous zero-day advisories &mdash; and maps the 18-month window before the disclosure flood hits a compliance stack nobody has started redesigning.</div>
        <div class="ep-tags-row"><span class="ep-tag">CISA KEV</span><span class="ep-tag">NVD</span><span class="ep-tag">FedRAMP</span><span class="ep-tag">CMMC</span><span class="ep-tag">compliance cliff</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">[Forthcoming]</span><span class="ep-runtime">~18 min</span></div>
    </div>

    <div class="ep-row">
      <div class="ep-num-cell"><div class="ep-num-label">Ep.</div><div class="ep-num-val">09</div></div>
      <div class="ep-body-cell">
        <div class="ep-title"><a href="{% post_url 2026-04-17-project-butterfly-of-damocles-conclusion %}">The pattern &mdash; only the substrate changes</a></div>
        <div class="ep-desc">Season finale. The fairy dust didn&rsquo;t disappear &mdash; it moved one abstraction layer higher with each generation. What the Glasswing Doctrine needs to become to be durable. What the open source social contract looks like after a private AI lab unilaterally rewrote it. And the question nobody is asking loudly enough: who patches the patcher&rsquo;s patcher, through what supply chain, while the patcher is fielding a Teams meeting request from a very convincing stranger.</div>
        <div class="ep-tags-row"><span class="ep-tag">synthesis</span><span class="ep-tag">OSS social contract</span><span class="ep-tag">governance</span><span class="ep-tag">Glasswing Doctrine</span><span class="ep-tag">season finale</span></div>
      </div>
      <div class="ep-status-cell"><span class="ep-badge b-soon">[Forthcoming]</span><span class="ep-runtime">~25 min</span></div>
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
      <h4>Thread 3 &mdash; The response story (Ep. 07, 08, 09)</h4>
      <p>Glasswing as policy precedent. The compliance cliff. Whether the voluntary restraint that produced Glasswing is more durable than the restraint that left the bugs unfixed for 27 years. The substrate change at the governance layer.</p>
      <ul class="arc-list">
        <li>Ep. 07 &mdash; Glasswing: the doctrine</li>
        <li>Ep. 08 &mdash; The compliance cliff</li>
        <li>Ep. 09 &mdash; The pattern: season finale</li>
      </ul>
    </div>

  </div>

  <hr class="s3-hr">
  <span class="s3-section-label">Recurring themes across Season 3</span>

  <div class="theme-grid">
    <div class="theme-card">
      <span class="theme-label theme-purple">The parable</span>
      <h4>Who is actually responsible for securing open source infrastructure?</h4>
      <p>Nobody &mdash; because everybody assumes somebody else will handle it. Introduced at DEF CON 22 to explain Heartbleed, the Everybody / Somebody / Nobody / Anybody parable returns in every episode as the structural explanation for why each generation of infrastructure inherits the same failure mode.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-red">The inversion</span>
      <h4>Why does security diligence become an attack surface?</h4>
      <p>Because the most security-conscious organizations ran Trivy most frequently and had the greatest exposure when Trivy itself was compromised. The XZ maintainer was trustworthy &mdash; which is exactly why the attack worked. Security posture becomes a vulnerability vector when the tools enforcing it are the target.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-teal">The layer shift</span>
      <h4>Why do the same infrastructure security failures repeat across technology generations?</h4>
      <p>The fairy dust doesn&rsquo;t disappear &mdash; it moves one abstraction layer higher. 2014: &ldquo;everyone&rsquo;s looking at the code.&rdquo; 2024: &ldquo;our tooling is trustworthy.&rdquo; 2026: &ldquo;our AI deployment is safe.&rdquo; The pattern is structurally identical. Only the substrate changes.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-amber">The ROI problem</span>
      <h4>Why are open source maintainers prime targets for nation-state attacks?</h4>
      <p>Because the ROI is extraordinary: two weeks of social engineering to own 100 million weekly downloads; two years to own a transitive dependency of sshd. The economics of targeting volunteer maintainers only improve as package footprints grow and audit resources stay flat.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-blue">The governance gap</span>
      <h4>Why do good intentions fail to produce durable security governance?</h4>
      <p>Because both the OSS social contract and the Glasswing Doctrine are built on voluntary behavior at a scale they were never designed for. Glasswing is voluntary restraint by one company. The OSS model was voluntary contribution by scattered individuals. Season 3 asks what &ldquo;durable&rdquo; actually requires structurally.</p>
    </div>
    <div class="theme-card">
      <span class="theme-label theme-coral">The velocity mismatch</span>
      <h4>What changes when AI discovers vulnerabilities faster than humans can patch them?</h4>
      <p>Discovery becomes essentially free, and the entire bottleneck shifts to everything that comes after: triage, coordination, patch development, deployment, compliance reporting. Mythos finds bugs at machine speed; patches still ship at human speed. Season 3 maps the 18-month gap between those two curves.</p>
    </div>
  </div>

  <hr class="s3-hr">
  <span class="s3-section-label">Supplementary Resources &amp; Artifacts</span>
  <p class="s3-lede" style="margin-bottom: 2rem;">For different ways to digest this information and explore the underlying thoughts, I compiled the original briefing documents, infographics, and multimedia discussions accompanying the series.</p>

  <div class="arc-grid">
    <div class="arc-card arc-purple">
      <h4>Multimedia &amp; Discussions</h4>
      <p>Listen to or watch deep-dive discussions breaking down the key concepts from the series.</p>
      <ul class="arc-list">
        <li><a href="https://youtu.be/SQ53F-VmgoE" target="_blank">Project Butterfly Video Overview (YouTube)</a></li>
        <li><a href="https://open.spotify.com/episode/3hMKtfWFE204HUTVbtbp3K?si=yHaRfpMvSLucP19P2IVw9A" target="_blank">Podcast Episode 1 (Spotify)</a></li>
        <li><a href="https://open.spotify.com/episode/3hMKtfWFE204HUTVbtbp3K?si=yHaRfpMvSLucP19P2IVw9A" target="_blank">Podcast Episode 2 (Spotify)</a></li>
      </ul>
    </div>

    <div class="arc-card arc-red">
      <h4>Executive Briefings &amp; Decks</h4>
      <p>The original documents framing the strategic implications of Project Glasswing.</p>
      <ul class="arc-list">
        <li><a href="/artifacts/ExecutiveOverview.pdf" target="_blank">Executive Overview (PDF)</a></li>
        <li><a href="/artifacts/The_GlassFairyWings_Briefing.pdf" target="_blank">The GlassFairyWings Briefing (Slide Deck)</a></li>
      </ul>
    </div>

    <div class="arc-card arc-teal">
      <h4>Infographics &amp; Visuals</h4>
      <p>Visual aids and cover art summarizing the twelve-year timeline and attack models.</p>
      <ul class="arc-list">
        <li><strong>Infographics:</strong> <a href="/artifacts/1infographic.png" target="_blank">01</a> &middot; <a href="/artifacts/2infographic.png" target="_blank">02</a> &middot; <a href="/artifacts/3infographic.png" target="_blank">03</a></li>
        <li><strong>Episode Art:</strong> 
          <a href="/artifacts/Episode1.png" target="_blank">01</a> &middot; 
          <a href="/artifacts/Episode2.png" target="_blank">02</a> &middot; 
          <a href="/artifacts/Episode3.png" target="_blank">03</a> &middot; 
          <a href="/artifacts/Episode4.png" target="_blank">04</a> &middot; 
          <a href="/artifacts/Episode5.png" target="_blank">05</a><br>
          <a href="/artifacts/Episode6.png" target="_blank">06</a> &middot; 
          <a href="/artifacts/Episode7.png" target="_blank">07</a> &middot; 
          <a href="/artifacts/Episode8.png" target="_blank">08</a> &middot; 
          <a href="/artifacts/Episode9.png" target="_blank">09</a>
        </li>
      </ul>
    </div>
  </div>

  <div class="s3-pullquote">
    <p>&ldquo;Project Butterfly of Damocles: named for the moment you realize the sword has been hanging above the internet since 1998 &mdash; and that the thread was always a volunteer with a day job.&rdquo;</p>
    <span class="attr">&mdash; Series concept note, April 2026</span>
  </div>

  <div class="s3-infobox">
    <p>Episodes 01&ndash;06 are available now. Episodes marked <strong>[Forthcoming]</strong> (07&ndash;09) are scheduled for Q2&ndash;Q3 2026 and describe events as they develop &mdash; they are clearly distinguished from the documented incidents in earlier episodes. Subscribe to the Morphogenetic SOC newsletter at securesql.info for release notifications.</p>
  </div>

</div><!-- /s3-intro-block -->

<hr class="gw-hr">

  <div class="conflict-box" style="margin-top:2rem">
    <div class="gw-byline"><strong>John Menerick</strong> is a senior information security architect and engineer (CISSP, NSA, CKS/CKA). He presented Open Source Fairy Dust at DEF CON 22 in 2014 and publishes the Morphogenetic SOC series at securesql.info.</div>
    <span class="conflict-label">Conflict of interest disclosure</span>
    <p>The author is affiliated with Project Glasswing. This post reflects the author&rsquo;s independent analysis and opinions only, and does not represent the views or positions of Anthropic, Project Glasswing, or any Glasswing launch partner. Readers should weigh the author&rsquo;s affiliation accordingly when evaluating assessments of the initiative&rsquo;s merits and limitations.</p>
  </div>


</div><!-- /glasswing-wrapper -->

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is Project Glasswing?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Project Glasswing is an Anthropic initiative that withheld Claude Mythos Preview from general release and deployed it to 52 partner organizations for defensive security use. It represents the first large-scale voluntary restraint of an AI capability for security reasons, establishing what the author calls the Glasswing Doctrine."
      }
    },
    {
      "@type": "Question",
      "name": "What is the Glasswing Doctrine?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The Glasswing Doctrine is the principle that voluntary restraint at the AI capability governance layer is structurally identical to voluntary restraint in open source security — both depend on goodwill at a scale they were never designed for, and both are vulnerable to the same Everybody/Somebody/Nobody failure mode."
      }
    },
    {
      "@type": "Question",
      "name": "What happened in the Trivy-action supply chain attack of March 2026?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "On March 19, 2026, threat group TeamPCP force-pushed malicious commits to 76 of 77 trivy-action version tags simultaneously. Because Trivy is a security scanner run by the most security-conscious organizations, the most diligent teams had the greatest exposure. The cascade included CanisterWorm with blockchain C2, a Checkmarx KICS breach, a LiteLLM AI key vault breach, Telnyx WAV steganography exfiltration, and 92 GB of data stolen from European Commission systems."
      }
    },
    {
      "@type": "Question",
      "name": "What is Project Butterfly of Damocles?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Project Butterfly of Damocles is a 9-episode blog series tracing twelve years of open source supply chain risk — from John Menerick's 2014 DEF CON 22 presentation on foundational internet infrastructure vulnerabilities, through the XZ Utils backdoor, the March 2026 Trivy-action and Axios supply chain attacks, and the emergence of Project Glasswing as the first AI-powered defensive response."
      }
    },
    {
      "@type": "Question",
      "name": "What did John Menerick present at DEF CON 22?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "At DEF CON 22 in 2014, John Menerick presented 'Open Source Fairy Dust,' a quantitative analysis of over 2,000 open source projects showing that foundational internet infrastructure — including Exim, BIND, and OpenSSL — was riddled with critical vulnerabilities that nobody was fixing, sustained by volunteer labor and collective myth rather than systematic security engineering."
      }
    },
    {
      "@type": "Question",
      "name": "Why does security diligence become an attack surface?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "When a security tool itself is compromised, the organizations running it most frequently — the most security-conscious ones — have the greatest exposure. The March 2026 Trivy-action attack exploited this inversion directly: teams that followed best practices and ran the scanner in every CI pipeline were hit hardest. Security posture becomes a vulnerability vector when the enforcement tooling is the target."
      }
    },
    {
      "@type": "Question",
      "name": "What is the Everybody/Somebody/Nobody/Anybody parable?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A structural explanation for open source security failures: Everybody assumed Somebody would secure critical infrastructure, so Nobody did — because Anybody could, which means Nobody had to. Introduced at DEF CON 22 to explain Heartbleed, the parable recurs across every episode of Project Butterfly of Damocles as the root cause connecting 2014 vulnerabilities to the 2026 supply chain attacks."
      }
    }
  ]
}
</script>
