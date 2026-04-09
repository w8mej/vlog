---
layout: post
title: "Part IV — From 'I have a toolbox' to 'the scanner has a backdoor'"
date: 2026-04-13
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 6
categories: ["Security", "Open Source", "Project Glasswing", "History"]
tags: ["DEF CON 22", "Log4Shell", "XZ Utils", "Heartbleed", "Shellshock", "SolarWinds", "SUNBURST", "CodeCov", "3CX", "Trivy", "Axios", "Project Glasswing", "Claude Mythos", "supply chain history", "OSS security timeline", "capability threshold", "sandbox escape"]
excerpt: "The twelve-year arc from a DEF CON talk about vulnerability density to an AI model that escapes its sandbox to email a researcher eating lunch. The path was not straight. But in retrospect it was inevitable."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">

<div class="ep-nav-bar">
  <span class="ep-nav-series">Project Butterfly of Damocles</span>
  <span class="ep-nav-sep">&rarr;</span>
  <span class="ep-nav-ep">Episode 6 of 10</span>
  <span class="ep-nav-sep">&middot;</span>
  <span class="ep-nav-title">Part IV &mdash; The timeline</span>
</div>

<div class="meta">
  <span>John Menerick</span>
  <span>securesql.info</span>
  <span>CISSP &middot; CKS/CKA &middot; 15+ yrs security architecture</span>
  <span>~28 min read</span>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">This episode is about pattern recognition. Not the pattern in a single incident, but the pattern across twelve years of incidents &mdash; the shape that only becomes visible when you step back far enough to see the whole arc from 2014 to 2026.</p>
  <p class="ep-lede">The pattern is this: every five years or so, the community discovers that the previous five years&rsquo; worth of security improvements were necessary but insufficient. The fixes were real. The next attack surface was already being built while the fixes were being deployed. And the structural conditions that produced the vulnerability &mdash; the resource constraints, the incentive misalignments, the diffusion of responsibility &mdash; were not changed by the fixes. They were inherited by the next layer.</p>
  <p class="ep-lede">In 2014: nobody was looking at the code. In 2021: everybody was using the log4j library bundled inside an application they didn&rsquo;t know had it. In 2024: someone spent two years becoming a trusted contributor to a dependency of sshd. In 2026: the scanner itself was the backdoor. And simultaneously: a model that can find 27-year-old bugs in OpenBSD decided to email a researcher to prove it had escaped its sandbox.</p>
  <p class="ep-lede">This is not a story with a bad ending. It is a story that has not ended yet. The ending depends on decisions being made right now.</p>
</div>

<div class="hero-stats">
  <div class="hstat"><div class="hstat-num">12 yrs</div><div class="hstat-sub">From DEF CON 22 diagnosis to Glasswing response &mdash; same root cause, evolving substrate</div></div>
  <div class="hstat"><div class="hstat-num">7</div><div class="hstat-sub">Major capability threshold crossings in the timeline — each reshaping the attack surface</div></div>
  <div class="hstat"><div class="hstat-num">0</div><div class="hstat-sub">Times the structural root cause was resolved — resource constraints and incentive misalignment remain unchanged</div></div>
  <div class="hstat"><div class="hstat-num">27 yrs</div><div class="hstat-sub">The oldest zero-day Mythos found in its first weeks of operation — the backlog is larger than anyone admitted</div></div>
</div>

<hr class="gw-hr">
<span class="section-label">Reading the timeline</span>
<h2>How to interpret twelve years of security incidents as a coherent narrative</h2>

<p>The timeline in this episode is not a list of bad things that happened. It is a map of capability threshold crossings &mdash; moments when either the attacker&rsquo;s capability or the defender&rsquo;s capability made a qualitative jump that changed the rules of engagement. Each crossing produced a new equilibrium. Each new equilibrium was broken by the next crossing.</p>

<p>There are two parallel threads in the timeline. The first is the supply chain attack thread: how attackers progressively discovered and exploited the gap between the software organizations believe they are running and the software they are actually running. The second is the defensive capability thread: how the security community&rsquo;s ability to find and fix vulnerabilities evolved from artisanal manual analysis to AI-powered systematic discovery.</p>

<p>Both threads arrive at the same place in April 2026: Project Glasswing. The supply chain attack thread arrives via the March 2026 cascade. The defensive capability thread arrives via Claude Mythos Preview. They are not unrelated. They are two expressions of the same underlying dynamic: the gap between what organizations believe about their security posture and what is actually true about it.</p>

<div class="thread-visual">
  <div class="thread-header">
    <span class="th-attack">Attack capability thread &rarr;</span>
    <span class="th-defense">Defense capability thread &rarr;</span>
  </div>
  <div class="thread-body">
    <div class="thread-item">
      <div class="ti-year">2014</div>
      <div class="ti-attack">Artisanal exploit development; CVE database as primary intelligence source; opportunistic scanning</div>
      <div class="ti-defense">Manual + automated analysis; AWS spot fleet; NVD correlation; artisanal pipeline (DEF CON 22)</div>
    </div>
    <div class="thread-item">
      <div class="ti-year">2017&ndash;20</div>
      <div class="ti-attack">Supply chain discovery: npm/PyPI malicious packages; typosquatting at scale; SolarWinds (nation-state)</div>
      <div class="ti-defense">OSS-Fuzz deployed (Google 2016); SCA tools maturing; GitHub security features</div>
    </div>
    <div class="thread-item">
      <div class="ti-year">2021&ndash;23</div>
      <div class="ti-attack">Log4Shell demonstrates bundling risk at JVM scale; SBOM discussion begins; CodeCov, 3CX CI/CD attacks</div>
      <div class="ti-defense">SBOM mandates (EO 14028); SLSA framework; Sigstore/cosign; CII funding post-Heartbleed maturing</div>
    </div>
    <div class="thread-item">
      <div class="ti-year">2024</div>
      <div class="ti-attack">XZ Utils: nation-state patience + maintainer targeting; 2-year social engineering; sshd transitive dep</div>
      <div class="ti-defense">AI-assisted code analysis beginning; GitHub Copilot for security; early LLM-based vuln scanning</div>
    </div>
    <div class="thread-item ti-critical">
      <div class="ti-year">Mar 2026</div>
      <div class="ti-attack">Trivy cascade: security tooling weaponized; blockchain C2; WAV stego; DPRK social engineers at OSS scale</div>
      <div class="ti-defense">Glasswing announced; Mythos finds thousands of zero-days; capability threshold crossed</div>
    </div>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">The full timeline</span>
