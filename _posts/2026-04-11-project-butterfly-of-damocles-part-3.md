---
layout: post
title: "Part IIa — When the security scanner became the weapon: Trivy → LiteLLM → Axios"
date: 2026-04-11
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 4
categories: ["Security", "Open Source", "Project Glasswing"]
excerpt: "Two distinct nation-state actors struck the developer toolchain within 12 days of each other. The inspector became the attack surface."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">

  <span class="section-label">Part IIa &mdash; The March 2026 cascade</span>
  <h2>When the security scanner became the weapon: Trivy &rarr; LiteLLM &rarr; Axios</h2>
  <p>Two distinct nation-state actors struck the developer toolchain within 12 days of each other. They didn&rsquo;t attack the applications. They attacked the tools organizations use to secure the applications &mdash; the inspector, not the kitchen. The most diligent defenders had the greatest exposure.</p>

  <div class="cascade">
    <div class="c-step">
      <div class="c-dot c-amber">&#9888;</div>
      <div class="c-body">
        <div class="c-title">Trivy v0.69.4 &mdash; the entry point <span class="c-date">Mar 19 &middot; CVE-2026-33634 &middot; CVSS 9.4</span></div>
        <p>TeamPCP (UNC6780/DeadCatx3) exploited incomplete credential rotation from a prior Aqua Security breach. Force-pushed malicious commits to 76/77 trivy-action version tags and all 7 setup-trivy tags. Poisoned binary published simultaneously to GitHub Releases, Docker Hub, GHCR, ECR, deb/rpm repos, and get.trivy.dev. A full credential stealer ran inside the legitimate scan &mdash; pipelines appeared normal. Harvested AWS IAM keys, GCP tokens, Azure env vars, K8s secrets, SSH keys, npm tokens. The most diligent organizations had the greatest exposure. European Commission: 92 GB stolen.</p>
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
        <p>BerriAI&rsquo;s CI/CD pipeline used Trivy for scanning. The poisoned trivy-action harvested their PyPI publishing token. TeamPCP published backdoored LiteLLM directly, bypassing all release controls. Malware introduced a Python <code>.pth</code> file &mdash; auto-executes on every Python interpreter startup, before any import. LiteLLM routes to OpenAI, Anthropic, Azure OpenAI, Google Vertex, AWS Bedrock, and 100+ other providers &mdash; storing all API keys centrally. Wiz Research: present in 36% of monitored cloud environments. K8s lateral movement via kube-system on every cluster node.</p>
        <div class="c-stats">
          <span class="c-stat red">95M monthly downloads</span>
          <span class="c-stat red">36% of cloud environments (Wiz)</span>
          <span class="c-stat red">ALL LLM API keys exposed</span>
          <span class="c-stat amb">.pth persistence: every Python invocation</span>
          <span class="c-stat amb">K8s lateral movement: kube-system</span>
        </div>
      </div>
    </div>
    <div class="c-step">
      <div class="c-dot c-coral">&#9679;</div>
      <div class="c-body">
        <div class="c-title">Telnyx SDK &mdash; WAV steganography delivery <span class="c-date">Mar 26</span></div>
        <p>The campaign&rsquo;s most technically novel element: WAV audio file steganography used to conceal and deliver AES-256+RSA-4096 encrypted second-stage payloads &mdash; the first documented use of this technique in a supply chain attack. By this point TeamPCP had announced ransomware partnerships with CipherForce and Vect, with approximately 300 GB of compressed credentials being actively monetized.</p>
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
        <p>A completely independent operation. UNC1069 spent two weeks individually targeting lead maintainer Jason Saayman: cloned founder identity, crafted Slack workspace with LinkedIn feeds and fake team members, moved to Teams, faked an audio error, prompted install of a fix. RAT deployed. Both <code>latest</code> and <code>legacy</code> dist-tags pointed to malicious versions. CosmicDoor + SilentSiphon cross-platform RAT deployed during a 3-hour window. Community members who filed issues had them deleted in real time by the compromised account. SLSA provenance absent &mdash; the one reliable detection signal.</p>
        <div class="c-stats">
          <span class="c-stat red">~100M weekly downloads</span>
          <span class="c-stat red">174,000 downstream packages</span>
          <span class="c-stat amb">2-week individual social engineering</span>
          <span class="c-stat amb">SLSA provenance absence = detection signal</span>
        </div>
      </div>
    </div>
  </div>

  <h3>March 2026 attack wave: blast radius comparison</h3>
  <div class="blast-bars">
    <div class="b-row"><div class="b-label">Axios (UNC1069)</div><div class="b-outer"><div class="b-inner" style="width:100%;background:var(--red-dark)"></div></div><div class="b-val" style="color:var(--red-dark)">~100M wk downloads &middot; 174K pkgs</div></div>
    <div class="b-row"><div class="b-label">LiteLLM (TeamPCP)</div><div class="b-outer"><div class="b-inner" style="width:95%;background:var(--red-dark)"></div></div><div class="b-val" style="color:var(--red-dark)">95M mo downloads &middot; 36% cloud envs</div></div>
    <div class="b-row"><div class="b-label">Trivy (TeamPCP)</div><div class="b-outer"><div class="b-inner" style="width:80%;background:#EF9F27"></div></div><div class="b-val" style="color:var(--amber-dark)">1,000+ enterprise envs</div></div>
    <div class="b-row"><div class="b-label">Checkmarx KICS</div><div class="b-outer"><div class="b-inner" style="width:55%;background:#EF9F27"></div></div><div class="b-val" style="color:var(--amber-dark)">35 tags &middot; thousands of pipelines</div></div>
    <div class="b-row"><div class="b-label">CanisterWorm (npm)</div><div class="b-outer"><div class="b-inner" style="width:42%;background:#EF9F27"></div></div><div class="b-val" style="color:var(--amber-dark)">47+ packages &middot; self-propagating</div></div>
    <div class="b-row"><div class="b-label">Telnyx SDK</div><div class="b-outer"><div class="b-inner" style="width:25%;background:var(--teal-dark)"></div></div><div class="b-val" style="color:var(--teal-dark)">Smaller radius &middot; novel technique</div></div>
  </div>

  <div class="actor-grid">
    <div class="actor-card">
      <div class="actor-head"><div class="actor-name">TeamPCP (UNC6780)</div><span class="pill pill-red">Mar 19&ndash;27</span></div>
      <ul class="actor-list">
        <li>Also: DeadCatx3, PCPcat, ShellForge</li>
        <li>Motive: credential theft &rarr; ransomware monetization</li>
        <li>Entry: incomplete credential rotation (Aqua Security)</li>
        <li>Technique: mutable git tag abuse, CI/CD secret harvesting</li>
        <li>Novel C2: ICP blockchain canisters &mdash; censorship-resistant</li>
        <li>Novel delivery: WAV audio steganography (Telnyx)</li>
        <li>Partners: CipherForce, Vect ransomware, LAPSUS$</li>
        <li>Data stolen: ~300 GB compressed credentials</li>
      </ul>
    </div>
    <div class="actor-card">
      <div class="actor-head"><div class="actor-name">UNC1069 / Sapphire Sleet (DPRK)</div><span class="pill pill-red">Mar 31</span></div>
      <ul class="actor-list">
        <li>Also: STARDUST CHOLLIMA, BlueNoroff, CryptoCore</li>
        <li>Motive: financial &mdash; crypto, AI, developer credentials</li>
        <li>Entry: 2-week individualized social engineering campaign</li>
        <li>Technique: identity cloning, fake Slack workspace, Teams</li>
        <li>Malware suite: CosmicDoor, SilentSiphon, WAVESHAPER.V2</li>
        <li>Targets: npm, GitHub, GitLab, pip, RubyGems, NuGet creds</li>
        <li>Pattern: pivoted from crypto founders to OSS maintainers</li>
        <li>Detection signal: SLSA provenance absent on release</li>
      </ul>
    </div>
  </div>

  <div class="infobox red">
    <p>The meta-irony: Trivy is a vulnerability scanner. It runs with elevated access to pipeline secrets by design. The attackers didn&rsquo;t break that design &mdash; they used it. The most security-conscious organizations had the greatest exposure because they ran Trivy most frequently. In 2026, diligence became the attack surface. This is the 2014 thesis, one abstraction layer higher: the fairy dust now extends to the security tooling itself.</p>
  </div>

</div>
