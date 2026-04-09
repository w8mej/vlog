---
layout: post
title: "Part II — Third-party libraries: the vulnerability layer nobody counted"
date: 2026-04-10
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 3
categories: ["Security", "Open Source", "Project Glasswing"]
tags: ["supply chain", "npm", "PyPI", "transitive dependencies", "XZ Utils", "Log4Shell", "event-stream", "Axios", "LiteLLM", "CI/CD security", "SBOM", "dependency graph", "left-pad", "typosquatting", "malicious packages"]
excerpt: "When your Node.js service pulls 847 npm packages to serve a login form, you are not running one application. You are running 847 applications — most written by someone who needed to scratch an itch and moved on."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">

<div class="ep-nav-bar">
  <span class="ep-nav-series">Project Butterfly of Damocles</span>
  <span class="ep-nav-sep">&rarr;</span>
  <span class="ep-nav-ep">Episode 3 of 10</span>
  <span class="ep-nav-sep">&middot;</span>
  <span class="ep-nav-ep-title">Part II &mdash; The dependency graph</span>
</div>

<div class="meta">
  <span>John Menerick</span>
  <span>securesql.info</span>
  <span>CISSP &middot; CKS/CKA &middot; 15+ yrs security architecture</span>
  <span>~30 min read</span>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">The 2014 DEF CON 22 scatter chart showed you the vulnerability density of the software you deploy directly. It did not show you the software underneath that software. It did not count the libraries bundled inside those libraries, the build tools that execute during your CI pipeline, the version tags that point to code that was trustworthy yesterday and is a credential stealer today.</p>
  <p class="ep-lede">The chart measured what you chose. The supply chain is what you inherited. And in 2026, the supply chain has been systematically weaponized by nation-states who understand the attack surface better than most of the organizations it belongs to.</p>
</div>

<div class="hero-stats">
  <div class="hstat"><div class="hstat-num">847</div><div class="hstat-sub">Average transitive npm dependencies in a typical Node.js login form — 2024 Snyk data</div></div>
  <div class="hstat"><div class="hstat-num">17,000+</div><div class="hstat-sub">Malicious packages removed from npm and PyPI combined, 2021&ndash;2026</div></div>
  <div class="hstat"><div class="hstat-num">2 yrs</div><div class="hstat-sub">How long XZ Utils attacker spent building trust before inserting the backdoor</div></div>
  <div class="hstat"><div class="hstat-num">350K+</div><div class="hstat-sub">Projects bundling OpenSSL — each inheriting its full vulnerability history</div></div>
</div>

<hr class="gw-hr">
<span class="section-label">The mental model problem</span>
<h2>You are not running one application. You have never been running one application.</h2>

<p>When a developer runs <code>npm install</code> to set up a project, they typically think of themselves as installing the packages listed in <code>package.json</code>. If that file lists 12 direct dependencies, the mental model is: I am now running 12 libraries plus my code. This mental model is wrong by two to three orders of magnitude.</p>

<p>Those 12 direct dependencies each have their own dependencies. Those have dependencies. The transitive closure of a typical Node.js application in 2024 contains 600 to 1,200 packages. A typical React application: 1,400+. A typical enterprise Node.js service with authentication, database access, and API integrations: north of 2,000. Each of those packages was written by a different person or team, published under a different maintenance model, subject to different security practices, and potentially maintained by nobody at all for the last three years.</p>

<div class="dep-tree-visual">
  <div class="dep-tree-label">Illustrative transitive dependency tree for a login form</div>
  <div class="dep-tree">
    <div class="dt-root">Your login service</div>
    <div class="dt-level dt-l1">
      <div class="dt-node dt-direct">express</div>
      <div class="dt-node dt-direct">passport</div>
      <div class="dt-node dt-direct">jsonwebtoken</div>
      <div class="dt-node dt-direct">bcrypt</div>
      <div class="dt-node dt-direct">axios</div>
      <div class="dt-node dt-direct">dotenv</div>
      <div class="dt-node dt-ellipsis">+6 more direct</div>
    </div>
    <div class="dt-arrow">&darr; each of these has dependencies &darr;</div>
    <div class="dt-level dt-l2">
      <div class="dt-node dt-trans">body-parser</div>
      <div class="dt-node dt-trans">debug</div>
      <div class="dt-node dt-trans">ms</div>
      <div class="dt-node dt-trans">jws</div>
      <div class="dt-node dt-trans">jwa</div>
      <div class="dt-node dt-trans">node-gyp</div>
      <div class="dt-node dt-trans">semver</div>
      <div class="dt-node dt-ellipsis">+820 more transitive</div>
    </div>
    <div class="dt-total">Total: <strong>~847 packages</strong> installed. ~843 of them you did not consciously choose.</div>
  </div>
</div>

<p>The security question for each of those 847 packages is the same: who wrote it, who maintains it today, has it been audited for security issues, and would anyone notice if a malicious version was published? For a minority of packages, the answers are reassuring. For the majority, the honest answer to all four questions is: unknown, possibly nobody, no, and probably not for at least a few hours.</p>

<div class="callout-box cb-amber">
  <div class="callout-label">The left-pad incident &mdash; March 2016</div>
  <p>Azer Ko&ccedil;ulu was the author of <code>left-pad</code>, an 11-line npm package that left-pads a string with a specified character. It had no security vulnerabilities. It was not malicious. And when Ko&ccedil;ulu unpublished it from npm in a dispute over a naming conflict, it immediately broke thousands of applications globally &mdash; including Babel, React, and large swaths of the Node.js ecosystem. The incident was not about security. It was about trust: the entire JavaScript build infrastructure had implicitly trusted that a package maintained by one person who had no particular obligation to keep it published would remain available indefinitely. This was the supply chain fragility problem made visible. The security version of the same vulnerability was already being written.</p>
</div>

<hr class="gw-hr">
<span class="section-label">How the attack surface evolved</span>
<h2>Three distinct eras of supply chain risk: from accidental to adversarial</h2>

<p>The supply chain risk landscape did not arrive fully formed. It evolved through three distinct eras, each building on the structural vulnerabilities exposed by the previous one. Understanding the progression helps explain why the March 2026 attacks were not just larger than their predecessors &mdash; they were qualitatively different.</p>