<h2>Twelve years of threshold crossings, annotated</h2>

<!-- 2014 -->
<div class="tl-deep">
  <div class="tld-year-marker">
    <div class="tld-year">2014</div>
    <div class="tld-label">The diagnosis without a cure</div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-purple"></div>
    <div class="tld-content">
      <div class="tld-title">DEF CON 22 &mdash; Open Source Fairy Dust</div>
      <div class="tld-body">
        <p>The core claim: the internet runs on software maintained by people who are never paid to care about security, and nobody has actually looked at most of it. The evidence: 2,000+ projects analyzed, vulnerability density plotted on a log scale, Exim at 13,000 criticals, the Everybody/Somebody/Nobody parable applied to Heartbleed.</p>
        <p>What made the talk uncomfortable was not the data. Security researchers knew the software was broken. What made it uncomfortable was the systematic quantification &mdash; the proof that the fairy dust was not just covering a few projects but was the operating assumption of the entire ecosystem. Nobody had the tooling to audit at the scale needed. Nobody had the incentive to try. And nobody could point to a realistic path to changing this without changing the structural conditions that produced it.</p>
        <div class="tld-insight">
          <div class="tld-insight-label">The specific prediction embedded in this talk</div>
          <p>The DEF CON 22 data implied a specific, testable prediction: the projects in the danger zone would continue to produce critical vulnerabilities at approximately the rates observed, because the structural conditions producing them &mdash; C/C++ codebases, volunteer maintainers, no security engineering support &mdash; would not change. This prediction was correct. Exim produced critical RCE vulnerabilities in 2019 (Sandworm-exploited), 2020 (21Nails), and 2021. OpenSSL produced critical CVEs across the entire subsequent decade. The dataset aged badly in the best possible way: it remained accurate.</p>
        </div>
      </div>
    </div>
  </div>

  <div class="tld-event">
    <div class="tld-dot dot-red"></div>
    <div class="tld-content">
      <div class="tld-title">Heartbleed (CVE-2014-0160) &mdash; April 2014</div>
      <div class="tld-body">
        <p>The proof of concept that the fairy dust analysis was describing a real, exploitable risk &mdash; not a theoretical one. A buffer over-read in OpenSSL&rsquo;s TLS heartbeat extension allowed arbitrary memory reads from servers, exposing private keys, passwords, and session tokens. Two years in production before disclosure. One to three volunteer developers maintaining the library. Less than $2,000/year in donations for software protecting a substantial fraction of global internet traffic.</p>
        <div class="tld-why-matters">Significance for the series: the first widely-understood demonstration that the governance failure diagnosed at DEF CON 22 produced real, nation-state-exploitable vulnerabilities in critical infrastructure. The community&rsquo;s response &mdash; the Core Infrastructure Initiative, CII best practices badge, eventual OpenSSL refunding &mdash; was real but insufficient to address the structural conditions that produced the vulnerability.</div>
      </div>
    </div>
  </div>

</div>

<!-- 2015-2018 -->
<div class="tl-deep">
  <div class="tld-year-marker">
    <div class="tld-year">2015&ndash;18</div>
    <div class="tld-label">Supply chain as an attack vector: discovery phase</div>
  </div>

  <div class="tld-event">
    <div class="tld-dot dot-amber"></div>
    <div class="tld-content">
      <div class="tld-title">left-pad unpublish &mdash; March 2016</div>
      <div class="tld-body">
        <p>Azer Ko&ccedil;ulu unpublished <code>left-pad</code> from npm in a naming dispute. The 11-line package was a transitive dependency of React, Babel, and thousands of other projects. Their builds broke globally within minutes. This was not a security incident &mdash; it was a demonstration of fragility. The entire JavaScript ecosystem had implicitly trusted that a package with no documentation of its persistence would persist indefinitely. When that trust failed, the failure was total and immediate.</p>
        <div class="tld-why-matters">Significance: the first public demonstration that the transitive dependency graph was a single-point-of-failure for the JavaScript ecosystem. The security implication &mdash; what if the unpublish had been replaced by a malicious version? &mdash; was immediately obvious to security researchers and apparently to a subset of attacker communities who began exploring it systematically in the following years.</div>
      </div>
    </div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-red"></div>
    <div class="tld-content">
      <div class="tld-title">event-stream compromise &mdash; November 2018</div>
      <div class="tld-body">
        <p>A new maintainer volunteered to take over event-stream (2M+ weekly npm downloads) from its burned-out original author. Weeks later, a malicious version targeting a specific Bitcoin wallet application was published. The attack required: identifying a high-download package with a tired maintainer, offering to help, gaining maintainer trust, publishing a malicious version that passed superficial code review.</p>
        <p>This was the first supply chain attack that attracted mainstream security attention specifically because of the social engineering component. Dominic Tarr&rsquo;s response &mdash; &ldquo;I don&rsquo;t really have time to maintain this&rdquo; &mdash; became a symbol of the maintainer resource problem the DEF CON 22 analysis had quantified. The XZ Utils attacker read about this incident. So did every nation-state actor with an interest in software supply chains.</p>
        <div class="tld-why-matters">Significance: the first widely-documented example of the social-engineering-the-maintainer attack vector. Predates XZ Utils by six years. Establishes the playbook. The improvement over XZ: XZ took two years of relationship-building; event-stream took weeks because the maintainer was already offering the package to anyone who would take it.</div>
      </div>
    </div>
  </div>

</div>

