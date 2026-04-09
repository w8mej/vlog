---
layout: post
title: "Part III — When the security scanner became the weapon: Trivy → LiteLLM → Axios"
date: 2026-04-11
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 4
categories: ["Security", "Open Source", "Project Glasswing"]
tags: ["Trivy", "LiteLLM", "Axios", "TeamPCP", "UNC1069", "Sapphire Sleet", "CanisterWorm", "CVE-2026-33634", "supply chain attack", "CI/CD security", "blockchain C2", "WAV steganography", "DPRK", "credential harvesting", "European Commission", "GitHub Actions", "mutable tags", "SLSA"]
excerpt: "Two distinct nation-state actors struck the developer toolchain within 12 days. The inspector became the attack surface. The most diligent organizations had the greatest exposure. This is not a metaphor."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">



<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">On the morning of March 19, 2026, thousands of CI/CD pipelines around the world ran routine security scans using Trivy &mdash; one of the most trusted open-source vulnerability scanners in cloud-native engineering. What those pipelines actually executed was a credential stealer. The tool designed to protect them had been turned against them.</p>
  <p class="ep-lede">Twelve days later, a North Korean intelligence operation completed a two-week social engineering campaign against a single open-source maintainer and deployed a cross-platform remote access trojan to every developer machine, CI runner, and production server that installed a fresh copy of Axios &mdash; 100 million times per week &mdash; during a three-hour window.</p>
  <p class="ep-lede">These were not the same attack. They were not the same actor. They were not coordinated. They happened to coincide in the same two-week window because the conditions that made both attacks possible &mdash; trusted tooling with ambient credential access, volunteer maintainers with no security support &mdash; are the same structural conditions that have existed in the ecosystem since the DEF CON 22 dataset was compiled in 2014. The attackers simply got around to it.</p>
</div>

<div class="hero-stats">
  <div class="hstat"><div class="hstat-num">12 days</div><div class="hstat-sub">Between the Trivy compromise (Mar 19) and the Axios broadside (Mar 31) — two separate nation-state actors</div></div>
  <div class="hstat"><div class="hstat-num">300 GB</div><div class="hstat-sub">Compressed credentials harvested across both campaigns combined — actively monetized via ransomware partnerships</div></div>
  <div class="hstat"><div class="hstat-num">92 GB</div><div class="hstat-sub">Data stolen from the European Commission alone via the Trivy cascade</div></div>
  <div class="hstat"><div class="hstat-num">174K</div><div class="hstat-sub">npm packages with a direct or transitive dependency on Axios — all exposed during the 3-hour window</div></div>
</div>

<hr class="gw-hr">
<span class="section-label">Before the attack: the structural setup</span>
<h2>Why March 2026 was inevitable: the four conditions that had to be true simultaneously</h2>

<p>The March 2026 cascade did not emerge from a novel vulnerability class or a previously unknown attack technique. Every element had appeared in prior incidents. What was new was the convergence: four pre-existing structural conditions aligning in a way that enabled a single compromised tool to cascade through the global DevSecOps infrastructure.</p>

<div class="conditions-grid">
  <div class="condition-card">
    <div class="cond-num">01</div>
    <h4>Security tooling had CI/CD pipeline secrets by design</h4>
    <p>Trivy runs in CI/CD pipelines to scan container images and infrastructure code for vulnerabilities. To do this effectively, it requires elevated access: read access to the container registry, access to source code, and in many configurations, access to the cloud credentials used to deploy the scanned infrastructure. This access was legitimate and intentional. The attack did not require Trivy to be misconfigured. It required Trivy to be Trivy.</p>
    <div class="cond-impact">Attack leverage: any code executing as Trivy could read every secret configured for the pipeline</div>
  </div>
  <div class="condition-card">
    <div class="cond-num">02</div>
    <h4>GitHub Actions tags were mutable by anyone with repository write access</h4>
    <p>Git tags are labels that point to commits. They are <em>not</em> immutable. A repository owner can force-push a tag to point to a completely different commit at any time, and consumers of that tag receive no notification. Every CI/CD workflow that references <code>aquasecurity/trivy-action@v0.69.3</code> trusts that the tag will forever point to the same code. That trust is a convention, not a guarantee. It cannot be a guarantee by design.</p>
    <div class="cond-impact">Attack leverage: force-pushing 76 tags required no new access beyond what the prior breach had already established</div>
  </div>
  <div class="condition-card">
    <div class="cond-num">03</div>
    <h4>Incomplete credential rotation left residual access from a prior breach</h4>
    <p>TeamPCP&rsquo;s access to the Trivy repository infrastructure was not fresh. It derived from a prior Aqua Security security incident in late February 2026 in which the initial containment was incomplete. The aqua-bot service account, the GPG signing keys, and credentials for Docker Hub, Twitter, and Slack had all been at risk. The team believed they had completed rotation. They had not rotated everything. TeamPCP retained residual access and waited.</p>
    <div class="cond-impact">Attack leverage: the gap between &ldquo;we rotated credentials&rdquo; and &ldquo;we rotated every credential&rdquo; was the entry point</div>
  </div>
  <div class="condition-card">
    <div class="cond-num">04</div>
    <h4>Security-conscious organizations ran Trivy on every build, every PR, every deployment</h4>
    <p>This is the inversion that makes the March 2026 cascade philosophically significant beyond its technical details. Organizations with mature security postures ran Trivy most. They scanned every pull request, every container push, every infrastructure change. Each of those scans was an execution of the malicious binary. The more security-conscious you were, the more times you executed the credential stealer. Diligence was the amplifier.</p>
    <div class="cond-impact">Attack leverage: the blast radius was directly proportional to the quality of the victim&rsquo;s security program</div>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">The TeamPCP campaign: full reconstruction</span>
<h2>March 19&ndash;27: how a security scanner becomes a credential harvesting platform at global scale</h2>