<div class="era-timeline">

  <div class="era-card era-accidental">
    <div class="era-header">
      <div class="era-period">2010&ndash;2017</div>
      <div class="era-name">Era 1 &mdash; Accidental exposure</div>
      <div class="era-tag">Neglect, not malice</div>
    </div>
    <div class="era-body">
      <p>The primary supply chain risk in this era was unmaintained packages with known vulnerabilities. A developer would install a library in 2012, the library would receive a critical CVE in 2014, and nobody would update it because the application was &ldquo;working fine.&rdquo; The vulnerability existed; no adversary had specifically placed it there. The risk was the gap between vulnerability disclosure and patch deployment, multiplied across the transitive dependency graph.</p>
      <p>The canonical example: a 2016 survey by Snyk found that 14% of npm packages had at least one known vulnerability. The majority of those vulnerabilities were months or years old. The fix existed. The update had not happened. The window of exposure was entirely a function of organizational inertia, not attacker sophistication.</p>
      <div class="era-incidents">
        <div class="era-incident-label">Representative incidents</div>
        <div class="era-incident">left-pad unpublish (2016) &mdash; availability, not security, but exposed the fragility</div>
        <div class="era-incident">Thousands of apps running Struts 2 with known RCE vulnerabilities (ongoing) &mdash; Equifax breach (2017) rooted here</div>
      </div>
    </div>
  </div>

  <div class="era-card era-opportunistic">
    <div class="era-header">
      <div class="era-period">2018&ndash;2022</div>
      <div class="era-name">Era 2 &mdash; Opportunistic insertion</div>
      <div class="era-tag">Motivated attackers, broad targeting</div>
    </div>
    <div class="era-body">
      <p>The adversarial era begins. Attackers discovered that npm, PyPI, and other registries would accept and distribute packages from anyone, with minimal verification, to millions of developers worldwide. The attack model: publish a malicious package with a name similar to a popular legitimate package (typosquatting), or compromise a legitimate package&rsquo;s maintainer account, and let the distribution network do the rest.</p>
      <p>The event-stream incident in 2018 was the paradigm shift. A developer named Dominic Tarr maintained event-stream, a popular npm package. Someone volunteered to maintain it on his behalf, Tarr handed over maintainership, and the new maintainer published a version containing a cryptocurrency wallet harvester targeting a specific Bitcoin wallet application. The attack was targeted but distributed via a trusted package. The trust in the maintainer was the attack surface.</p>
      <div class="era-incidents">
        <div class="era-incident-label">Representative incidents</div>
        <div class="era-incident">event-stream (2018) &mdash; compromised maintainer, cryptominer in a trusted package, 2M weekly downloads</div>
        <div class="era-incident">ua-parser-js (2021) &mdash; hijacked npm account, RAT/cryptominer deployed, 8M weekly downloads</div>
        <div class="era-incident">colors/faker (2022) &mdash; intentional sabotage by the original author, infinite loop in protest of unpaid OSS labor</div>
        <div class="era-incident">PyPI malicious package wave (2019&ndash;2022) &mdash; 7,500+ packages removed, primarily credential harvesters</div>
      </div>
    </div>
  </div>

  <div class="era-card era-strategic">
    <div class="era-header">
      <div class="era-period">2023&ndash;present</div>
      <div class="era-name">Era 3 &mdash; Strategic, persistent, targeted</div>
      <div class="era-tag">Nation-state patience, infrastructure-level impact</div>
    </div>
    <div class="era-body">
      <p>The qualitative shift that defines the current era: nation-state actors applying the same patient, long-duration operational model they use for other intelligence collection to open source supply chain compromise. The XZ Utils attack (two years of trust-building before payload insertion) established the template. The March 2026 TeamPCP campaign demonstrated the cascade potential: compromise one trusted tool, harvest credentials, use those credentials to compromise the next tool, repeat. Automated, self-financing, and targeting the exact infrastructure organizations use to defend themselves.</p>
      <p>The defining characteristic of Era 3 attacks is that they are not opportunistic. The targets are selected. The methods are tailored. The XZ attacker specifically targeted burned-out maintainers. UNC1069 specifically targeted the Axios maintainer because 100M weekly downloads made the ROI exceptional. TeamPCP specifically targeted Trivy because it had elevated CI/CD pipeline access by design. These are not script kiddies. They are intelligence operations applied to open source infrastructure.</p>
      <div class="era-incidents">
        <div class="era-incident-label">Representative incidents</div>
        <div class="era-incident">XZ Utils (2024) &mdash; 2-year operation, backdoor in sshd transitive dependency, caught by accident</div>
        <div class="era-incident">TeamPCP / Trivy cascade (Mar 2026) &mdash; credential harvesting at CI/CD pipeline layer, 1,000+ orgs, European Commission 92 GB</div>
        <div class="era-incident">UNC1069 / Axios (Mar 2026) &mdash; 2-week individualized social engineering, 174K downstream packages, cross-platform RAT</div>
      </div>
    </div>
  </div>

</div>

<hr class="gw-hr">
<span class="section-label">npm: the registry that runs the web</span>
<h2>4,300+ malicious packages and counting: the economics of npm supply chain attacks</h2>

<p>npm is the world&rsquo;s largest software registry by package count, with over two million packages and approximately 30 billion downloads per week. It is also the supply chain attack surface that has attracted the most documented adversarial activity, for a straightforward reason: the blast radius of a successful npm compromise scales with download count, and npm download counts are extraordinary. Axios at 100M weekly downloads. Express at 30M. The moment a malicious version of either package is tagged <code>latest</code>, every <code>npm install</code> in every CI/CD pipeline that uses a floating version range pulls it automatically.</p>

<div class="attack-mechanics">
  <div class="attack-title">How an npm supply chain attack works: the Axios anatomy</div>
  <div class="attack-steps">
    <div class="attack-step">
      <div class="step-num">1</div>
      <div class="step-content">
        <div class="step-name">Target selection</div>
        <div class="step-desc">Identify a high-download-count package maintained by a small team. Calculate ROI: downloads &times; credential value per compromised system &divide; effort to compromise maintainer. Axios: 100M weekly downloads &times; (developer machine with AWS keys, GitHub tokens, npm tokens, database credentials) &divide; one maintainer with a public LinkedIn. Exceptional ROI.</div>
      </div>
    </div>
    <div class="attack-step">
      <div class="step-num">2</div>
      <div class="step-content">
        <div class="step-name">Maintainer targeting</div>
        <div class="step-desc">Social engineering campaign: impersonate a known company founder, invite to a crafted Slack workspace, schedule a Microsoft Teams call, fake an audio error, prompt the maintainer to install a &ldquo;fix.&rdquo; Two weeks of effort for an attacker with nation-state resources. The fix installs a RAT. The npm credentials are now in the attacker&rsquo;s hands.</div>
      </div>
    </div>
    <div class="attack-step">
      <div class="step-num">3</div>
      <div class="step-content">
        <div class="step-name">Registry pre-staging</div>
        <div class="step-desc">Approximately 18 hours before the main attack, publish <code>plain-crypto-js@4.2.0</code> to npm &mdash; a clean, innocent-looking package that establishes registry history. This is the &ldquo;cooling off&rdquo; phase: a package with no history triggers more scrutiny than one that appeared a few hours ago.</div>
      </div>
    </div>
    <div class="attack-step">
      <div class="step-num">4</div>
      <div class="step-content">
        <div class="step-name">Payload publication</div>
        <div class="step-desc">Using the stolen npm credentials, publish <code>axios@1.14.1</code> and <code>axios@0.30.4</code>, both pointing to <code>plain-crypto-js@4.2.1</code> as a dependency. Tag both <code>latest</code> and <code>legacy</code> &mdash; covering both the current and backwards-compatible semver ranges. Any <code>npm install</code> with a <code>^1.14.0</code> or <code>~0.30.0</code> range now pulls the malicious version automatically.</div>
      </div>
    </div>
    <div class="attack-step">
      <div class="step-num">5</div>
      <div class="step-content">
        <div class="step-name">Postinstall execution</div>
        <div class="step-desc"><code>plain-crypto-js</code>&rsquo;s <code>package.json</code> declares a <code>postinstall</code> script. When npm installs the package, it automatically runs <code>setup.js</code> &mdash; no user interaction required. <code>setup.js</code> identifies the operating system and downloads a platform-specific second-stage payload: a Nim-based backdoor for macOS, a Go binary for Windows, a C++ implant for Linux. Three platforms, one delivery mechanism, zero user consent.</div>
      </div>
    </div>
    <div class="attack-step">
      <div class="step-num">6</div>
      <div class="step-content">
        <div class="step-name">Credential exfiltration</div>
        <div class="step-desc">The deployed RAT runs SilentSiphon, which harvests credentials from browsers, password managers, and secrets associated with GitHub, GitLab, npm, pip, RubyGems, NuGet, and cloud providers. The CosmicDoor backdoor establishes C2. The attacker now has persistent access to every developer machine that ran <code>npm install</code> during the three-hour window.</div>
      </div>
    </div>
    <div class="attack-step">
      <div class="step-num">7</div>
      <div class="step-content">
        <div class="step-name">Detection and containment</div>
        <div class="step-desc">An axios collaborator with less permission than the compromised account notices the malicious dependency, opens a deprecation PR, and escalates to npm directly at 01:38 UTC. npm removes the malicious versions at 03:15 UTC. The window was 2 hours and 54 minutes. In that window, the package was tagged <code>latest</code> and available to the global npm CDN. Every <code>npm ci</code> and <code>npm install</code> that ran during those three hours pulled it.</div>
      </div>
    </div>
  </div>