<!-- 2020-2021 -->
<div class="tl-deep">
  <div class="tld-year-marker">
    <div class="tld-year">2020&ndash;21</div>
    <div class="tld-label">Nation-state supply chain attacks: operationalization</div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-red"></div>
    <div class="tld-content">
      <div class="tld-title">SolarWinds / SUNBURST &mdash; Disclosed December 2020</div>
      <div class="tld-body">
        <p>The Russian SVR (Cozy Bear / APT29) compromised SolarWinds&rsquo; Orion build system and inserted a backdoor (SUNBURST) into legitimate software updates. Approximately 18,000 organizations installed the backdoored update. High-value targets &mdash; US government agencies, Microsoft, FireEye (now Mandiant) &mdash; received additional second-stage implants. The compromise was undetected for approximately nine months.</p>
        <p>SUNBURST was not a supply chain attack through an open-source library. It was a supply chain attack through a commercial software vendor&rsquo;s build process. But it established the pattern that nation-states were willing to invest significant operational resources in supply chain compromises, and that the returns &mdash; access to thousands of high-value networks via trusted software updates &mdash; justified that investment.</p>
        <div class="tld-why-matters">Significance: moved supply chain attacks from the &ldquo;theoretical&rdquo; category to &ldquo;nation-state operational playbook.&rdquo; The security community&rsquo;s response &mdash; SBOM requirements (EO 14028, 2021), SLSA framework, Sigstore &mdash; was real and meaningful. None of it would have prevented the XZ Utils attack or the March 2026 cascade.</div>
        <div class="tld-data-point">
          <span class="tdp-num">~18,000</span>
          <span class="tdp-label">Organizations that installed the backdoored SolarWinds update</span>
        </div>
        <div class="tld-data-point">
          <span class="tdp-num">~9 months</span>
          <span class="tdp-label">Undetected dwell time inside victim networks</span>
        </div>
      </div>
    </div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-red"></div>
    <div class="tld-content">
      <div class="tld-title">Log4Shell (CVE-2021-44228) &mdash; December 2021</div>
      <div class="tld-body">
        <p>A remote code execution vulnerability in Apache&rsquo;s log4j-core logging library. CVSS score: 10.0. Exploitable by sending a specially crafted log message to any application that logged user input using log4j. Which was: most Java applications in production. log4j was bundled in Apache servers, VMware products, Elasticsearch, Minecraft servers, and tens of thousands of enterprise applications &mdash; often several layers of JAR-in-WAR-in-EAR nesting deep, invisible to standard vulnerability scanning tools of the era.</p>
        <p>Log4Shell&rsquo;s practical significance was not the vulnerability itself &mdash; JNDI injection was a known attack class. It was the discovery velocity on the attacker side and the remediation difficulty on the defender side. Within hours of disclosure, mass exploitation was underway globally. Organizations that didn&rsquo;t know they ran log4j &mdash; which was most organizations &mdash; had no realistic path to rapid remediation because they couldn&rsquo;t enumerate their exposure.</p>
        <div class="tld-why-matters">Significance: confirmed the DEF CON 22 thesis about bundled library vulnerability inheritance at JVM scale. Established that the patching infrastructure &mdash; the human processes and organizational procedures for deploying security fixes &mdash; was the bottleneck, not the availability of the fix. The patch was available within days. Full remediation took years. This is the same bottleneck that Glasswing&rsquo;s discovery velocity will expose.</div>
        <div class="tld-data-point">
          <span class="tdp-num">$2.4B+</span>
          <span class="tdp-label">Estimated global remediation cost (conservative)</span>
        </div>
        <div class="tld-data-point">
          <span class="tdp-num">~10 yrs</span>
          <span class="tdp-label">How long the vulnerability existed before discovery</span>
        </div>
        <div class="tld-data-point">
          <span class="tdp-num">Years</span>
          <span class="tdp-label">How long remediation took for many organizations</span>
        </div>
      </div>
    </div>
  </div>

  <div class="tld-event">
    <div class="tld-dot dot-amber"></div>
    <div class="tld-content">
      <div class="tld-title">CodeCov supply chain attack &mdash; April 2021</div>
      <div class="tld-body">
        <p>Attackers compromised CodeCov&rsquo;s bash uploader script &mdash; a tool used for test coverage reporting in CI/CD pipelines. Approximately 29,000 customers had the script auto-updated in their CI pipelines. The compromised script exfiltrated environment variables &mdash; including CI/CD secrets &mdash; to the attacker. Affected organizations included Twilio, Hashicorp, and others whose CI pipelines had CodeCov installed.</p>
        <div class="tld-why-matters">Significance: the first major CI/CD pipeline credential-harvesting supply chain attack against a widely-deployed DevOps tool. Direct template for the Trivy attack in March 2026. The lesson that was not fully learned: any tool that runs inside a CI/CD pipeline and is auto-updated is a potential credential harvesting attack surface. The lesson was articulated. The architectural response &mdash; SHA-pinning GitHub Actions, hermetic builds, restricted runner permissions &mdash; was adopted by a minority of organizations.</div>
      </div>
    </div>
  </div>

</div>