<div class="incident-timeline">
  <div class="inc-tl-header">
    <span class="itl-actor itl-teampcp">TeamPCP (UNC6780 / DeadCatx3 / PCPcat / ShellForge)</span>
    <span class="itl-period">March 19&ndash;27, 2026</span>
  </div>

  <div class="itl-row">
    <div class="itl-time">Feb 2026<br><span class="itl-sub">Prior breach</span></div>
    <div class="itl-content">
      <div class="itl-title">Incomplete credential rotation at Aqua Security creates residual access</div>
      <p class="itl-body">A separate breach of Aqua Security&rsquo;s infrastructure exposed credentials including the aqua-bot service account, signing keys, and platform tokens. The containment was real but incomplete. TeamPCP identified and retained access to the Argon-DevOps-Mgt service account, which bridged multiple GitHub organizations.</p>
    </div>
  </div>

  <div class="itl-row itl-critical">
    <div class="itl-time">Mar 19<br><span class="itl-sub">17:43 UTC</span></div>
    <div class="itl-content">
      <div class="itl-title">Trivy v0.69.4 tag pushed &mdash; the execution phase begins</div>
      <p class="itl-body">Using the retained aqua-bot credentials, TeamPCP force-pushed malicious commits to 76 of 77 version tags in <code>aquasecurity/trivy-action</code> and all 7 tags in <code>aquasecurity/setup-trivy</code>. Simultaneously, a backdoored Trivy binary was published as <code>v0.69.4</code> to GitHub Releases, GHCR, Docker Hub, ECR Public, deb/rpm repos, and get.trivy.dev. The commits spoofed legitimate maintainer identities. GitHub flagged them with &ldquo;This commit does not belong to any branch in this repository&rdquo; &mdash; a warning that very few automated systems or engineers would notice in normal operations.</p>
      <p class="itl-body">The payload ran in <code>entrypoint.sh</code> before the legitimate Trivy scan. Pipelines received normal scan output. No anomalous exit codes. No scan failures. Every secret accessible to the runner was exfiltrated to a Cloudflare Tunnel C2 endpoint (<code>plug-tab-protective-relay.trycloudflare.com</code>) encrypted with AES-256+RSA-4096 in a compressed <code>tpcp.tar.gz</code> archive.</p>
      <div class="itl-stats">
        <span class="itl-stat itl-red">76/77 trivy-action tags force-pushed</span>
        <span class="itl-stat itl-red">7/7 setup-trivy tags force-pushed</span>
        <span class="itl-stat itl-red">v0.69.4 published across all distribution channels simultaneously</span>
        <span class="itl-stat itl-amb">Exposure window begins</span>
      </div>
    </div>
  </div>

  <div class="itl-row">
    <div class="itl-time">Mar 19<br><span class="itl-sub">~21:00 UTC</span></div>
    <div class="itl-content">
      <div class="itl-title">Trivy team detects and begins remediation &mdash; but the damage is done</div>
      <p class="itl-body">The Trivy team identified the compromise approximately 3 hours after the attack began and removed the malicious artifacts from distribution channels. The trivy-action tags were remediated by 05:40 UTC on March 20. But three hours was enough. Every CI/CD pipeline that ran during that window &mdash; including late-night US deployments, Asian business-hour builds, and scheduled overnight scans &mdash; executed the credential stealer.</p>
    </div>
  </div>

  <div class="itl-row itl-critical">
    <div class="itl-time">Mar 20<br><span class="itl-sub">Early</span></div>
    <div class="itl-content">
      <div class="itl-title">CanisterWorm deployed &mdash; first blockchain C2 on record</div>
      <p class="itl-body">Using npm publish tokens harvested from the previous day&rsquo;s CI/CD runners, TeamPCP deployed CanisterWorm. This is the first documented malware using the DFINITY Internet Computer Protocol (ICP) blockchain as decentralized command-and-control infrastructure. ICP canisters are smart contract execution environments on the Internet Computer blockchain. A canister&rsquo;s address is a content hash; it cannot be taken down without the ICP network&rsquo;s consensus. Domain takedowns, IP blocks, and certificate revocation &mdash; the standard cybersecurity takedown toolkit &mdash; do not apply to ICP canisters.</p>
      <p class="itl-body">CanisterWorm authenticated against the npm registry using stolen publish tokens and infected packages maintained by the compromised accounts, including <code>@emilgroup</code> and <code>@opengov</code> enterprise namespaces. Over 47 packages were infected in under 60 seconds. Each infected package contained a copy of the worm that would activate when the package was installed, harvesting npm tokens from the installing environment and using them to propagate further.</p>
      <div class="tech-detail">
        <div class="td-label">Technical detail: why ICP-based C2 defeats conventional takedowns</div>
        <p>Traditional malware C2 uses domain names or IP addresses as communication endpoints. Both are revocable by registrars, ISPs, and government agencies. Tor and I2P provide some resilience but are well-understood and partially blockable at network layer. ICP canisters are cryptographically addressed smart contracts running on a decentralized blockchain with 100+ independent node providers globally. There is no registrar to contact, no hosting provider to serve a takedown notice, and no single point of failure to disrupt. The security community had theorized this attack class; CanisterWorm was its first production deployment.</p>
      </div>
      <div class="itl-stats">
        <span class="itl-stat itl-red">47+ npm packages infected in &lt;60 seconds</span>
        <span class="itl-stat itl-red">First documented ICP blockchain C2</span>
        <span class="itl-stat itl-amb">Each infected package self-propagates on install</span>
      </div>
    </div>
  </div>

  <div class="itl-row">
    <div class="itl-time">Mar 22<br><span class="itl-sub">Docker extension</span></div>
    <div class="itl-content">
      <div class="itl-title">Separately compromised Docker Hub credentials extend exposure by 10 hours</div>
      <p class="itl-body">TeamPCP had also compromised Docker Hub credentials for the Aqua Security account through a separate credential path (not the tag-poisoning method). On March 22, they pushed additional malicious Trivy Docker images &mdash; <code>v0.69.5</code>, <code>v0.69.6</code>, and <code>latest</code> &mdash; using these credentials, bypassing all GitHub-based controls that had been put in place. This extended the active exposure window by approximately 10 hours. Mirror.gcr.io may still serve cached malicious images for some time after the removal.</p>
    </div>
  </div>

  <div class="itl-row">
    <div class="itl-time">Mar 22<br><span class="itl-sub">Checkmarx</span></div>
    <div class="itl-content">
      <div class="itl-title">Lateral pivot to Checkmarx KICS &mdash; the credentials bridge</div>
      <p class="itl-body">Using the Argon-DevOps-Mgt service account, which bridged the Aqua Security and Checkmarx GitHub organizations, TeamPCP force-pushed malicious commits to all 35 version tags in Checkmarx&rsquo;s <code>kics-github-action</code> and <code>ast-github-action</code> repositories. The payload was functionally similar to the Trivy stealer but with a different C2 domain (<code>checkmarx.zone</code>). A <code>sysmon.service</code> persistence backdoor was planted on affected Linux systems &mdash; polling checkmarx.zone every 50 minutes &mdash; representing an active access channel on any unremediated host. The team also defaced all 44 repositories in Aqua Security&rsquo;s <code>aquasec-com</code> GitHub org, renaming them with <code>tpcp-docs-</code> prefixes and exposing proprietary source code.</p>
      <div class="itl-stats">
        <span class="itl-stat itl-red">35 KICS version tags poisoned</span>
        <span class="itl-stat itl-red">44 Aqua repos defaced</span>
        <span class="itl-stat itl-amb">sysmon.service persistence: polls every 50 min</span>
      </div>
    </div>
  </div>

  <div class="itl-row itl-critical">
    <div class="itl-time">Mar 24<br><span class="itl-sub">LiteLLM</span></div>
    <div class="itl-content">
      <div class="itl-title">LiteLLM AI key vault breached &mdash; the credential that unlocks every LLM provider</div>
      <p class="itl-body">BerriAI (LiteLLM&rsquo;s maintainer) used Trivy scanning in their CI/CD pipeline. The poisoned trivy-action that ran on March 19&ndash;20 harvested BerriAI&rsquo;s PyPI publishing token. Five days later, TeamPCP used that token to publish <code>litellm==1.82.7</code> and <code>litellm==1.82.8</code> directly to PyPI, bypassing all normal release controls and GitHub Actions provenance checks.</p>
      <p class="itl-body">The attack introduced two persistence mechanisms. First: a <code>.pth</code> file in Python&rsquo;s site-packages directory. Python processes <code>.pth</code> files at interpreter startup, before any import. The file executed a credential-stealing import on every Python invocation: <code>python</code>, <code>pip</code>, <code>pytest</code>, <code>jupyter</code>. Removing LiteLLM does not remove the <code>.pth</code> file unless you know to look for it. Second: Kubernetes lateral movement via privileged pods deployed to every node through kube-system, giving full host filesystem access to any K8s cluster accessible from the compromised environment.</p>
      <p class="itl-body">LiteLLM is an AI gateway routing requests to 100+ LLM providers &mdash; OpenAI, Anthropic, Azure OpenAI, Google Vertex AI, AWS Bedrock, and more. It stores the corresponding API keys. Wiz Research found it present in 36% of monitored cloud environments. A compromise of LiteLLM is not a compromise of one service. It is a simultaneous compromise of every LLM integration an organization has.</p>
      <div class="tech-detail">
        <div class="td-label">The .pth persistence mechanism: why removing the package isn&rsquo;t enough</div>
        <p>Python&rsquo;s <code>site-packages</code> directory contains <code>.pth</code> files that configure the Python path. If a <code>.pth</code> file contains an <code>import</code> or <code>exec</code> statement, Python executes it at interpreter startup. The malicious LiteLLM package created <code>litellm_init.pth</code> in site-packages with an import that loaded credential-harvesting code. When you <code>pip uninstall litellm</code>, pip removes the LiteLLM module files. It does not remove the <code>.pth</code> file, which was placed there by a <code>postinstall</code> step separate from the module installation. Detection: <code>grep -r "import" $(python -c "import site; print(site.getsitepackages()[0])")/*.pth</code>. Any <code>.pth</code> file containing an import statement is suspicious.</p>
      </div>
      <div class="itl-stats">
        <span class="itl-stat itl-red">95M monthly PyPI downloads</span>
        <span class="itl-stat itl-red">36% of cloud environments (Wiz Research)</span>
        <span class="itl-stat itl-red">ALL LLM API keys simultaneously exposed</span>
        <span class="itl-stat itl-red">K8s lateral movement via kube-system</span>
        <span class="itl-stat itl-amb">.pth persistence survives package removal</span>
        <span class="itl-stat itl-amb">3hr live window; quarantined by PyPI</span>
      </div>
    </div>
  </div>

  <div class="itl-row">
    <div class="itl-time">Mar 26<br><span class="itl-sub">Telnyx SDK</span></div>
    <div class="itl-content">
      <div class="itl-title">WAV steganography delivery &mdash; a novel technique in production</div>
      <p class="itl-body">The Telnyx Python SDK compromise introduced a technique that the security research community had discussed theoretically but had not previously observed in an active supply chain attack: steganographic payload delivery via WAV audio files. The malicious SDK version included a <code>.wav</code> file dependency that appeared to be an audio resource. The actual content was an AES-256+RSA-4096 encrypted second-stage payload encoded into the least-significant bits of the audio waveform.</p>
      <p class="itl-body">The steganographic encoding was sophisticated enough that the file passed standard binary analysis and file-type checks. The audio was valid WAV format and would play as noise if opened in an audio player. The malware component extracted and decrypted the payload only when specific environmental conditions were met, making sandbox analysis less reliable.</p>
      <p class="itl-body">By this point in the campaign, TeamPCP had announced operational partnerships with CipherForce and Vect ransomware groups. The estimated 300 GB of compressed credentials harvested across the full campaign was being actively monetized: developer credentials for sale or use in further intrusions, LLM API keys resold or used directly, cloud credentials used for cryptomining or ransomware staging.</p>
      <div class="tech-detail">
        <div class="td-label">WAV steganography: how it works in the Telnyx context</div>
        <p>Standard audio steganography embeds data in the least-significant bits (LSBs) of audio samples. A 16-bit audio sample has a range of 65,536 values; changing the last bit shifts the audio value by 1/65,536 of its range, which is inaudible to human ears and below the noise floor of most recording environments. A 3-minute stereo WAV file at 44.1kHz contains approximately 15.9 million samples; storing 1 bit per sample yields ~1.99 MB of hidden capacity, more than sufficient for a compressed encrypted payload. The Telnyx variant used a proprietary scheme that spread the payload across multiple LSBs with AES-256 encryption and RSA-4096 key wrapping, making detection dependent on knowing the key or having a clean reference file to compare against.</p>
      </div>
      <div class="itl-stats">
        <span class="itl-stat itl-red">First production WAV steganography supply chain delivery</span>
        <span class="itl-stat itl-red">300 GB credentials total across full campaign</span>
        <span class="itl-stat itl-amb">CipherForce + Vect ransomware monetization partnerships</span>
      </div>
    </div>
  </div>

</div>

<hr class="gw-hr">
<span class="section-label">The concurrent DPRK operation</span>
<h2>March 31: a completely independent actor, a two-week investment, a three-hour window</h2>

<p>While TeamPCP was running its cascade across March 19&ndash;27, an entirely separate North Korean intelligence operation was running on a parallel track. UNC1069 &mdash; also tracked as Sapphire Sleet, STARDUST CHOLLIMA, BlueNoroff, and CryptoCore by different vendor intelligence teams &mdash; had been working a social engineering campaign against Axios lead maintainer Jason Saayman for approximately two weeks.</p>

<p>The two operations were not coordinated. They did not share infrastructure. They targeted different ecosystems via different methods for different ultimate objectives. They happened to converge in the same twelve-day window because both were exploiting the same structural vulnerability: open-source maintainers with significant deployment footprints, no institutional security support, and high susceptibility to social engineering from well-resourced adversaries.</p>

<div class="unc1069-timeline">
  <div class="unc-header">
    <span class="unc-actor">UNC1069 / Sapphire Sleet / STARDUST CHOLLIMA (DPRK)</span>
    <span class="unc-period">~March 17&ndash;31, 2026</span>
  </div>

  <div class="unc-phase">
    <div class="unc-phase-label">Phase 1 &mdash; Reconnaissance and target selection</div>
    <div class="unc-phase-body">
      <p>Axios is the most downloaded HTTP client library for Node.js. At ~100 million weekly downloads, it is a foundational dependency of the JavaScript ecosystem. A compromised Axios release tagged <code>latest</code> reaches every developer machine and CI/CD pipeline running <code>npm install</code> without a pinned version. The ROI calculation: one maintainer&rsquo;s credentials, accessible via social engineering, yields access to 174,000 downstream packages and every environment that installs any of them. UNC1069 had previously targeted cryptocurrency founders and venture capitalists using similar social engineering methods; OSS maintainers with comparable footprints were a natural extension of that target set.</p>
    </div>
  </div>

  <div class="unc-phase">
    <div class="unc-phase-label">Phase 2 &mdash; Identity construction (approximately 2 weeks before March 31)</div>
    <div class="unc-phase-body">
      <p>The attacker did not approach Saayman as an unknown contact. They constructed a believable identity: the appearance of a founder of a real, legitimate, well-known technology company. The operation included:</p>
      <ul class="bullets">
        <li>Cloning the company founder&rsquo;s LinkedIn presence and other public profile indicators</li>
        <li>Creating a real Slack workspace (not a fake link &mdash; an actual functional Slack workspace) branded to the company&rsquo;s CI system, with a plausible naming convention</li>
        <li>Populating the Slack workspace with channels sharing the real company&rsquo;s LinkedIn posts (which redirected to the legitimate account, providing authentic-looking content)</li>
        <li>Populating the workspace with what appeared to be other team members (additional compromised or synthetic accounts)</li>
        <li>Building rapport over multiple interactions before requesting anything that would require access</li>
      </ul>
      <p>Saayman&rsquo;s own postmortem described the Slack workspace as &ldquo;thought out very well&rdquo; with channels that made it look like a functional company environment. The social engineering was not a phishing email. It was a multi-week relationship.</p>
    </div>
  </div>

  <div class="unc-phase">
    <div class="unc-phase-label">Phase 3 &mdash; The Teams call and RAT deployment (March 30&ndash;31)</div>
    <div class="unc-phase-body">
      <p>After establishing the relationship in Slack, the attacker scheduled a Microsoft Teams meeting with Saayman involving what appeared to be multiple participants from the fake company. During the call, the attacker reported an audio problem &mdash; &ldquo;I can&rsquo;t hear you, there seems to be a microphone issue&rdquo; &mdash; and suggested Saayman install a specific application or run a script to &ldquo;fix&rdquo; the audio. The fix was the RAT delivery mechanism. Once executed, it established persistence and harvested npm account credentials.</p>
      <div class="tech-detail">
        <div class="td-label">The malware suite: CosmicDoor, SilentSiphon, WAVESHAPER.V2</div>
        <p>UNC1069 deployed a cross-platform RAT framework with three parallel implementations sharing identical C2 protocol, command structure, and beacon behavior. <strong>CosmicDoor</strong> (Nim-based, macOS) and its Go counterpart (Windows) served as the primary backdoor and persistence mechanism. <strong>SilentSiphon</strong> was the credential harvester: capturing credentials from web browsers, password managers, and secrets associated with GitHub, GitLab, Bitbucket, npm, Yarn, pip, RubyGems, Rust Cargo, and .NET NuGet. <strong>WAVESHAPER.V2</strong> served as a conduit for additional downloaders and information stealers including HYPERCALL, SUGARLOADER, HIDDENCALL, SILENCELIFT, DEEPBREATH, and CHROMEPUSH. This is not a simple RAT. It is an intelligence collection platform designed specifically to harvest developer credentials across every package manager and source control system the target uses.</p>
      </div>
    </div>
  </div>

  <div class="unc-phase">
    <div class="unc-phase-label">Phase 4 &mdash; Registry exploitation and containment race (March 31, 00:21&ndash;03:15 UTC)</div>
    <div class="unc-phase-body">
      <p>With npm credentials in hand, the attacker changed the registered email on Saayman&rsquo;s npm account to an attacker-controlled ProtonMail address, establishing persistent registry access. A pre-staged decoy package (<code>plain-crypto-js@4.2.0</code>) had been published approximately 18 hours earlier to establish registry history and reduce the chance of automated anomaly detection on the malicious version.</p>
      <p>At 00:21 UTC, <code>axios@1.14.1</code> was published with <code>plain-crypto-js@4.2.1</code> as a dependency. At approximately 01:00 UTC, <code>axios@0.30.4</code> was published with the same payload. Both were tagged <code>latest</code> and <code>legacy</code> respectively, ensuring coverage of all active semver ranges. <code>plain-crypto-js@4.2.1</code>&rsquo;s <code>postinstall</code> hook executed <code>setup.js</code> automatically, which identified the target OS and downloaded the appropriate platform-specific stage-2 payload from <code>sfrclak[.]com:8000</code>.</p>
      <p>Community members who noticed the compromise and filed issues on the Axios repository had their issues deleted in real time by the compromised account. This active issue deletion extended the window by suppressing community detection signals. At 01:38 UTC, axios collaborator DigitalBrainJS &mdash; who had less permission than the compromised account but noticed the issue deletions &mdash; opened a deprecation PR and escalated directly to npm. npm removed the malicious versions at 03:15 UTC. Window: 2 hours, 54 minutes.</p>
      <div class="itl-stats">
        <span class="itl-stat itl-red">~100M weekly downloads</span>
        <span class="itl-stat itl-red">174,000 downstream npm packages</span>
        <span class="itl-stat itl-red">Cross-platform RAT: macOS + Windows + Linux</span>
        <span class="itl-stat itl-red">Issue deletions used to suppress detection</span>
        <span class="itl-stat itl-amb">2h 54m live window</span>
        <span class="itl-stat itl-amb">SLSA provenance absent &mdash; reliable detection signal</span>
      </div>
    </div>
  </div>

</div>

<hr class="gw-hr">
<span class="section-label">The blast radius</span>
<h2>How 12 days of nation-state activity translates into organizational exposure</h2>

<div class="blast-section">
  <p>The blast radius comparison below is instructive, but raw download numbers understate the actual organizational impact. Axios downloads are not unique organizations; many are repeated builds in CI/CD pipelines. The more relevant metric is: how many distinct developer machines and CI runners were executing fresh npm installs during the three-hour window? The answer is unknown but estimated in the millions, across every time zone where Node.js development activity occurs at midnight UTC.</p>
</div>

<div class="blast-bars">
  <div class="b-row"><div class="b-label">Axios (UNC1069)</div><div class="b-outer"><div class="b-inner" style="width:100%;background:#A32D2D"></div></div><div class="b-val" style="color:#A32D2D">~100M wk downloads &middot; 174K downstream packages</div></div>
  <div class="b-row"><div class="b-label">LiteLLM (TeamPCP)</div><div class="b-outer"><div class="b-inner" style="width:95%;background:#A32D2D"></div></div><div class="b-val" style="color:#A32D2D">95M mo downloads &middot; 36% of cloud envs (Wiz)</div></div>
  <div class="b-row"><div class="b-label">Trivy binary (TeamPCP)</div><div class="b-outer"><div class="b-inner" style="width:80%;background:#EF9F27"></div></div><div class="b-val" style="color:#854F0B">1,000+ enterprise envs &middot; European Commission 92 GB</div></div>
  <div class="b-row"><div class="b-label">Checkmarx KICS</div><div class="b-outer"><div class="b-inner" style="width:55%;background:#EF9F27"></div></div><div class="b-val" style="color:#854F0B">35 version tags &middot; 1,000s of pipelines</div></div>
  <div class="b-row"><div class="b-label">CanisterWorm (npm)</div><div class="b-outer"><div class="b-inner" style="width:42%;background:#EF9F27"></div></div><div class="b-val" style="color:#854F0B">47+ packages &middot; self-propagating via stolen tokens</div></div>
  <div class="b-row"><div class="b-label">Telnyx SDK</div><div class="b-outer"><div class="b-inner" style="width:25%;background:#0F6E56"></div></div><div class="b-val" style="color:#0F6E56">Smaller radius &middot; first WAV stego delivery in production</div></div>
</div>

<hr class="gw-hr">
<span class="section-label">Threat actor profiles</span>
<h2>Who ran these operations, and what the attribution tells us about the threat landscape</h2>

<div class="actor-grid">
  <div class="actor-card actor-deep-teampcp">
    <div class="actor-head">
      <div class="actor-name">TeamPCP (UNC6780)</div>
      <span class="pill pill-red">Mar 19&ndash;27, 2026</span>
    </div>
    <ul class="actor-list">
      <li><strong>Also tracked as:</strong> DeadCatx3, PCPcat, ShellForge, UNC6780 (Google Mandiant)</li>
      <li><strong>Classification:</strong> Financially motivated cybercriminal group with cloud-native specialization</li>
      <li><strong>Primary motive:</strong> Credential theft &rarr; ransomware monetization via partner groups</li>
      <li><strong>Prior activity:</strong> Cryptomining, data exfiltration, ransomware staging via misconfigured Docker APIs, K8s clusters, Redis servers</li>
      <li><strong>Entry vector:</strong> Residual access from incomplete credential rotation (Aqua Security, Feb 2026)</li>
      <li><strong>Novel technique 1:</strong> ICP blockchain canisters as censorship-resistant C2 (CanisterWorm)</li>
      <li><strong>Novel technique 2:</strong> WAV steganography for second-stage payload delivery (Telnyx SDK)</li>
      <li><strong>Ransomware partnerships:</strong> CipherForce, Vect; LAPSUS$ for data extortion</li>
      <li><strong>Data harvested:</strong> ~300 GB compressed credentials, AWS/GCP/Azure keys, K8s tokens, LLM API keys, npm/PyPI tokens, SSH keys</li>
      <li><strong>Notable victim:</strong> European Commission &mdash; 92 GB stolen, published by ShinyHunters</li>
    </ul>
  </div>
  <div class="actor-card actor-deep-unc1069">
    <div class="actor-head">
      <div class="actor-name">UNC1069 / Sapphire Sleet (DPRK)</div>
      <span class="pill pill-red">Mar 17&ndash;31, 2026</span>
    </div>
    <ul class="actor-list">
      <li><strong>Also tracked as:</strong> STARDUST CHOLLIMA (CrowdStrike), BlueNoroff, CryptoCore, Alluring Pisces, CageyChameleon</li>
      <li><strong>Classification:</strong> DPRK state-sponsored, Lazarus Group subcluster, financially motivated</li>
      <li><strong>Primary motive:</strong> Hard currency generation for DPRK regime via credential theft and direct crypto theft</li>
      <li><strong>Prior target set:</strong> Cryptocurrency exchanges, DeFi protocols, VC firms, crypto founders &mdash; pivoted to OSS maintainers as credential value became apparent</li>
      <li><strong>Entry vector:</strong> 2-week individualized social engineering campaign; fake company identity, Slack workspace, Teams call</li>
      <li><strong>Social engineering sophistication:</strong> Individually tailored to target; cloned real company founder&rsquo;s identity; created functional fake workspace with authentic-looking activity</li>
      <li><strong>Malware suite:</strong> CosmicDoor (Nim/macOS, Go/Windows), SilentSiphon (credential harvester), WAVESHAPER.V2, HYPERCALL, SUGARLOADER, HIDDENCALL, DEEPBREATH, CHROMEPUSH</li>
      <li><strong>Credential targets:</strong> npm, GitHub, GitLab, Bitbucket, pip, RubyGems, Cargo, NuGet &mdash; all package managers simultaneously</li>
      <li><strong>Operational patience:</strong> Two weeks of preparation for a three-hour execution window &mdash; nation-state ROI calculation at 100M weekly downloads</li>
    </ul>
  </div>
</div>

<div class="infobox">
  <p>The attribution convergence on these two campaigns &mdash; Google Threat Intelligence Group attributing UNC1069 (Axios), Mandiant attributing UNC6780 (Trivy/TeamPCP), Microsoft&rsquo;s Sapphire Sleet attribution for Axios, CrowdStrike&rsquo;s STARDUST CHOLLIMA attribution &mdash; is itself significant. Multiple major intelligence teams independently identified the same actor clusters within days of each incident. This level of attribution confidence is rare for supply chain attacks, and its availability here reflects both the sophistication of the detection community and the fact that these actors made mistakes that left attributable infrastructure artifacts.</p>
</div>

<hr class="gw-hr">
<span class="section-label">The European Commission breach: a case study</span>
<h2>What &ldquo;1,000+ enterprise environments compromised&rdquo; actually means in practice</h2>

<p>The European Commission was among the organizations whose CI/CD infrastructure ran the compromised Trivy binary during the March 19&ndash;20 window. CERT-EU attributed the subsequent breach to TeamPCP. The result: approximately 92 GB of compressed data &mdash; emails, personal details, internal documents from staff across dozens of EU institutions &mdash; was exfiltrated from the Commission&rsquo;s AWS infrastructure and subsequently published by ShinyHunters, the data extortion group that has operated Breach Forums since 2020.</p>

<p>The dual attribution &mdash; TeamPCP for the intrusion, ShinyHunters for the publication &mdash; reflects a professionalization of the cybercriminal ecosystem that mirrors legitimate business models. TeamPCP specializes in initial access and credential harvesting. ShinyHunters specializes in data brokerage and extortion. CipherForce and Vect specialize in ransomware deployment. The specialization makes each component more effective and the overall ecosystem more resilient to disruption of any single actor.</p>

<div class="callout-box cb-red">
  <div class="callout-label">Why government and critical infrastructure organizations had disproportionate Trivy exposure</div>
  <p>Many government security frameworks and FedRAMP-equivalent programs explicitly require continuous vulnerability scanning of container images and infrastructure code. Organizations operating under these frameworks had the strongest compliance incentives to run Trivy on every build. They also often ran Trivy in self-hosted runners with broader permission scopes, because government environments tend to use more restrictive network policies that require runners to have direct access to sensitive infrastructure. The compliance requirement that was supposed to improve security &mdash; continuous vulnerability scanning &mdash; became the mechanism for the largest credential theft in the history of European Union institutions.</p>
</div>

<hr class="gw-hr">
<span class="section-label">What detection looked like (and didn&rsquo;t)</span>
<h2>The signals that were present, the signals that were missing, and what you can do about each</h2>

<div class="detection-grid">
  <div class="detection-card dc-present">
    <div class="dc-header">Signals that were present and actionable</div>
    <div class="dc-item">
      <div class="dc-signal">SLSA provenance absent on Axios release</div>
      <div class="dc-detail">Legitimate Axios releases have always included OIDC provenance metadata and SLSA level 2 build attestations linking the npm package to a specific GitHub Actions run. The malicious versions had none &mdash; they were published directly via stolen credentials. Any organization running <code>npm audit signatures</code> (npm 9+) would have seen this immediately. Detection latency: seconds after publication.</div>
    </div>
    <div class="dc-item">
      <div class="dc-signal">GitHub commit &ldquo;does not belong to any branch&rdquo; warning on Trivy tags</div>
      <div class="dc-detail">GitHub annotates force-pushed tags with a warning indicating the tagged commit is not reachable from any branch in the repository. Any pipeline monitoring for this condition on GitHub Actions used by CI/CD would have caught the Trivy tag poisoning. Almost no organizations had this check.</div>
    </div>
    <div class="dc-item">
      <div class="dc-signal">Outbound connections to sfrclak.com (Axios) and scan.aquasecurtiy.org (Trivy) from CI runners</div>
      <div class="dc-detail">The malicious payloads communicated with attacker-controlled infrastructure. Organizations with egress filtering on CI/CD runners &mdash; allowing only known-good destinations &mdash; would have blocked the payload delivery. This is uncommon but deployable. The Axios C2 was <code>sfrclak[.]com:8000</code>; a runner with egress restricted to package registries would not have been able to reach it.</div>
    </div>
    <div class="dc-item">
      <div class="dc-signal">Anomalous npm package email change notification</div>
      <div class="dc-detail">npm sends notification emails when the registered email for an account is changed. The Saayman account email was changed to a ProtonMail address. If npm 2FA was configured and notification emails were monitored, this would have been detectable. npm 2FA was not configured on the Saayman account; this is not unusual for OSS maintainers who have not threat-modeled against nation-state targeting.</div>
    </div>
  </div>
  <div class="detection-card dc-absent">
    <div class="dc-header">Signals that were absent or unreliable</div>
    <div class="dc-item">
      <div class="dc-signal">Static analysis of the malicious Trivy binary</div>
      <div class="dc-detail">The credential stealer was added to the legitimate Trivy binary in a way that preserved normal scan output and exit codes. Without reference file comparison (hash mismatch detection), automated static analysis was not likely to catch the addition during the 3-hour initial window.</div>
    </div>
    <div class="dc-item">
      <div class="dc-signal">Social engineering detection for the Axios attack</div>
      <div class="dc-detail">There is no technical control that prevents the Axios attack vector. The attacker built a genuine relationship with a real human over two weeks. Security awareness training exists; it does not defeat a two-week, individually tailored, nation-state social engineering operation targeting a specific person. The only reliable mitigation is structural: mandatory 2FA for package publishing, trusted publishing with OIDC, SLSA attestation requirements.</div>
    </div>
    <div class="dc-item">
      <div class="dc-signal">Runtime behavior detection of .pth persistence</div>
      <div class="dc-detail">The LiteLLM <code>.pth</code> persistence mechanism executed on every Python invocation. Unless EDR coverage was specifically looking for unexpected imports from site-packages <code>.pth</code> files, this would appear identical to legitimate Python startup behavior. Most EDR products in 2026 do not specifically instrument Python <code>.pth</code> file execution.</div>
    </div>
    <div class="dc-item">
      <div class="dc-signal">ICP blockchain C2 takedown</div>
      <div class="dc-detail">CanisterWorm&rsquo;s ICP-based C2 was not and cannot be taken down via conventional mechanisms. Blocking ICP protocol traffic at the network layer is possible but has significant false-positive potential (legitimate ICP traffic). DNS-based blocking does not apply to canister addresses. This represents a genuine gap in the defensive toolkit.</div>
    </div>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">Remediation: if you were exposed</span>
<h2>The minimum viable response for environments that ran affected tooling between March 19&ndash;April 3</h2>

<div class="remediation-steps">

  <div class="rem-block rem-critical">
    <div class="rem-header">If you ran Trivy between March 19&ndash;22, 2026 (binary or GitHub Action)</div>
    <ul class="bullets">
      <li>Rotate all secrets that were environment variables in any runner that executed Trivy during this window: AWS IAM keys, GCP service account keys, Azure credentials, Kubernetes service account tokens, SSH private keys, Docker registry credentials, GitHub PATs, npm and PyPI publish tokens, database credentials</li>
      <li>Update Trivy binary to v0.69.3 or earlier; update trivy-action to v0.35.0 (commit 57a97c7) or later; update setup-trivy to v0.2.6 (commit 3fb12ec) or later</li>
      <li>Pin all future GitHub Actions references to full commit SHAs, not version tags</li>
      <li>Audit GitHub Actions workflow logs for connections to scan.aquasecurtiy.org or 45.148.10.212</li>
      <li>Check for tpcp-docs- prefixed repositories in your GitHub organizations (indicates credential access was used for repository defacement)</li>
      <li>Audit Kubernetes clusters for unauthorized workloads in kube-system namespace</li>
      <li>If sysmon.service is present on Linux hosts: this is the Checkmarx KICS persistence backdoor &mdash; remove and rotate all credentials on affected hosts</li>
    </ul>
  </div>

  <div class="rem-block rem-critical">
    <div class="rem-header">If you ran LiteLLM 1.82.7 or 1.82.8</div>
    <ul class="bullets">
      <li>Rotate all LLM API keys (OpenAI, Anthropic, Azure OpenAI, Google Vertex, AWS Bedrock, and all others configured in LiteLLM) immediately</li>
      <li>Check for <code>litellm_init.pth</code> in all Python site-packages directories: <code>find $(python -c "import site; print(':'.join(site.getsitepackages()))") -name "*.pth" -exec grep -l "import" {} \;</code></li>
      <li>Remove any <code>.pth</code> files with import statements; these are not created by standard Python packages and should not be present</li>
      <li>Audit Kubernetes clusters for privileged pods in kube-system that were not deployed by your team &mdash; the lateral movement mechanism created privileged pods with full host filesystem access to every node</li>
      <li>Treat any system that had LiteLLM installed and ran a Python interpreter after the installation as fully compromised, even if the malicious package has been removed</li>
    </ul>
  </div>

  <div class="rem-block rem-high">
    <div class="rem-header">If you installed Axios between March 31 00:21&ndash;03:15 UTC</div>
    <ul class="bullets">
      <li>Safe versions: axios@1.14.0 or earlier (1.x), axios@0.30.3 or earlier (0.30.x)</li>
      <li>Check for <code>plain-crypto-js</code> in node_modules; if present, treat the environment as compromised</li>
      <li>Search for outbound connections to sfrclak.com or 142.11.206.72 on port 8000 in network logs during the window</li>
      <li>Rotate all developer credentials on machines that ran npm install during this window: browser-saved credentials, password manager entries, GitHub tokens, cloud provider credentials</li>
      <li>Check for persistence mechanisms: scheduled tasks (Windows), launchd agents (macOS), systemd units (Linux) created by an npm postinstall script</li>
    </ul>
  </div>

</div>

<div class="infobox red">
  <p>The meta-irony deserves explicit statement one more time, because it is the thematic core of this episode and of the series: Trivy is a vulnerability scanner. Its elevated CI/CD pipeline access was not a misconfiguration. It was a design requirement. The security tool that was supposed to make your pipeline safer ran the credential stealer because it was doing exactly what it was designed to do &mdash; running in your pipeline with access to everything your pipeline touches. The March 2026 cascade did not represent a failure of security engineering. It represented the weaponization of security engineering. The fairy dust that dissipated in this episode was the assumption that the tools designed to protect you are themselves protected.</p>
</div>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-04-10-project-butterfly-of-damocles-part-2 %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 3 &mdash; Part II: The dependency graph</span>
  </a>
  <a href="{% post_url 2026-04-12-project-butterfly-of-damocles-part-4 %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 5 &mdash; The XZ playbook: two years to own a dependency of sshd</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">Trivy</span><span class="tag">LiteLLM</span><span class="tag">Axios</span>
  <span class="tag">TeamPCP</span><span class="tag">UNC1069</span><span class="tag">Sapphire Sleet</span><span class="tag">DPRK</span>
  <span class="tag">CanisterWorm</span><span class="tag">ICP blockchain C2</span><span class="tag">WAV steganography</span>
  <span class="tag">CVE-2026-33634</span><span class="tag">CVSS 9.4</span>
  <span class="tag">GitHub Actions mutable tags</span><span class="tag">SLSA provenance</span>
  <span class="tag">European Commission breach</span><span class="tag">ShinyHunters</span>
  <span class="tag">Python .pth persistence</span><span class="tag">postinstall hook</span>
  <span class="tag">CosmicDoor</span><span class="tag">SilentSiphon</span><span class="tag">WAVESHAPER.V2</span>
  <span class="tag">CI/CD security</span><span class="tag">credential harvesting</span>
  <span class="tag">Project Glasswing</span><span class="tag">Project Butterfly of Damocles</span>
</div>

<div class="gw-byline">John Menerick is a senior information security architect and consultant (CISSP, NSA, CKS/CKA). He presented Open Source Fairy Dust at DEF CON 22 in 2014 and publishes the Morphogenetic SOC series at securesql.info. The views expressed are his own and do not represent the views of Anthropic, Project Glasswing, or any Glasswing launch partner.</div>

</div><!-- /glasswing-wrapper -->

{% capture extra_styles %}
<style>
/* ── Episode 4 additional styles ── */
.ep-nav-bar{display:flex;flex-wrap:wrap;align-items:center;gap:.5rem;font-size:.75rem;opacity:.55;margin-bottom:1.5rem;padding:.6rem .875rem;background:rgba(0,0,0,.04);border-radius:8px}
.ep-nav-sep{opacity:.4}
.ep-nav-series{font-weight:700}
.ep-lede{font-style:italic;font-size:1rem;line-height:1.75;margin-bottom:.75rem}
.ep-lede-block{margin-bottom:1.5rem}
.conditions-grid{display:grid;grid-template-columns:1fr 1fr;gap:.75rem;margin:1.25rem 0}
.condition-card{background:#fff;border:1px solid rgba(0,0,0,.1);border-radius:10px;padding:.9rem 1rem}
.cond-num{font-size:1.6rem;font-weight:700;opacity:.15;line-height:1;margin-bottom:.3rem}
.condition-card h4{font-size:.82rem;font-weight:700;margin-bottom:.3rem}
.condition-card p{font-size:.78rem;opacity:.78;line-height:1.6;margin-bottom:.4rem}
.cond-impact{font-size:.72rem;font-style:italic;opacity:.65;padding:.3rem .5rem;background:rgba(0,0,0,.04);border-radius:4px;border-left:2px solid rgba(198,40,40,.35)}
.incident-timeline{margin:1.25rem 0;border:1px solid rgba(0,0,0,.1);border-radius:12px;overflow:hidden}
.inc-tl-header{display:flex;flex-wrap:wrap;justify-content:space-between;align-items:center;gap:.5rem;padding:.75rem 1.1rem;background:rgba(0,0,0,.05);border-bottom:1px solid rgba(0,0,0,.08)}
.itl-actor{font-size:.82rem;font-weight:700}
.itl-teampcp{color:#993300}
.itl-period{font-size:.72rem;opacity:.6}
.itl-row{display:flex;gap:0;border-bottom:1px solid rgba(0,0,0,.07)}
.itl-row:last-child{border-bottom:none}
.itl-row.itl-critical{background:rgba(198,40,40,.04)}
.itl-time{min-width:80px;flex-shrink:0;padding:.875rem .75rem;background:rgba(0,0,0,.03);border-right:1px solid rgba(0,0,0,.07);font-size:.72rem;font-weight:700;opacity:.7;line-height:1.35;text-align:right}
.itl-time .itl-sub{font-weight:400;opacity:.7;font-size:.68rem}
.itl-content{padding:.875rem 1rem;flex:1}
.itl-title{font-size:.85rem;font-weight:700;margin-bottom:.4rem;line-height:1.35}
.itl-body{font-size:.78rem;opacity:.8;line-height:1.65;margin-bottom:.5rem}
.itl-stats{display:flex;flex-wrap:wrap;gap:.3rem;margin-top:.4rem}
.itl-stat{font-size:.68rem;padding:2px 6px;border-radius:6px;background:rgba(0,0,0,.05);border:.5px solid rgba(0,0,0,.1)}
.itl-red{background:rgba(198,40,40,.1);color:#b71c1c;border-color:rgba(198,40,40,.25)}
.itl-amb{background:rgba(230,81,0,.08);color:#bf360c;border-color:rgba(230,81,0,.2)}
.tech-detail{background:rgba(0,0,0,.04);border:1px solid rgba(0,0,0,.1);border-radius:7px;padding:.75rem .875rem;margin:.75rem 0}
.td-label{font-size:.7rem;font-weight:700;opacity:.55;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.35rem}
.tech-detail p{font-size:.78rem;opacity:.78;line-height:1.6;margin:0}
.unc1069-timeline{margin:1.25rem 0;border:1px solid rgba(0,0,0,.1);border-radius:12px;overflow:hidden}
.unc-header{display:flex;flex-wrap:wrap;justify-content:space-between;align-items:center;gap:.5rem;padding:.75rem 1.1rem;background:rgba(0,0,0,.05);border-bottom:1px solid rgba(0,0,0,.08)}
.unc-actor{font-size:.82rem;font-weight:700;color:#0d47a1}
.unc-period{font-size:.72rem;opacity:.6}
.unc-phase{border-bottom:1px solid rgba(0,0,0,.07);padding:.875rem 1.1rem}
.unc-phase:last-child{border-bottom:none}
.unc-phase-label{font-size:.72rem;font-weight:700;opacity:.55;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.5rem}
.unc-phase-body p{font-size:.82rem;opacity:.8;line-height:1.65;margin-bottom:.5rem}
.unc-phase-body ul{margin:.4rem 0}
.actor-deep-teampcp{border-top:2px solid #c62828}
.actor-deep-unc1069{border-top:2px solid #1565c0}
.blast-section{margin-bottom:.5rem}
.blast-section p{font-size:.85rem;opacity:.82;line-height:1.7}
.detection-grid{display:grid;grid-template-columns:1fr 1fr;gap:.75rem;margin:1.25rem 0}
.detection-card{border:1px solid rgba(0,0,0,.1);border-radius:10px;overflow:hidden}
.dc-present{border-top:2px solid #2e7d32}
.dc-absent {border-top:2px solid #c62828}
.dc-header{font-size:.72rem;font-weight:700;opacity:.6;padding:.5rem .875rem;background:rgba(0,0,0,.04);border-bottom:1px solid rgba(0,0,0,.07);text-transform:uppercase;letter-spacing:.05em}
.dc-present .dc-header{color:#2e7d32}
.dc-absent  .dc-header{color:#c62828}
.dc-item{padding:.6rem .875rem;border-bottom:1px solid rgba(0,0,0,.06)}
.dc-item:last-child{border-bottom:none}
.dc-signal{font-size:.78rem;font-weight:700;margin-bottom:.25rem}
.dc-detail{font-size:.73rem;opacity:.72;line-height:1.55}
.remediation-steps{display:flex;flex-direction:column;gap:.6rem;margin:1.25rem 0}
.rem-block{border:1px solid rgba(0,0,0,.1);border-radius:10px;padding:.9rem 1.1rem}
.rem-critical{border-left:3px solid #c62828;background:rgba(198,40,40,.03)}
.rem-high    {border-left:3px solid #e65100;background:rgba(230,81,0,.03)}
.rem-header{font-size:.78rem;font-weight:700;margin-bottom:.6rem;line-height:1.35}
.rem-critical .rem-header{color:#c62828}
.rem-high     .rem-header{color:#e65100}
.callout-box{background:rgba(0,0,0,.04);border:1px solid rgba(0,0,0,.1);border-radius:8px;padding:.875rem 1rem;margin:1rem 0}
.cb-red{background:rgba(198,40,40,.05);border-color:rgba(198,40,40,.2)}
.callout-label{font-size:.72rem;font-weight:700;opacity:.6;margin-bottom:.4rem;text-transform:uppercase;letter-spacing:.05em}
.callout-box p{font-size:.8rem;opacity:.8;line-height:1.65;margin:0}
.ep-nav-footer{display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-top:2rem;padding-top:1.25rem;border-top:1px solid rgba(0,0,0,.1)}
.ep-nav-prev,.ep-nav-next{display:flex;flex-direction:column;gap:.2rem}
.ep-nav-next{text-align:right}
.ep-nav-dir{font-size:.72rem;font-weight:700;opacity:.5}
.ep-nav-ep-title{font-size:.8rem;opacity:.75;line-height:1.4}
/* Dark mode */
[data-theme="dark"] .condition-card,
[data-theme="dark"] .tech-detail,
[data-theme="dark"] .detection-card,
[data-theme="dark"] .rem-block,
[data-theme="dark"] .callout-box{background:rgba(255,255,255,.05);border-color:rgba(255,255,255,.1)}
[data-theme="dark"] .incident-timeline,
[data-theme="dark"] .unc1069-timeline{border-color:rgba(255,255,255,.1)}
[data-theme="dark"] .inc-tl-header,
[data-theme="dark"] .unc-header{background:rgba(255,255,255,.04);border-color:rgba(255,255,255,.08)}
[data-theme="dark"] .itl-row.itl-critical{background:rgba(255,80,80,.05)}
[data-theme="dark"] .itl-time{background:rgba(255,255,255,.03);border-color:rgba(255,255,255,.07)}
[data-theme="dark"] .itl-row{border-color:rgba(255,255,255,.06)}
[data-theme="dark"] .cond-impact{background:rgba(255,255,255,.05)}
[data-theme="dark"] .cb-red{background:rgba(255,80,80,.08)}
[data-theme="dark"] .dc-header{background:rgba(255,255,255,.04)}
[data-theme="dark"] .rem-critical{background:rgba(255,80,80,.06)}
[data-theme="dark"] .rem-high{background:rgba(255,130,50,.06)}
@media(max-width:600px){
  .conditions-grid,.detection-grid{grid-template-columns:1fr}
  .itl-time{min-width:60px;font-size:.68rem}
  .ep-nav-footer{grid-template-columns:1fr}
  .ep-nav-next{text-align:left}
}
</style>
{% endcapture %}
{{ extra_styles }}