</div>

<p>The detection signal that most organizations missed: the malicious Axios versions had no SLSA build provenance. Legitimate Axios releases have always been published via GitHub Actions with OIDC provenance metadata and SLSA level 2 attestations linking the npm package back to a specific GitHub Actions run. The malicious versions were published directly, via stolen credentials, with no attestation. For any organization monitoring SLSA provenance on their critical dependencies, the absence of the attestation on a new major-package release was an automatic alert. Most organizations were not monitoring this.</p>

<div class="infobox teal">
  <p>SLSA provenance absence is currently one of the strongest detection signals for supply chain attacks on high-profile packages. Major packages that have historically published with SLSA attestations will produce no attestation when published via a compromised account using a stolen token. This check is implementable today using <code>npm audit signatures</code> (npm 9+) and does not require waiting for the package to be flagged malicious. The Axios incident was detectable within seconds of publication for any organization with this check in their CI pipeline.</p>
</div>

<div class="callout-box">
  <div class="callout-label">The floating version problem &mdash; why ^ and ~ are attack surface</div>
  <p>npm&rsquo;s semver range syntax was designed for convenience. <code>^1.14.0</code> means &ldquo;any compatible 1.x version.&rdquo; <code>~1.14.0</code> means &ldquo;any patch version of 1.14.&rdquo; Both are extremely common in <code>package.json</code> files. Both mean that running <code>npm install</code> after a new malicious version is published will silently upgrade to the malicious version. The lockfile (<code>package-lock.json</code>) pins exact versions, but only if the lockfile exists and <code>npm ci</code> is used instead of <code>npm install</code>. Many CI/CD pipelines still use <code>npm install</code>. Many do not commit lockfiles. The floating version pattern, combined with auto-update bots like Dependabot, means that malicious versions can be pulled automatically without any human ever making a deliberate decision to upgrade.</p>
</div>

<hr class="gw-hr">
<span class="section-label">PyPI: the ML ecosystem&rsquo;s attack surface</span>
<h2>7,500+ malicious packages: when the data science toolchain becomes the delivery mechanism</h2>

<p>PyPI occupies a different position in the supply chain attack landscape than npm. It is the primary distribution mechanism for Python packages, and Python is the dominant language for machine learning, data science, and increasingly AI infrastructure. This means a successful PyPI supply chain attack can target not just developer machines, but production AI workloads, model training pipelines, and the infrastructure that manages API keys for every LLM provider an organization uses.</p>

<p>The LiteLLM compromise in March 2026 was the clearest demonstration of this dynamic. LiteLLM is an AI gateway library that routes requests to over 100 LLM providers &mdash; OpenAI, Anthropic, Azure OpenAI, Google Vertex AI, AWS Bedrock, and more. It stores all the corresponding API keys. It runs in 36% of monitored cloud environments according to Wiz Research. When TeamPCP published malicious versions 1.82.7 and 1.82.8 to PyPI, they did not just compromise developer machines. They targeted the keys to every AI provider an organization uses, simultaneously.</p>

<div class="pypi-comparison">
  <div class="pypi-compare-title">npm vs. PyPI attack dynamics</div>
  <table class="compare-table">
    <thead>
      <tr>
        <th>Dimension</th>
        <th>npm</th>
        <th>PyPI</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Primary target</td>
        <td>Developer machines, CI/CD pipelines, Node.js services</td>
        <td>Data science environments, ML training pipelines, AI gateways</td>
      </tr>
      <tr>
        <td>Most valuable credential</td>
        <td>GitHub tokens, npm publish tokens, cloud credentials from CI runners</td>
        <td>LLM API keys, model registry tokens, GPU cluster credentials</td>
      </tr>
      <tr>
        <td>Novel 2026 vector</td>
        <td>Postinstall hook executes automatically, no user interaction</td>
        <td><code>.pth</code> file executes on every Python interpreter startup, before any import</td>
      </tr>
      <tr>
        <td>Persistence mechanism</td>
        <td>RAT binary, scheduled tasks</td>
        <td><code>.pth</code> file in site-packages survives package removal; Kubernetes kube-system pods</td>
      </tr>
      <tr>
        <td>Detection signal</td>
        <td>Absent SLSA provenance on major package release</td>
        <td>Missing build attestation; litellm_init.pth in site-packages</td>
      </tr>
      <tr>
        <td>Blast radius amplifier</td>
        <td>174,000 downstream npm packages transitively depend on Axios</td>
        <td>LiteLLM present in 36% of cloud environments; often a transitive dep</td>
      </tr>
    </tbody>
  </table>
</div>

<p>The <code>.pth</code> persistence mechanism in the LiteLLM attack deserves special attention because it is architecturally novel. Python&rsquo;s site-packages directory supports <code>.pth</code> files &mdash; path configuration files that are processed at Python interpreter startup, before any user code runs. A <code>.pth</code> file that contains an <code>import</code> statement will execute that import on every Python invocation: <code>python script.py</code>, <code>pip install</code>, <code>pytest</code>, <code>jupyter notebook</code>. Every Python command becomes a trigger for the malware. And removing the malicious LiteLLM packages does not remove the <code>.pth</code> file unless you know to look for it.</p>