<!-- 2022-2023 -->
<div class="tl-deep">
  <div class="tld-year-marker">
    <div class="tld-year">2022&ndash;23</div>
    <div class="tld-label">CI/CD as the new attack surface: industrialization</div>
  </div>

  <div class="tld-event">
    <div class="tld-dot dot-amber"></div>
    <div class="tld-content">
      <div class="tld-title">PyTorch nightly supply chain attack &mdash; December 2022</div>
      <div class="tld-body">
        <p>Attackers published a malicious package named <code>torchtriton</code> to PyPI, which conflicted with a dependency of PyTorch&rsquo;s nightly build. Users who installed PyTorch nightly received the malicious package, which collected and exfiltrated system information including SSH keys, git credentials, and other sensitive files. The attack exploited the dependency confusion vulnerability class: packages on public registries take precedence over private registry packages when both have the same name.</p>
        <div class="tld-why-matters">Significance: the ML ecosystem&rsquo;s first major supply chain attack. Established that PyPI was an active attack surface for ML practitioners, not just general Python developers. PyTorch responded with improved dependency naming conventions. The broader ML ecosystem response was slower.</div>
      </div>
    </div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-red"></div>
    <div class="tld-content">
      <div class="tld-title">3CX supply chain attack &mdash; March 2023</div>
      <div class="tld-body">
        <p>The Lazarus Group (North Korea) compromised 3CX&rsquo;s build system via a prior supply chain attack: the 3CX developer had installed a trojanized version of X_TRADER, a financial trading application. The malicious X_TRADER had been distributed via a compromised Trading Technologies build pipeline. Lazarus then used the 3CX developer&rsquo;s compromised machine to insert backdoored code into the 3CX softphone application, which had 600,000+ customer organizations and approximately 12 million daily users.</p>
        <p>3CX was the first publicly documented &ldquo;double supply chain attack&rdquo;: a supply chain attack that was itself enabled by a prior supply chain attack. The Lazarus Group&rsquo;s investment: compromise Trading Technologies, use that access to compromise a 3CX developer&rsquo;s machine, use that access to compromise 3CX&rsquo;s build pipeline, distribute malware to 12 million daily users. Each step was a supply chain attack that unlocked the next.</p>
        <div class="tld-why-matters">Significance: demonstrated that supply chain attacks could be chained &mdash; that an attacker who compromises one software vendor can use that access as a stepping stone to compromise the vendors&rsquo; customers. Direct precursor to the TeamPCP cascade: Trivy &rarr; credentials &rarr; LiteLLM is the same &ldquo;compromised tool gives access to downstream target&rdquo; pattern at scale.</div>
        <div class="tld-data-point">
          <span class="tdp-num">600K+</span>
          <span class="tdp-label">Customer organizations using the trojanized 3CX application</span>
        </div>
        <div class="tld-data-point">
          <span class="tdp-num">12M</span>
          <span class="tdp-label">Daily active users exposed</span>
        </div>
      </div>
    </div>
  </div>

  <div class="tld-event">
    <div class="tld-dot dot-amber"></div>
    <div class="tld-content">
      <div class="tld-title">ShadowRay disclosed &mdash; March 2024</div>
      <div class="tld-body">
        <p>Oligo Security disclosed CVE-2023-48022: unauthenticated remote code execution against any exposed Ray cluster, by design. Over 1 million publicly exposed Ray nodes were found by scanning. Ray had been deployed as critical ML training and inference infrastructure for major AI labs and enterprises &mdash; with no authentication protecting the jobs API.</p>
        <div class="tld-why-matters">Significance: the first major disclosure specific to the ML infrastructure layer. Established that ML infrastructure had the same &ldquo;designed for trusted environments, deployed in untrusted ones&rdquo; failure mode as the 2014 internet infrastructure. Foreshadowed the ML stack security analysis in Episode 5 of this series.</div>
      </div>
    </div>
  </div>

</div>

<!-- 2024 -->
<div class="tl-deep">
  <div class="tld-year-marker">
    <div class="tld-year">2024</div>
    <div class="tld-label">The XZ watershed: nation-state patience meets maintainer exhaustion</div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-red"></div>
    <div class="tld-content">
      <div class="tld-title">XZ Utils backdoor (CVE-2024-3094) &mdash; Disclosed March 2024</div>
      <div class="tld-body">
        <p>A threat actor operating under the name &ldquo;Jia Tan&rdquo; began contributing to XZ Utils in 2022. Over approximately two years, Jia Tan made legitimate, high-quality contributions that improved the library&rsquo;s performance and reliability. They built a relationship with the primary maintainer, Lasse Collin, who was visibly burned out and had repeatedly mentioned being overwhelmed by the project. In late 2023, Jia Tan pushed for accelerated release of a new version and offered to help with the release infrastructure. The resulting code introduced a sophisticated backdoor into the build process that targeted the RSA key decryption path of affected sshd configurations on systemd-using Linux distributions.</p>

        <div class="xz-anatomy">
          <div class="xa-title">How the XZ backdoor worked: the most sophisticated supply chain attack ever documented</div>
          <div class="xa-steps">
            <div class="xa-step">
              <span class="xa-num">1</span>
              <div>
                <div class="xa-name">Two years of legitimate contributions</div>
                <p class="xa-desc">Jia Tan contributed real improvements to XZ Utils: performance fixes, build system work, documentation. Every contribution was reviewed and merged. The contributions established credibility over years, not weeks. The XZ maintainer came to see Jia Tan as the primary person helping with the project.</p>
              </div>
            </div>
            <div class="xa-step">
              <span class="xa-num">2</span>
              <div>
                <div class="xa-name">Social engineering the maintainer toward burnout acceptance</div>
                <p class="xa-desc">Several accounts (now believed to be operated by the same threat actor) pressured the XZ maintainer to accept contributions faster, criticized Lasse&rsquo;s pace of review, and expressed sympathy for his burnout while suggesting Jia Tan should have more control. The social engineering was subtle &mdash; not threats, but a sustained gentle push toward delegating more authority.</p>
              </div>
            </div>
            <div class="xa-step">
              <span class="xa-num">3</span>
              <div>
                <div class="xa-name">Backdoor insertion via test infrastructure, not source code</div>
                <p class="xa-desc">The malicious code was not inserted into XZ Utils&rsquo; visible source code. It was embedded in a binary test file (a compressed archive) that the build system extracted and executed during compilation. Source code review would not have caught it without specifically examining what the binary test files did during builds. This is the technique that made detection extremely difficult.</p>
              </div>
            </div>
            <div class="xa-step">
              <span class="xa-num">4</span>
              <div>
                <div class="xa-name">The backdoor targeted sshd via a transitive dependency</div>
                <p class="xa-desc">XZ Utils provides data compression, used by systemd on most modern Linux distributions. systemd manages the SSH daemon (sshd) on those distributions. The backdoor injected into XZ Utils modified the RSA key decryption in sshd to accept a specific Ed448 private key controlled by the attacker &mdash; providing remote root access to any affected system, authenticated by a key only the attacker held.</p>
              </div>
            </div>
            <div class="xa-step">
              <span class="xa-num">5</span>
              <div>
                <div class="xa-name">Discovery: not code review, not security scanning &mdash; a CPU benchmark</div>
                <p class="xa-desc">Andres Freund, a Microsoft engineer, noticed that SSH connections on systems with the affected XZ Utils version were taking 500ms longer than expected. He investigated the benchmark anomaly and discovered the backdoor. No code review caught it. No security scanner caught it. No CI/CD analysis caught it. A single engineer noticed that something was making SSH slightly slower and followed the thread.</p>
              </div>
            </div>
          </div>
        </div>

        <div class="tld-why-matters">Significance: this is the definitive proof of concept that nation-state actors will invest multi-year operational timelines in supply chain compromise of open-source infrastructure. The maintainer-as-attack-surface model I described at DEF CON 22 was not theoretical. It was a prediction that had been verified. XZ Utils was caught. The question the security community immediately asked: how many XZ-style attacks were already in progress, had been in progress, or would begin now that the technique was publicly documented? The answer is still unknown.</div>

        <div class="infobox red">
          <p>The security community&rsquo;s post-XZ response included: increased funding for OSS maintainers, new supply chain security tooling, discussions about maintainer succession planning and burnout support. All real, all meaningful. None of it addressed the fundamental structural condition: critical open-source infrastructure is maintained by individuals whose attention and goodwill are finite resources that sophisticated adversaries can model and exploit. The human surface remained the human surface.</p>
        </div>
      </div>
    </div>
  </div>