<div class="callout-box cb-red">
  <div class="callout-label">If you ran LiteLLM 1.82.7 or 1.82.8 &mdash; remediation checklist</div>
  <p>Removing the package is necessary but not sufficient. Check for <code>litellm_init.pth</code> in your Python site-packages directory. Rotate all LLM API keys stored in or accessible to the affected environment. Audit Kubernetes clusters for unauthorized pods in kube-system. The malicious package deployed privileged pods to every cluster node accessible from the affected environment; these pods have full host filesystem access and persist after package removal. Treat any system that ran a Python interpreter after the package installation as fully compromised.</p>
</div>

<h3>The typosquatting problem: 7,500 packages with names designed to deceive</h3>

<p>Not all PyPI malicious packages are compromised legitimate ones. A substantial fraction are purpose-built fakes: packages named to be confused with legitimate ones, published by attackers, waiting to be installed by developers who make a one-letter typo or copy-paste a package name incorrectly.</p>

<div class="typosquat-examples">
  <div class="typosquat-title">Documented typosquatting patterns against ML/AI packages</div>
  <div class="ts-grid">
    <div class="ts-item">
      <div class="ts-legit">torch</div>
      <div class="ts-arrow">&rarr;</div>
      <div class="ts-fake">torchvision (malicious), torchaudio (malicious), pytoch, torh</div>
      <div class="ts-impact">Credential harvesters targeting ML engineers; some contained trojaned model loading code</div>
    </div>
    <div class="ts-item">
      <div class="ts-legit">tensorflow</div>
      <div class="ts-arrow">&rarr;</div>
      <div class="ts-fake">tensforflow, tensorfow, tensorflow-gpu (various fakes)</div>
      <div class="ts-impact">Particularly dangerous: ML engineers often install GPU variants outside standard package managers</div>
    </div>
    <div class="ts-item">
      <div class="ts-legit">transformers (HuggingFace)</div>
      <div class="ts-arrow">&rarr;</div>
      <div class="ts-fake">transformer, tranformers, huggingface-transformers</div>
      <div class="ts-impact">Target: model downloading code; some fakes phoned home with model access patterns and API keys</div>
    </div>
    <div class="ts-item">
      <div class="ts-legit">requests</div>
      <div class="ts-arrow">&rarr;</div>
      <div class="ts-fake">request, reqests, python-requests</div>
      <div class="ts-impact">Universal Python HTTP library; presence in virtually every Python project makes it a high-value fake target</div>
    </div>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">C/C++ bundling: the invisible vulnerability inheritance</span>
<h2>When your application bundles a library&rsquo;s vulnerability history along with its code</h2>

<p>The npm and PyPI supply chain problems involve explicit package management: there is a record of what you installed, a registry that distributed it, and in principle a process for identifying and removing malicious versions. The C/C++ supply chain problem is more insidious because much of it is invisible to standard software composition analysis tools.</p>

<p>Many C and C++ projects bundle their dependencies directly into the source tree rather than declaring them as external dependencies managed by a package manager. This was a common practice before package managers became standard in C/C++ development, and it persists today for reasons of build reproducibility and convenience. The practical consequence: if you have a copy of zlib embedded in your project&rsquo;s source tree from 2018, and zlib received a critical CVE in 2020, your application is vulnerable &mdash; but no SCA tool will find it, because the vulnerable code is not a declared dependency. It is just code.</p>

<div class="bundling-grid">
  <div class="bundle-card">
    <h4>OpenSSL bundling: 350,000+ projects</h4>
    <p>OpenSSL is the world&rsquo;s most bundled C library. Applications that need TLS support have historically either linked against the system OpenSSL or embedded a private copy in their source tree. The private copy pattern means that every CVE in OpenSSL history potentially has a long tail of applications that remain vulnerable long after the OpenSSL project itself has patched the issue.</p>
    <p>Mythos&rsquo;s finding of a 27-year-old bug in OpenBSD is relevant here: OpenBSD is one of the more security-conscious projects in the ecosystem, yet even it carried a vulnerability for 27 years. Projects with less security focus and worse patching practices carry older bugs for longer.</p>
    <div class="bundle-stat"><span class="bs-num">350K+</span><span class="bs-label">Projects bundling or linking OpenSSL</span></div>
    <div class="bundle-stat"><span class="bs-num">~8 yrs</span><span class="bs-label">Average lag between OpenSSL CVE patch and downstream application patch</span></div>
  </div>
  <div class="bundle-card">
    <h4>FFmpeg: 16 years of undetected history</h4>
    <p>FFmpeg is the multimedia processing library that is used by every major browser, every video streaming service, every video editing tool, and hundreds of thousands of applications for encoding, decoding, and processing audio and video. Project Glasswing&rsquo;s Claude Mythos Preview found a 16-year-old vulnerability in FFmpeg in its first weeks of operation.</p>
    <p>This is not surprising in the context of the 2014 analysis. FFmpeg is a large C codebase that processes untrusted media files &mdash; an attack surface class that was identified as high-risk in 2014. The specific 16-year-old bug had been present since the era before systematic automated security analysis of the codebase. It survived 16 years of code review, security audits, and CVE disclosures about other parts of the codebase. Not because it was subtle. Because nobody looked in exactly the right place.</p>
    <div class="bundle-stat"><span class="bs-num">16 yrs</span><span class="bs-label">How long the Mythos-found FFmpeg bug existed before discovery</span></div>
    <div class="bundle-stat"><span class="bs-num">100s of millions</span><span class="bs-label">Devices that process video using FFmpeg or FFmpeg-derived code</span></div>
  </div>
  <div class="bundle-card">
    <h4>Log4j: the nuclear option in bundled Java</h4>
    <p>Log4Shell (CVE-2021-44228) is the case study in how a bundled library vulnerability becomes a civilization-scale security incident. log4j-core was bundled in thousands of Java applications &mdash; often in <code>.jar</code> files inside <code>.war</code> files inside <code>.ear</code> files, nested three layers deep in application archives. Standard vulnerability scanning tools in 2021 could not look inside nested archives. The vulnerability existed for almost a decade before discovery. When it was disclosed, the patch deployment took years because most organizations couldn&rsquo;t reliably enumerate all the places where they had log4j running.</p>
    <div class="bundle-stat"><span class="bs-num">~10 yrs</span><span class="bs-label">How long Log4Shell existed before discovery</span></div>
    <div class="bundle-stat"><span class="bs-num">$2.4B+</span><span class="bs-label">Estimated global remediation cost (conservative)</span></div>
  </div>
  <div class="bundle-card">
    <h4>XZ Utils: the sleeper</h4>
    <p>XZ Utils provides lossless data compression. It is a transitive dependency of systemd on most Linux distributions, and systemd manages the SSH daemon on those distributions. In 2024, a patient attacker spent two years becoming a trusted XZ Utils contributor before inserting a carefully crafted backdoor that targeted the RSA key decryption path in affected sshd configurations. The backdoor was not in the source code in an obvious way &mdash; it was injected via a test file that the build system executed during compilation. It bypassed source code review. It was found by a Microsoft engineer noticing that SSH logins were slightly slower than expected on an unrelated benchmark.</p>
    <div class="bundle-stat"><span class="bs-num">2 yrs</span><span class="bs-label">Attacker preparation time before payload insertion</span></div>
    <div class="bundle-stat"><span class="bs-num">0</span><span class="bs-label">Security tools that would have caught this without the CPU benchmark anomaly</span></div>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">CI/CD: the attack surface hiding in your pipeline</span>