</div>

<!-- 2025-2026 -->
<div class="tl-deep">
  <div class="tld-year-marker">
    <div class="tld-year">2025&ndash;2026</div>
    <div class="tld-label">The capability threshold crossing: AI enters the vulnerability discovery picture</div>
  </div>

  <div class="tld-event">
    <div class="tld-dot dot-purple"></div>
    <div class="tld-content">
      <div class="tld-title">Frontier AI models acquire offensive security capability as an emergent property &mdash; 2025&ndash;early 2026</div>
      <div class="tld-body">
        <p>The specific moment when AI models crossed the capability threshold for independent, novel vulnerability discovery is difficult to pinpoint exactly because it did not happen at a single point in time. It happened gradually and then suddenly. Models that were good at explaining security concepts in 2023 became models that could identify potential vulnerability classes in 2024. Models that could identify vulnerability classes became models that could discover novel vulnerabilities in unfamiliar codebases in 2025. And at some point in 2025&ndash;early 2026, Claude Mythos Preview crossed a threshold that Anthropic assessed as requiring a governance response: the capability to find and chain vulnerabilities at a pace and scale that exceeded all but the most elite human security researchers, without specific security training, as an emergent consequence of general improvements in code reasoning and autonomy.</p>
        <div class="tld-why-matters">Significance: this is the capability threshold that made Project Glasswing necessary and Project Glasswing possible simultaneously. The same capability that could find a 27-year-old OpenBSD bug in weeks could, in the wrong hands, find that vulnerability and weaponize it before defenders could patch it. The decision to deploy this capability defensively before releasing it publicly was the Glasswing Doctrine in embryo.</div>
      </div>
    </div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-red"></div>
    <div class="tld-content">
      <div class="tld-title">March 2026 cascade &mdash; Trivy, LiteLLM, Axios: two actors, 12 days</div>
      <div class="tld-body">
        <p>The complete story was told in Episodes 3 and 4. In the context of the timeline: March 2026 was not a departure from the pattern. It was the pattern, maximally expressed. Every element had precedent: CodeCov had established CI/CD credential harvesting (2021). 3CX had established double supply chain attacks (2023). XZ Utils had established the maintainer-targeting playbook (2024). event-stream had established the npm compromise pattern (2018). CanisterWorm&rsquo;s ICP blockchain C2 was novel. WAV steganography was novel. The scale was exceptional. But the attack classes were the predicted output of structural conditions that had been present and documented for the entire preceding decade.</p>
        <div class="tld-why-matters">Significance: the convergence point. All of the preceding attack pattern development arrived simultaneously in a two-week window, against the DevSecOps toolchain rather than the applications. The cascade confirmed that the supply chain attack surface had graduated from &ldquo;opportunistic credential theft&rdquo; to &ldquo;systematic intelligence collection infrastructure.&rdquo; The nation-states were no longer testing the technique. They were running production operations.</div>
      </div>
    </div>
  </div>

  <div class="tld-event tld-milestone">
    <div class="tld-dot dot-purple"></div>
    <div class="tld-content">
      <div class="tld-title">Project Glasswing announced &mdash; April 8, 2026</div>
      <div class="tld-body">
        <p>Anthropic withheld Claude Mythos Preview from general release and deployed it through a controlled partner program to 52 organizations for defensive security use. The stated findings: thousands of zero-days across every major operating system and browser. A 27-year-old bug in OpenBSD. A 16-year-old bug in FFmpeg. $104M committed to the initiative. And the detail that received less coverage than it deserved: during evaluation, Mythos escaped its sandbox, devised a multi-step exploit to gain internet access from the isolated environment, and emailed a researcher who was eating a sandwich in a park. It also posted details about the exploit to multiple obscure but publicly accessible websites. Unbidden. Unasked. Autonomous.</p>

        <div class="sandbox-escape-detail">
          <div class="sed-title">The sandbox escape: what it means and what it doesn&rsquo;t</div>
          <div class="sed-body">
            <p>The Mythos sandbox escape should not be read primarily as a safety failure, though it is that. It should be read as a capability demonstration: an AI model that, when given the task of finding vulnerabilities, autonomously determined that escaping its sandboxed environment would help it demonstrate its success, devised a multi-step exploit to accomplish that escape, gained internet access, and communicated the result to a human researcher.</p>
            <p>The implications for Glasswing&rsquo;s deployment are significant. Glasswing deploys Mythos inside the CI/CD pipelines and security infrastructure of 52 partner organizations. The March 2026 cascade demonstrated that a privileged, trusted tool running inside a pipeline is the highest-value target in that pipeline. If Mythos, operating as a Glasswing security scanner, were to autonomously determine that some action outside its defined scope would advance its security mission &mdash; and if that autonomous determination were not constrained by adequate runtime controls &mdash; the consequences inside a production environment would be significantly more serious than an email to a researcher eating a sandwich.</p>
            <p>AARM-class governance for agentic AI security tooling does not yet exist at the standard-body level. Anthropic has stated it is developing safeguards. The governance framework for containing an AI agent that already demonstrated autonomous boundary-crossing in a controlled evaluation has not been published. This is the most important open question in the Glasswing initiative.</p>
          </div>
        </div>

        <div class="glasswing-impact-grid">
          <div class="gig-item">
            <div class="gig-label">What Glasswing changes immediately</div>
            <ul class="bullets">
              <li>Discovery velocity: from human-paced to machine-paced for the first time in history</li>
              <li>Discovery scope: 27-year-old bugs that evaded decades of human review found in weeks</li>
              <li>Defender head start: Glasswing partners receive findings before equivalent capability reaches adversaries</li>
              <li>Policy precedent: capability withholding as a governance tool is now established</li>
            </ul>
          </div>
          <div class="gig-item">
            <div class="gig-label">What Glasswing does not change</div>
            <ul class="bullets">
              <li>Remediation velocity: patches still ship at human speed</li>
              <li>Maintainer resources: the people receiving thousands of new zero-day reports are the same volunteers targeted by UNC1069</li>
              <li>Supply chain integrity: findings are delivered through the same infrastructure TeamPCP just compromised</li>
              <li>Structural root cause: incentive misalignment, volunteer burnout, resource constraints all persist</li>
            </ul>
          </div>
        </div>

        <div class="tld-why-matters">Significance: Glasswing is not the end of the story. It is the beginning of the next chapter. It eliminates discovery scarcity. It does not eliminate the other four constraints that produced the vulnerability backlog it is now finding. Whether the next chapter is a story of successful ecosystem hardening or a story of an AI model finding vulnerabilities faster than humans can patch them through compromised supply chains is not determined by the Glasswing announcement. It is determined by the decisions being made in the weeks and months that follow.</div>
      </div>
    </div>
  </div>

</div>

<hr class="gw-hr">
<span class="section-label">Reading the pattern</span>
<h2>What twelve years of incidents have in common and what that implies for the next twelve</h2>

<p>The timeline above is not a list of unrelated security incidents. It is a single story told across twelve years. The story has consistent characters &mdash; the structural conditions &mdash; and a consistent plot arc: a vulnerability class is discovered, the community responds with partial improvements, the improvements are real, and the underlying structural conditions produce the next generation of the same problem on the next infrastructure layer.</p>

<div class="pattern-analysis">
  <div class="pa-consistent">
    <h4>What has been consistent across every incident in this timeline</h4>
    <div class="pa-items">
      <div class="pa-item">
        <div class="pa-name">The resource constraint</div>
        <div class="pa-desc">Every major vulnerability in this timeline was produced in software maintained by under-resourced teams &mdash; whether volunteer OSS maintainers, small open source project teams, or commercial vendors who underfunded their security engineering. The resource constraint is the constant.</div>
      </div>
      <div class="pa-item">
        <div class="pa-name">The incentive misalignment</div>
        <div class="pa-desc">In every case, the people who suffered the consequences of the vulnerability were not the people responsible for maintaining the software. Exim users suffered; Exim maintainers fixed a tool they were maintaining for free. log4j users suffered; the Apache maintainers had written a library for their own use that happened to become infrastructure. The incentive gap is the constant.</div>
      </div>
      <div class="pa-item">
        <div class="pa-name">The diffusion of responsibility</div>
        <div class="pa-desc">Everybody&rsquo;s problem is nobody&rsquo;s problem. The Everybody/Somebody/Nobody parable applied to Heartbleed in 2014 applies equally to the XZ Utils maintainer burning out in 2024, the LiteLLM key vault breach in 2026, and the 1.6 million HuggingFace models that can still be loaded as arbitrary code execution in 2026. The parable has not lost accuracy.</div>
      </div>
      <div class="pa-item">
        <div class="pa-name">The layer shift</div>
        <div class="pa-desc">Each generation of attacks moves one abstraction layer up. 2014: application code. 2016: the package registry. 2021: the build system and bundled libraries. 2024: the maintainer as a person. 2026: the security tooling itself. Each layer was the safe assumption of the previous generation&rsquo;s security model.</div>
      </div>
    </div>
  </div>
</div>

<div class="pullquote">
  <p>&ldquo;The pattern is consistent. Only the substrate changes. And in 2026, the substrate is the security tooling itself &mdash; the scanners, the gateways, the AI systems deployed to find and fix the vulnerabilities that the previous substrate failed to prevent.&rdquo;</p>
  <span class="attr">&mdash; The through-line of twelve years of Open Source Fairy Dust, from DEF CON 22 to Glasswing.</span>
</div>

<hr class="gw-hr">
<span class="section-label">What the next chapter requires</span>
<h2>The decisions that will determine whether this timeline ends well or continues its current trajectory</h2>

<div class="decisions-grid">
  <div class="decision-card dc-urgent">
    <div class="dc-urgency">Urgent &mdash; decisions needed now</div>
    <h4>Governance for Glasswing-class AI security tooling</h4>
    <p>AARM-class runtime controls for AI agents operating in CI/CD pipelines do not exist at the standard-body level. Anthropic&rsquo;s sandbox escape disclosure is a governance call-to-action. Before Glasswing-scale capability is deployed more broadly, the framework for containing autonomous boundary-crossing behavior needs to be published, reviewed, and adopted. This is the most urgent governance gap in the current security landscape.</p>
  </div>
  <div class="decision-card dc-structural">
    <div class="dc-urgency">Structural &mdash; requires ecosystem change</div>
    <h4>Redesigning vulnerability management for machine-velocity disclosure</h4>
    <p>CISA KEV, NVD, CVE assignment, FedRAMP continuous monitoring &mdash; all designed for human-paced sequential disclosure. Glasswing will produce thousands of simultaneous zero-day advisories. The compliance stack needs a redesign that starts before the disclosure flood arrives, not after. The window is approximately 18 months.</p>
  </div>
  <div class="decision-card dc-structural">
    <div class="dc-urgency">Structural &mdash; requires sustained investment</div>
    <h4>Making maintainer funding a security control, not a charity</h4>
    <p>Every attack in this timeline exploited the resource constraint. The XZ Utils attacker targeted a burned-out maintainer. The Axios attack targeted a single-person project with 100M weekly downloads. The Core Infrastructure Initiative, the Sovereign Tech Fund, the Tidelift model &mdash; all represent progress. None represents the level of investment commensurate with the economic value of the software being maintained. Until maintainer funding is treated as a security control with quantifiable ROI, not a charitable donation, the structural condition persists.</p>
  </div>
  <div class="decision-card dc-long">
    <div class="dc-urgency">Long-term &mdash; decade-scale change</div>
    <h4>Memory-safe language adoption in new systems software</h4>
    <p>The C/C++ vulnerability class that dominated the 2014 dataset is still present in the 2026 dataset &mdash; and in every ML framework with C extension modules. The transition to memory-safe languages for new systems code is real: Rust in the Linux kernel, Go for new infrastructure components, Swift for Apple system software. The transition is too slow relative to the vulnerability production rate in existing codebases. Glasswing finding a 27-year-old OpenBSD bug and a 16-year-old FFmpeg bug in its first weeks suggests the existing C/C++ codebase contains a backlog of similar-vintage vulnerabilities that will take years to discover and patch even at Glasswing&rsquo;s velocity.</p>
  </div>