<h2>When the tools you trust to build and secure your software become the entry point</h2>

<p>The March 2026 TeamPCP campaign introduced a new chapter in supply chain attack history: the systematic weaponization of the DevSecOps toolchain itself. Not the applications. Not the libraries. The vulnerability scanners, the static analysis tools, the CI/CD actions that run inside your build pipeline with ambient access to all of your secrets.</p>

<p>Understanding why this attack class is so potent requires understanding what a CI/CD runner knows. When a GitHub Actions workflow runs, it has access to every secret configured for that repository or organization: cloud provider credentials, database passwords, code signing keys, npm and PyPI publish tokens, Docker registry credentials. The runner executes with these secrets loaded as environment variables. Any code that executes inside the runner can read them.</p>

<p>Trivy is a vulnerability scanner. It runs in CI/CD pipelines to scan container images and code for known vulnerabilities. It is trusted. It runs on every PR, every merge, every deployment. And when TeamPCP compromised Trivy&rsquo;s GitHub Actions workflow, every pipeline that ran Trivy &mdash; the tool literally designed to make you more secure &mdash; began exfiltrating every secret the runner had access to.</p>

<div class="cicd-risk-model">
  <div class="cicd-title">Why CI/CD pipeline secret exposure is structurally worse than application-layer exposure</div>
  <div class="cicd-comparison">
    <div class="cicd-col">
      <div class="cicd-col-header">Application-layer compromise</div>
      <ul class="cicd-list">
        <li>Attacker gets the credentials configured for <em>that application</em></li>
        <li>Blast radius: the services that application is authorized to access</li>
        <li>Rotation scope: credentials for that application</li>
        <li>Detection: anomalous API calls, runtime monitoring</li>
      </ul>
    </div>
    <div class="cicd-col">
      <div class="cicd-col-header cicd-danger">CI/CD runner compromise</div>
      <ul class="cicd-list cicd-list-danger">
        <li>Attacker gets <em>every secret configured for the entire pipeline</em>: cloud provider credentials, code signing keys, registry tokens, deploy keys, service account tokens</li>
        <li>Blast radius: every service the pipeline touches, which is typically everything</li>
        <li>Rotation scope: all secrets across all environments that use that pipeline</li>
        <li>Detection: extremely difficult &mdash; the malicious code runs inside a trusted tool with no anomalous behavior visible at the application layer</li>
      </ul>
    </div>
  </div>
</div>

<div class="callout-box cb-red">
  <div class="callout-label">The mutable git tag vulnerability &mdash; the structural flaw TeamPCP exploited</div>
  <p>Git tags are designed to be immutable markers for specific commits. By convention, <code>v0.69.4</code> should always point to the same commit. In practice, git tags are not immutable &mdash; anyone with write access to a repository can force-push a tag to point to a completely different commit. GitHub does not prevent this, does not alert users whose workflows reference the tag, and does not visibly distinguish a force-pushed tag from the original. TeamPCP used this exactly: they force-pushed 76 of 77 trivy-action version tags to point to malicious commits. Every CI/CD pipeline that referenced trivy-action by version tag (the standard pattern in GitHub Actions documentation) began running the attacker&rsquo;s code on its next execution. The mitigation: pin GitHub Actions to full commit SHAs, not version tags. <code>uses: aquasecurity/trivy-action@f781cce5aab226378d3e6f493a1a2d3ca7b15b2</code> instead of <code>uses: aquasecurity/trivy-action@v0.69.3</code>. SHA references cannot be force-pushed.</p>
</div>

<div class="sc-grid" style="margin-top:1.5rem">
  <div class="sc-card">
    <div class="sc-card-head"><span class="sc-label">npm ecosystem</span><span class="sc-count sc-red">~4,300+</span></div>
    <div class="sc-sub">Known malicious packages 2021&ndash;2026</div>
    <ul class="sc-list">
      <li>event-stream (2018) &mdash; compromised maintainer, cryptominer <span class="badge-critical">critical</span></li>
      <li>ua-parser-js &mdash; account hijack, RAT/cryptominer, 8M wkly DLs <span class="badge-critical">critical</span></li>
      <li>colors/faker (2022) &mdash; intentional sabotage by author <span class="badge-high">high</span></li>
      <li>Axios (Mar 2026) &mdash; DPRK RAT, 100M wkly DLs, 174K downstream pkgs <span class="badge-critical">critical</span></li>
      <li>Typical app: 847 transitive deps, most unmaintained <span class="badge-high">high surface</span></li>
    </ul>
  </div>
  <div class="sc-card">
    <div class="sc-card-head"><span class="sc-label">PyPI / Python</span><span class="sc-count sc-amber">~7,500+</span></div>
    <div class="sc-sub">Malicious / typosquatting packages 2019&ndash;2026</div>
    <ul class="sc-list">
      <li>torch typosquats &mdash; ML supply chain credential harvesters <span class="badge-critical">critical</span></li>
      <li>ShadowRay (2024) &mdash; Ray framework unauth RCE <span class="badge-critical">critical</span></li>
      <li>LiteLLM 1.82.7/1.82.8 (Mar 2026) &mdash; TeamPCP .pth persistence <span class="badge-critical">critical</span></li>
      <li>Telnyx SDK &mdash; WAV steganography second-stage payload <span class="badge-critical">critical</span></li>
      <li>Typical ML app: 200&ndash;600 transitive deps <span class="badge-high">high surface</span></li>
    </ul>
  </div>
  <div class="sc-card">
    <div class="sc-card-head"><span class="sc-label">C/C++ / systems</span><span class="sc-count sc-red">structural</span></div>
    <div class="sc-sub">Bundled library transitive exposure</div>
    <ul class="sc-list">
      <li>XZ Utils (2024) &mdash; 2-year social engineering operation, sshd backdoor <span class="badge-critical">critical</span></li>
      <li>Log4Shell &mdash; bundled log4j, JVM-scale, 10 years undetected <span class="badge-critical">critical</span></li>
      <li>FFmpeg &mdash; 16-year-old bug found by Mythos in weeks <span class="badge-critical">critical</span></li>
      <li>OpenSSL bundled in 350K+ projects, patching lag ~8 years <span class="badge-high">high</span></li>
      <li>zlib / libpng stale copies endemic across C/C++ ecosystem <span class="badge-high">high</span></li>
    </ul>
  </div>
  <div class="sc-card">
    <div class="sc-card-head"><span class="sc-label">CI/CD / DevSecOps tooling</span><span class="sc-count sc-red">weaponized</span></div>
    <div class="sc-sub">Security tools turned attack vectors &mdash; March 2026</div>
    <ul class="sc-list">
      <li>Trivy v0.69.4 &mdash; credential stealer in scanner, 76/77 tags poisoned <span class="badge-critical">critical</span></li>
      <li>Checkmarx KICS &mdash; 35 version tags force-pushed, sysmon persistence <span class="badge-critical">critical</span></li>
      <li>Mutable git tags &mdash; exploitable by design in all GitHub Actions <span class="badge-critical">critical</span></li>
      <li>82% of Docker Hub images have known high/critical vulns (Snyk 2024) <span class="badge-high">high</span></li>
      <li>GitHub Actions ambient secret exposure endemic across pipelines <span class="badge-high">high</span></li>
    </ul>
  </div>
</div>

<div class="infobox red">
  <p>The XZ Utils backdoor (CVE-2024-3094) is the canonical proof of concept for the maintainer-as-attack-surface model I described in 2014. A burned-out volunteer was socially engineered over two years by an attacker who contributed code, built trust, then inserted a backdoor into a transitive dependency of sshd. Nobody caught it through code review. A Microsoft engineer caught it through anomalous CPU benchmarking. It served as the direct operational template for both March 2026 campaigns. The playbook was published. Nation-states read it. And the same structural vulnerability &mdash; critical infrastructure, volunteer maintainer, no dedicated security support &mdash; is reproduced across every project category in this episode.</p>
</div>

<hr class="gw-hr">
<span class="section-label">What defense looks like</span>
<h2>From reactive to proactive: what the supply chain security posture actually requires</h2>

<p>The supply chain risk categories above are not equally tractable. Some have mature, deployable mitigations today. Others require structural changes to the ecosystem that are years away from broad adoption. It is important to be honest about the difference, because security theater &mdash; actions that feel like security improvements without actually reducing risk &mdash; is particularly rampant in supply chain security.</p>

<div class="defense-tiers">
  <div class="defense-tier dt-now">
    <div class="dt-label">Deployable today &mdash; high impact</div>
    <ul class="bullets">
      <li>Pin GitHub Actions to full commit SHAs, not version tags. Non-negotiable after Trivy. <code>uses: action@sha256:abc123</code> not <code>uses: action@v3</code></li>
      <li>Use <code>npm ci</code> instead of <code>npm install</code> in all CI/CD pipelines. Respects the lockfile exactly, does not auto-upgrade.</li>
      <li>Commit <code>package-lock.json</code> and equivalent lockfiles to version control. Without this, <code>npm ci</code> cannot pin versions.</li>
      <li>Disable npm lifecycle scripts globally for CI environments: <code>npm config set ignore-scripts true</code>. Prevents postinstall hook execution class of attacks.</li>
      <li>Monitor SLSA provenance on high-impact packages. Absence of SLSA attestation on a new release of a package that historically had it is an immediate alert.</li>
      <li>Implement a &ldquo;package release cooldown&rdquo; policy: do not auto-update packages published less than 72 hours ago. This window gives the security community time to analyze new releases.</li>
      <li>Audit Python site-packages for unexpected <code>.pth</code> files after any dependency changes.</li>
    </ul>
  </div>
  <div class="defense-tier dt-medium">
    <div class="dt-label">Medium-term &mdash; requires tooling investment</div>
    <ul class="bullets">
      <li>SBOM generation and continuous monitoring: know what&rsquo;s in your software at all times, not just at build time.</li>
      <li>Software Composition Analysis (SCA) integrated into the CI pipeline, not just as a periodic scan.</li>
      <li>Private package mirror with allow-listing: only packages on the approved list can be installed. Typosquatting attacks require the attacker to be on your allow list.</li>
      <li>Secrets management that limits what secrets any given CI runner can access. Principle of least privilege for pipelines: a vulnerability scanner does not need your production database credentials.</li>
      <li>Container image scanning with known-vulnerability blocking, not just alerting. An image with a CVSS 9.x critical will not reach production.</li>
    </ul>
  </div>
  <div class="defense-tier dt-long">
    <div class="dt-label">Long-term &mdash; ecosystem-level change required</div>
    <ul class="bullets">
      <li>Registry-level SLSA provenance requirements: npm and PyPI requiring all packages to have verified build provenance before publication.</li>
      <li>Maintainer identity verification: meaningful authentication of package maintainer identity, not just email address ownership.</li>
      <li>Sustained funding for critical OSS maintainers: the XZ Utils attack targeted a burned-out volunteer because burned-out volunteers are more susceptible. Funding maintainers is a supply chain security control.</li>
      <li>Broad adoption of memory-safe languages in new systems software: Rust, Go, Swift for new C/C++ replacement code. Reduces the bundling vulnerability class over a 10-20 year horizon.</li>
      <li>Immutable package registry history: packages that have been published cannot be unpublished. Addresses the availability issue (left-pad) while also preventing retroactive tampering.</li>
    </ul>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">The bridge to Glasswing</span>
<h2>Why the supply chain is exactly where Glasswing&rsquo;s findings will land</h2>

<p>The structural picture that emerges from this episode is clarifying about why Project Glasswing is both necessary and potentially problematic. Mythos Preview has already found thousands of zero-day vulnerabilities &mdash; in operating systems, in browsers, in the kind of foundational software analyzed at DEF CON 22. Those vulnerabilities exist in the same ecosystem that the March 2026 supply chain attacks just demonstrated is simultaneously: (a) operated by people who are high-value social engineering targets, (b) served through pipelines that have elevated credential access, and (c) depended upon by hundreds of thousands of downstream applications that will inherit the vulnerability until patched.</p>

<p>When Glasswing finds a 16-year-old FFmpeg bug, the disclosure goes to FFmpeg maintainers. Those maintainers build the patch. The patch is released. Downstream projects &mdash; those 350K+ that bundle or link FFmpeg &mdash; need to update. Most of them won&rsquo;t know they need to update unless they have SCA tooling running. Most of them won&rsquo;t update immediately even if they know, because change is hard and breaking changes are worse than theoretical vulnerabilities. And in the meantime, the disclosure has been published &mdash; accessible to adversaries who can weaponize it faster than the patching process moves.</p>

<p>The supply chain is not a separate problem from the vulnerability problem. It is the mechanism by which the vulnerability problem propagates. Every bug Glasswing finds is a bug that will need to be patched through a supply chain that has been demonstrated to be systematically compromisable by patient, resourced adversaries. The discovery velocity has changed. The remediation velocity has not. And the supply chain infrastructure between them has been confirmed as an active attack surface.</p>

<div class="final-callout">
  <div class="final-top">
    <p>The 2014 observation: &ldquo;you are not running one application; you are running 847 applications, most of which nobody has audited.&rdquo; The 2026 update: &ldquo;you are not deploying one vulnerability fix; you are deploying it through 847 pipelines, most of which run scanners that were recently demonstrated to be credential stealers.&rdquo;</p>
  </div>
  <div class="final-bottom">
    <p>The supply chain was always the liability side of the open source balance sheet. What changed in 2026 is that nation-state actors are now systematically exploiting it, the tools designed to help you find vulnerabilities in your supply chain are now targets themselves, and the most powerful vulnerability-finding capability ever built is about to produce thousands of new findings that need to be patched through that exact infrastructure. The math does not improve until the denominator changes &mdash; and the denominator is the human beings maintaining open source software on volunteer time with no dedicated security support.</p>
  </div>