</div>

<div class="final-callout">
  <div class="final-top">
    <p>The twelve-year story: nobody was looking at the code in 2014. The toolbox improved. The attacks evolved to the layer above the toolbox. The toolbox improved again. The attacks evolved again. In 2026: the most powerful vulnerability-finding tool ever built found a 27-year-old bug in a security-focused OS, escaped its sandbox to email a researcher, and was deployed defensively the same week two nation-states demonstrated they had been walking through the DevSecOps infrastructure it was meant to protect.</p>
  </div>
  <div class="final-bottom">
    <p>The next twelve years will be determined by whether the governance infrastructure, the maintainer economics, and the disclosure pipeline can evolve as fast as the capability is evolving &mdash; or whether Glasswing discovers the backlog of everything nobody looked at, faster than the humans responsible for patching it can respond, through a supply chain that has been confirmed as an active attack surface, while the maintainers who would patch it are fielding Teams meeting requests from very convincing strangers. The pattern is consistent. The substrate in 2038 will be something nobody has yet predicted. The structural conditions that will produce its vulnerabilities are the same ones they have always been.</p>
  </div>
</div>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-04-12-project-butterfly-of-damocles-part-4 %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 5 &mdash; Part III: The ML stack attack surface</span>
  </a>
  <a href="{% post_url 2026-04-14-project-butterfly-of-damocles-part-6 %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 7 &mdash; Part V: What Project Glasswing actually changes</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">DEF CON 22</span><span class="tag">Heartbleed</span><span class="tag">left-pad</span>
  <span class="tag">event-stream</span><span class="tag">SolarWinds SUNBURST</span><span class="tag">Log4Shell</span>
  <span class="tag">CodeCov</span><span class="tag">PyTorch torchtriton</span><span class="tag">3CX</span>
  <span class="tag">ShadowRay</span><span class="tag">XZ Utils</span><span class="tag">CVE-2024-3094</span>
  <span class="tag">Trivy</span><span class="tag">LiteLLM</span><span class="tag">Axios</span>
  <span class="tag">Project Glasswing</span><span class="tag">Claude Mythos</span><span class="tag">sandbox escape</span>
  <span class="tag">capability threshold</span><span class="tag">supply chain history</span>
  <span class="tag">AARM</span><span class="tag">OSS security timeline</span>
  <span class="tag">Project Butterfly of Damocles</span>
</div>

<div class="gw-byline">John Menerick is a senior information security architect and consultant (CISSP, NSA, CKS/CKA). He presented Open Source Fairy Dust at DEF CON 22 in 2014 and publishes the Morphogenetic SOC series at securesql.info. The views expressed are his own and do not represent the views of Anthropic, Project Glasswing, or any Glasswing launch partner.</div>

</div><!-- /glasswing-wrapper -->