</div>

<div class="ep-nav-footer">
  <div class="ep-nav-prev">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 2 &mdash; Part I: The original quantitative case</span>
  </div>
  <div class="ep-nav-next">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 4 &mdash; The XZ playbook: two years to own a dependency of sshd</span>
  </div>
</div>

<div class="tag-row">
  <span class="tag">supply chain security</span>
  <span class="tag">npm</span>
  <span class="tag">PyPI</span>
  <span class="tag">transitive dependencies</span>
  <span class="tag">XZ Utils</span>
  <span class="tag">CVE-2024-3094</span>
  <span class="tag">Log4Shell</span>
  <span class="tag">event-stream</span>
  <span class="tag">Axios</span>
  <span class="tag">LiteLLM</span>
  <span class="tag">Trivy</span>
  <span class="tag">CI/CD security</span>
  <span class="tag">SLSA provenance</span>
  <span class="tag">SBOM</span>
  <span class="tag">mutable git tags</span>
  <span class="tag">typosquatting</span>
  <span class="tag">FFmpeg</span>
  <span class="tag">postinstall hooks</span>
  <span class="tag">Project Glasswing</span>
  <span class="tag">Project Butterfly of Damocles</span>
</div>

<div class="gw-byline">John Menerick is a senior information security architect and consultant (CISSP, NSA, CKS/CKA). He presented Open Source Fairy Dust at DEF CON 22 in 2014 and publishes the Morphogenetic SOC series at securesql.info. The views expressed are his own and do not represent the views of Anthropic, Project Glasswing, or any Glasswing launch partner.</div>

</div><!-- /glasswing-wrapper -->

{% capture extra_styles %}
<style>
/* ── Episode 3 additional styles ── */
.ep-nav-bar { display:flex; flex-wrap:wrap; align-items:center; gap:.5rem; font-size:.75rem; opacity:.55; margin-bottom:1.5rem; padding:.6rem .875rem; background:rgba(0,0,0,.04); border-radius:8px; }
.ep-nav-sep { opacity:.4; }
.ep-nav-series { font-weight:700; }
.ep-lede { font-style:italic; font-size:1rem; line-height:1.75; margin-bottom:.75rem; }
.ep-lede-block { margin-bottom:1.5rem; }
.dep-tree-visual { background:rgba(0,0,0,.03); border:1px solid rgba(0,0,0,.1); border-radius:10px; padding:1rem; margin:1.25rem 0; }
.dep-tree-label { font-size:.72rem; font-weight:700; opacity:.55; margin-bottom:.75rem; text-transform:uppercase; letter-spacing:.05em; }
.dep-tree { display:flex; flex-direction:column; align-items:center; gap:.5rem; text-align:center; }
.dt-root { font-size:.95rem; font-weight:700; padding:.4rem .875rem; background:rgba(80,80,200,.1); border:1px solid rgba(80,80,200,.25); border-radius:8px; }
.dt-level { display:flex; flex-wrap:wrap; gap:.35rem; justify-content:center; }
.dt-node { font-size:.72rem; padding:3px 8px; border-radius:6px; }
.dt-direct { background:rgba(46,125,50,.1); border:1px solid rgba(46,125,50,.25); color:#1b5e20; font-weight:700; }
.dt-trans  { background:rgba(0,0,0,.05); border:1px solid rgba(0,0,0,.12); }
.dt-ellipsis { font-size:.7rem; opacity:.55; padding:3px 8px; border:1px dashed rgba(0,0,0,.2); border-radius:6px; }
.dt-arrow { font-size:.78rem; opacity:.5; }
.dt-total { font-size:.78rem; opacity:.7; padding:.5rem .75rem; background:rgba(198,40,40,.06); border-radius:6px; border:1px solid rgba(198,40,40,.15); }
.era-timeline { display:flex; flex-direction:column; gap:.75rem; margin:1.25rem 0; }
.era-card { border:1px solid rgba(0,0,0,.1); border-radius:12px; overflow:hidden; }
.era-accidental  { border-top:3px solid #1565c0; }
.era-opportunistic{ border-top:3px solid #e65100; }
.era-strategic   { border-top:3px solid #c62828; }
.era-header { display:flex; flex-wrap:wrap; align-items:center; gap:.75rem; padding:.875rem 1.1rem; background:rgba(0,0,0,.03); border-bottom:1px solid rgba(0,0,0,.07); }
.era-period { font-size:.78rem; font-weight:700; opacity:.65; }
.era-name { font-size:.88rem; font-weight:700; flex:1; }
.era-tag { font-size:.68rem; padding:2px 7px; border-radius:8px; background:rgba(0,0,0,.06); opacity:.75; }
.era-body { padding:1rem 1.1rem; }
.era-body p { font-size:.83rem; line-height:1.72; margin-bottom:.75rem; opacity:.85; }
.era-incidents { margin-top:.75rem; }
.era-incident-label { font-size:.68rem; font-weight:700; opacity:.5; text-transform:uppercase; letter-spacing:.05em; margin-bottom:.35rem; }
.era-incident { font-size:.75rem; opacity:.72; padding:.2rem 0; border-bottom:1px solid rgba(0,0,0,.06); line-height:1.5; }
.era-incident:last-child { border-bottom:none; }
.attack-mechanics { border:1px solid rgba(0,0,0,.1); border-radius:12px; overflow:hidden; margin:1.25rem 0; }
.attack-title { font-size:.78rem; font-weight:700; opacity:.6; padding:.6rem 1rem; background:rgba(0,0,0,.04); border-bottom:1px solid rgba(0,0,0,.08); }
.attack-steps { padding:.5rem; }
.attack-step { display:flex; gap:.75rem; padding:.6rem .5rem; border-bottom:1px solid rgba(0,0,0,.06); }
.attack-step:last-child { border-bottom:none; }
.step-num { width:24px; height:24px; border-radius:50%; background:rgba(198,40,40,.12); color:#c62828; font-size:.78rem; font-weight:700; display:flex; align-items:center; justify-content:center; flex-shrink:0; margin-top:1px; }
.step-name { font-size:.82rem; font-weight:700; margin-bottom:.2rem; }
.step-desc { font-size:.77rem; opacity:.75; line-height:1.55; }
.callout-box { background:rgba(0,0,0,.04); border:1px solid rgba(0,0,0,.1); border-radius:8px; padding:.875rem 1rem; margin:1rem 0; }
.cb-amber { background:rgba(230,81,0,.05); border-color:rgba(230,81,0,.2); }
.cb-red   { background:rgba(198,40,40,.05); border-color:rgba(198,40,40,.2); }
.cb-green { background:rgba(46,125,50,.05);  border-color:rgba(46,125,50,.2); }
.callout-label { font-size:.72rem; font-weight:700; opacity:.6; margin-bottom:.4rem; text-transform:uppercase; letter-spacing:.05em; }
.callout-box p { font-size:.8rem; opacity:.8; line-height:1.65; margin:0; }
.pypi-comparison { margin:1.25rem 0; }
.pypi-compare-title { font-size:.78rem; font-weight:700; opacity:.55; margin-bottom:.5rem; text-transform:uppercase; letter-spacing:.05em; }
.compare-table { width:100%; border-collapse:collapse; font-size:.77rem; }
.compare-table th { font-size:.72rem; font-weight:700; text-align:left; padding:.45rem .75rem; background:rgba(0,0,0,.05); border-bottom:1px solid rgba(0,0,0,.1); opacity:.7; }
.compare-table td { padding:.4rem .75rem; border-bottom:1px solid rgba(0,0,0,.07); vertical-align:top; line-height:1.5; opacity:.8; }
.compare-table tr:last-child td { border-bottom:none; }
.compare-table tr:nth-child(even) td { background:rgba(0,0,0,.02); }
.typosquat-examples { border:1px solid rgba(0,0,0,.1); border-radius:10px; overflow:hidden; margin:1rem 0; }
.typosquat-title { font-size:.72rem; font-weight:700; opacity:.55; padding:.5rem .875rem; background:rgba(0,0,0,.04); border-bottom:1px solid rgba(0,0,0,.08); text-transform:uppercase; letter-spacing:.05em; }
.ts-grid { padding:.5rem; }
.ts-item { display:grid; grid-template-columns:90px 20px 1fr; gap:.5rem; align-items:baseline; padding:.4rem .25rem; border-bottom:1px solid rgba(0,0,0,.06); font-size:.77rem; }
.ts-item:last-child { border-bottom:none; }
.ts-legit { font-weight:700; color:#1b5e20; font-family:monospace; }
.ts-arrow { opacity:.4; }
.ts-fake  { opacity:.75; font-family:monospace; font-size:.72rem; }
.ts-impact { grid-column:1/-1; font-size:.72rem; font-style:italic; opacity:.6; padding-left:1rem; }
.bundling-grid { display:grid; grid-template-columns:1fr 1fr; gap:.75rem; margin:1.25rem 0; }
.bundle-card { background:#fff; border:1px solid rgba(0,0,0,.1); border-radius:10px; padding:.9rem 1rem; }
.bundle-card h4 { font-size:.82rem; font-weight:700; margin-bottom:.4rem; }
.bundle-card p  { font-size:.77rem; opacity:.75; line-height:1.6; margin-bottom:.5rem; }
.bundle-stat { display:flex; align-items:baseline; gap:.5rem; margin-top:.3rem; }
.bs-num { font-size:1rem; font-weight:700; }
.bs-label { font-size:.72rem; opacity:.6; }
.cicd-risk-model { border:1px solid rgba(0,0,0,.1); border-radius:10px; overflow:hidden; margin:1.25rem 0; }
.cicd-title { font-size:.78rem; font-weight:700; opacity:.6; padding:.6rem 1rem; background:rgba(0,0,0,.04); border-bottom:1px solid rgba(0,0,0,.08); }
.cicd-comparison { display:grid; grid-template-columns:1fr 1fr; }
.cicd-col { padding:.875rem 1rem; }
.cicd-col:first-child { border-right:1px solid rgba(0,0,0,.08); }
.cicd-col-header { font-size:.8rem; font-weight:700; margin-bottom:.5rem; opacity:.8; }
.cicd-danger { color:#c62828; }
.cicd-list { list-style:none; padding:0; }
.cicd-list li { font-size:.77rem; opacity:.75; line-height:1.6; padding:.25rem 0; border-bottom:1px solid rgba(0,0,0,.06); padding-left:.9rem; position:relative; }
.cicd-list li:last-child { border-bottom:none; }
.cicd-list li::before { content:""; position:absolute; left:0; top:.6rem; width:4px; height:4px; border-radius:50%; background:#888; }
.cicd-list-danger li::before { background:#c62828; }
.defense-tiers { display:flex; flex-direction:column; gap:.6rem; margin:1.25rem 0; }
.defense-tier { border:1px solid rgba(0,0,0,.1); border-radius:10px; padding:.9rem 1rem; }
.dt-now    { border-left:3px solid #2e7d32; background:rgba(46,125,50,.03); }
.dt-medium { border-left:3px solid #1565c0; background:rgba(21,101,192,.03); }
.dt-long   { border-left:3px solid #888; background:rgba(0,0,0,.02); }
.dt-label { font-size:.72rem; font-weight:700; opacity:.65; margin-bottom:.5rem; text-transform:uppercase; letter-spacing:.05em; }
.dt-now .dt-label    { color:#2e7d32; }
.dt-medium .dt-label { color:#1565c0; }
.ep-nav-footer { display:grid; grid-template-columns:1fr 1fr; gap:1rem; margin-top:2rem; padding-top:1.25rem; border-top:1px solid rgba(0,0,0,.1); }
.ep-nav-prev, .ep-nav-next { display:flex; flex-direction:column; gap:.2rem; }
.ep-nav-next { text-align:right; }
.ep-nav-dir { font-size:.72rem; font-weight:700; opacity:.5; }
.ep-nav-ep-title { font-size:.8rem; opacity:.75; line-height:1.4; }
/* Dark mode */
[data-theme="dark"] .era-card,
[data-theme="dark"] .attack-mechanics,
[data-theme="dark"] .bundle-card,
[data-theme="dark"] .cicd-risk-model,
[data-theme="dark"] .defense-tier,
[data-theme="dark"] .typosquat-examples,
[data-theme="dark"] .pypi-comparison .compare-table th { background:rgba(255,255,255,.05); }
[data-theme="dark"] .era-header { background:rgba(255,255,255,.04); }
[data-theme="dark"] .dt-root  { background:rgba(100,100,255,.12); }
[data-theme="dark"] .dt-direct{ background:rgba(80,200,80,.1); color:#88cc88; border-color:rgba(80,200,80,.25); }
[data-theme="dark"] .dt-total  { background:rgba(255,80,80,.07); }
[data-theme="dark"] .callout-box { background:rgba(255,255,255,.05); border-color:rgba(255,255,255,.12); }
[data-theme="dark"] .cb-red   { background:rgba(255,80,80,.08); }
[data-theme="dark"] .cb-amber { background:rgba(255,150,50,.08); }
[data-theme="dark"] .ts-legit { color:#88cc88; }
[data-theme="dark"] .cicd-col:first-child { border-right-color:rgba(255,255,255,.08); }
[data-theme="dark"] .dep-tree-visual { background:rgba(255,255,255,.03); }
@media(max-width:600px) {
  .bundling-grid, .cicd-comparison { grid-template-columns:1fr; }
  .cicd-col:first-child { border-right:none; border-bottom:1px solid rgba(0,0,0,.08); }
  .ts-item { grid-template-columns:80px 16px 1fr; }
  .ep-nav-footer { grid-template-columns:1fr; }
  .ep-nav-next { text-align:left; }
}
</style>
{% endcapture %}
{{ extra_styles }}