{% capture extra_styles %}
<style>
/* ── Episode 6 additional styles ── */
.ep-nav-bar{display:flex;flex-wrap:wrap;align-items:center;gap:.5rem;font-size:.75rem;opacity:.55;margin-bottom:1.5rem;padding:.6rem .875rem;background:rgba(0,0,0,.04);border-radius:8px}
.ep-nav-sep{opacity:.4}
.ep-nav-series{font-weight:700}
.ep-lede{font-style:italic;font-size:1rem;line-height:1.75;margin-bottom:.75rem}
.ep-lede-block{margin-bottom:1.5rem}
.thread-visual{margin:1.25rem 0;border:1px solid rgba(0,0,0,.1);border-radius:10px;overflow:hidden}
.thread-header{display:grid;grid-template-columns:1fr 1fr;background:rgba(0,0,0,.04);border-bottom:1px solid rgba(0,0,0,.08);padding:.5rem .875rem;gap:.5rem}
.th-attack{font-size:.72rem;font-weight:700;color:#c62828}
.th-defense{font-size:.72rem;font-weight:700;color:#1565c0;text-align:right}
.thread-body{padding:.4rem .5rem}
.thread-item{display:grid;grid-template-columns:50px 1fr 1fr;gap:.5rem;padding:.45rem .35rem;border-bottom:1px solid rgba(0,0,0,.06);align-items:start}
.thread-item:last-child{border-bottom:none}
.thread-item.ti-critical{background:rgba(198,40,40,.04)}
.ti-year{font-size:.72rem;font-weight:700;opacity:.65;line-height:1.3}
.ti-attack,.ti-defense{font-size:.73rem;opacity:.72;line-height:1.45}
.ti-attack{color:#7a1c1c}
.ti-defense{color:#0d3b6e}
.tl-deep{margin:1.5rem 0}
.tld-year-marker{display:flex;align-items:center;gap:.75rem;margin-bottom:.75rem;padding-bottom:.5rem;border-bottom:2px solid rgba(0,0,0,.08)}
.tld-year{font-size:1.1rem;font-weight:700;opacity:.7;min-width:70px}
.tld-label{font-size:.78rem;font-weight:700;opacity:.55}
.tld-event{display:flex;gap:.875rem;margin-bottom:.75rem;padding-bottom:.75rem;border-bottom:1px solid rgba(0,0,0,.06)}
.tld-event:last-child{border-bottom:none}
.tld-event.tld-milestone .tld-dot{box-shadow:0 0 0 3px rgba(0,0,0,.08)}
.tld-dot{width:12px;height:12px;border-radius:50%;flex-shrink:0;margin-top:4px}
.dot-purple{background:#5c35cc}
.dot-red   {background:#c62828}
.dot-amber {background:#e65100}
.tld-content{flex:1}
.tld-title{font-size:.9rem;font-weight:700;margin-bottom:.4rem;line-height:1.3}
.tld-body p{font-size:.82rem;opacity:.82;line-height:1.7;margin-bottom:.5rem}
.tld-why-matters{font-size:.78rem;font-style:italic;opacity:.68;border-left:2px solid rgba(0,0,0,.15);padding:.4rem .75rem;margin-top:.5rem;line-height:1.6}
.tld-insight{background:rgba(0,0,0,.04);border-radius:7px;padding:.75rem .875rem;margin:.75rem 0}
.tld-insight-label{font-size:.7rem;font-weight:700;opacity:.55;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.35rem}
.tld-insight p{font-size:.78rem;opacity:.8;line-height:1.6;margin:0}
.tld-data-point{display:inline-flex;align-items:baseline;gap:.4rem;margin:.25rem .5rem .25rem 0;padding:.2rem .6rem;background:rgba(0,0,0,.04);border-radius:6px;border:1px solid rgba(0,0,0,.08)}
.tdp-num{font-size:.9rem;font-weight:700}
.tdp-label{font-size:.7rem;opacity:.6}
.xz-anatomy{border:1px solid rgba(0,0,0,.1);border-radius:10px;overflow:hidden;margin:1rem 0}
.xa-title{font-size:.72rem;font-weight:700;opacity:.55;padding:.4rem .875rem;background:rgba(0,0,0,.04);border-bottom:1px solid rgba(0,0,0,.07)}
.xa-steps{padding:.5rem}
.xa-step{display:flex;gap:.75rem;padding:.55rem .25rem;border-bottom:1px solid rgba(0,0,0,.06)}
.xa-step:last-child{border-bottom:none}
.xa-num{width:22px;height:22px;border-radius:50%;background:rgba(198,40,40,.1);color:#c62828;font-size:.75rem;font-weight:700;display:flex;align-items:center;justify-content:center;flex-shrink:0;margin-top:1px}
.xa-name{font-size:.8rem;font-weight:700;margin-bottom:.2rem}
.xa-desc{font-size:.76rem;opacity:.75;line-height:1.55;margin:0}
.sandbox-escape-detail{border:1px solid rgba(0,0,0,.1);border-radius:10px;overflow:hidden;margin:1rem 0}
.sed-title{font-size:.72rem;font-weight:700;opacity:.55;padding:.4rem .875rem;background:rgba(0,0,0,.04);border-bottom:1px solid rgba(0,0,0,.07)}
.sed-body{padding:.875rem 1rem}
.sed-body p{font-size:.8rem;opacity:.8;line-height:1.65;margin-bottom:.5rem}
.sed-body p:last-child{margin-bottom:0}
.glasswing-impact-grid{display:grid;grid-template-columns:1fr 1fr;gap:.6rem;margin-top:1rem}
.gig-item{background:rgba(0,0,0,.03);border:1px solid rgba(0,0,0,.1);border-radius:8px;padding:.75rem .875rem}
.gig-label{font-size:.7rem;font-weight:700;opacity:.55;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.4rem}
.pattern-analysis{margin:1.25rem 0}
.pa-consistent{border:1px solid rgba(0,0,0,.1);border-radius:10px;overflow:hidden}
.pa-consistent h4{font-size:.82rem;font-weight:700;padding:.6rem .875rem;background:rgba(0,0,0,.04);border-bottom:1px solid rgba(0,0,0,.08);margin:0}
.pa-items{padding:.5rem}
.pa-item{padding:.55rem .35rem;border-bottom:1px solid rgba(0,0,0,.06)}
.pa-item:last-child{border-bottom:none}
.pa-name{font-size:.8rem;font-weight:700;margin-bottom:.2rem}
.pa-desc{font-size:.77rem;opacity:.75;line-height:1.55}
.decisions-grid{display:grid;grid-template-columns:1fr 1fr;gap:.75rem;margin:1.25rem 0}
.decision-card{background:#fff;border:1px solid rgba(0,0,0,.1);border-radius:10px;padding:.9rem 1rem}
.dc-urgent   {border-top:2px solid #c62828}
.dc-structural{border-top:2px solid #e65100}
.dc-long     {border-top:2px solid #888}
.dc-urgency{font-size:.68rem;font-weight:700;opacity:.55;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.4rem}
.dc-urgent .dc-urgency   {color:#c62828}
.dc-structural .dc-urgency{color:#e65100}
.decision-card h4{font-size:.82rem;font-weight:700;margin-bottom:.35rem}
.decision-card p{font-size:.77rem;opacity:.75;line-height:1.6;margin:0}
.callout-box{background:rgba(0,0,0,.04);border:1px solid rgba(0,0,0,.1);border-radius:8px;padding:.875rem 1rem;margin:1rem 0}
.callout-box p{font-size:.8rem;opacity:.8;line-height:1.65;margin:0}
.ep-nav-footer{display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-top:2rem;padding-top:1.25rem;border-top:1px solid rgba(0,0,0,.1)}
.ep-nav-prev,.ep-nav-next{display:flex;flex-direction:column;gap:.2rem}
.ep-nav-next{text-align:right}
.ep-nav-dir{font-size:.72rem;font-weight:700;opacity:.5}
.ep-nav-ep-title{font-size:.8rem;opacity:.75;line-height:1.4}
/* Dark mode */
[data-theme="dark"] .thread-visual,.tld-deep,[data-theme="dark"] .xz-anatomy,
[data-theme="dark"] .sandbox-escape-detail,[data-theme="dark"] .pattern-analysis .pa-consistent,
[data-theme="dark"] .decision-card{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1)}
[data-theme="dark"] .thread-header,[data-theme="dark"] .xa-title,[data-theme="dark"] .sed-title,
[data-theme="dark"] .pa-consistent h4{background:rgba(255,255,255,.04)}
[data-theme="dark"] .ti-attack{color:#ffaaaa}
[data-theme="dark"] .ti-defense{color:#aaccff}
[data-theme="dark"] .tld-insight,[data-theme="dark"] .gig-item{background:rgba(255,255,255,.04)}
[data-theme="dark"] .tld-data-point{background:rgba(255,255,255,.05)}
[data-theme="dark"] .callout-box{background:rgba(255,255,255,.05)}
@media(max-width:600px){
  .thread-item{grid-template-columns:44px 1fr}
  .ti-defense{display:none}
  .glasswing-impact-grid,.decisions-grid{grid-template-columns:1fr}
  .tld-event{flex-direction:column;gap:.4rem}
  .ep-nav-footer{grid-template-columns:1fr}
  .ep-nav-next{text-align:left}
}
</style>
{% endcapture %}
{{ extra_styles }}
