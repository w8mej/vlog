---
layout: default
title: "Speaking"
description: "John Menerick (Lord_SQL & W8MEJ) speaks at DEF CON, ISC2, Stanford, CCC, ROOTCON, JavaOne, and more — covering adversarial AI, autonomous SOC, offensive security, zero knowledge computing, MPC, systems-inspired defense, cloud-native hardening, and complex systems science."
permalink: /speaking/
---

<div class="ed-index">

  <section class="ed-hero">
    <div class="ed-hero-text">
      <div class="ed-kicker">Available for engagements</div>
      <h1 class="ed-hero-title">Speaking</h1>
      <p class="ed-hero-standfirst">Two decades on stage at DEF CON, ISC2, Stanford, CCC, JavaOne, and ROOTCON.</p>
      <p class="ed-hero-body">Adversarial AI, autonomous SOC architecture, offensive security research, zero knowledge computing, multi-party computation, bio-inspired defense, Kubernetes hardening, hardware-rooted identity, complex systems science, and financial systems security. Every talk is backed by published research, working exploits, and production deployments &mdash; for audiences that want to be challenged, not just informed.</p>
      <div class="ed-hero-cta">
        <a class="ed-btn" href="mailto:{{ site.email | default: 'picklejar@haxx.ninja' }}">Book an engagement</a>
        <a class="ed-btn-ghost" href="https://www.linkedin.com/in/w8mej" target="_blank" rel="noopener">LinkedIn &rarr;</a>
      </div>
    </div>
    <div class="ed-hero-portrait">
      <img src="{{ site.baseurl }}/images/circular_headshot.png" alt="John Menerick" width="300" height="375" />
    </div>
  </section>

  {% assign talks = site.data.speaking.talks %}
  {% if talks %}
  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Conference history</h2>
      <span class="ed-meta">{{ talks | size }} engagements</span>
    </div>

    <div class="ed-talks">
      {% for talk in talks %}
      <div class="ed-talk">
        <div class="ed-talk-year">{{ talk.year }}</div>
        <div class="ed-talk-body">
          <div class="ed-talk-conf">{{ talk.conference }}</div>
          <div class="ed-talk-title">{{ talk.talk }}</div>
          {% if talk.note %}<div class="ed-meta">{{ talk.note }}</div>{% endif %}
        </div>
        <div class="ed-talk-links">
          {% if talk.video_url != "" %}
            <a class="ed-talk-link" href="{{ talk.video_url }}" target="_blank" rel="noopener">Video</a>
          {% elsif talk.note contains "not recorded" %}
            <span class="ed-talk-link is-muted">Not recorded</span>
          {% endif %}
          {% if talk.slides_url != "" %}
            <a class="ed-talk-link" href="{{ talk.slides_url }}" target="_blank" rel="noopener">Slides</a>
          {% endif %}
        </div>
      </div>
      {% endfor %}
    </div>
  </section>
  {% endif %}

  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Talk topics</h2>
      <span class="ed-meta">Nineteen areas</span>
    </div>

    <div class="ed-topics">

      <div class="ed-topic-item">
        <div class="ed-topic-num">01</div>
        <h3 class="ed-topic-item-title">Adversarial AI &amp; the autonomous SOC</h3>
        <p>What happens when your SOC learns faster than your attackers evolve? Energy-based detection models, self-healing security architectures, and autonomous response loops &mdash; built and battle-tested, not theoretical.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">02</div>
        <h3 class="ed-topic-item-title">Offensive security &amp; supply chain risk</h3>
        <p>From backdooring Git repositories to cracking financial systems at scale &mdash; talks that make engineering teams audit their own code before the session ends.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">03</div>
        <h3 class="ed-topic-item-title">Security architecture at scale</h3>
        <p>Zero trust isn&rsquo;t a product, it&rsquo;s a discipline. Designing and breaking architectures across cloud-native, distributed, and legacy environments &mdash; from scar tissue, not a slide template.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">04</div>
        <h3 class="ed-topic-item-title">Complex systems &amp; security engineering</h3>
        <p>Security is a complex adaptive system. Drawing on cybernetics, developmental biology, and game theory to think about defense the way nature thinks about resilience.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">05</div>
        <h3 class="ed-topic-item-title">Machine learning in information security</h3>
        <p>A force multiplier for attackers and defenders alike. Applied ML for threat detection, anomaly modeling, adversarial inputs, and the practical limits of what models can and cannot do in production.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">06</div>
        <h3 class="ed-topic-item-title">Distributed systems &amp; information theory</h3>
        <p>The theoretical speed limits of a secure distributed system: multi-terminal information theory, Slepian&ndash;Wolf compression, MAC/BC interference management, and physical-layer network coding.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">07</div>
        <h3 class="ed-topic-item-title">Zero knowledge computing</h3>
        <p>Prove you know something without revealing what you know &mdash; from cryptographic fundamentals to authentication, privacy-preserving computation, and trust minimization in deployment.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">08</div>
        <h3 class="ed-topic-item-title">Computing through the noise: circuit-scalable MPC</h3>
        <p>When the network itself works against you. The Constant-Rate Compiler and interactive coding &mdash; fusing error correction with encryption to hold zero trust over failing, noisy, or jammed channels.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">09</div>
        <h3 class="ed-topic-item-title">The straggler solution: coded MPC for the edge</h3>
        <p>In decentralized IoT, waiting for the slowest node is a death sentence. Private and Rateless Adaptive Coded Computation (PRAC): reliability through polynomial codes without the bloat of redundancy.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">10</div>
        <h3 class="ed-topic-item-title">Beyond the algorithm: unconditional security</h3>
        <p>The shift from &ldquo;hard to break&rdquo; to &ldquo;impossible to observe.&rdquo; Information-theoretic security and GHZ quantum states &mdash; where physics, not complexity, keeps data private.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">11</div>
        <h3 class="ed-topic-item-title">Multi-party computation beyond bit-perfect</h3>
        <p>Computing together without any party learning another&rsquo;s inputs &mdash; even over a broken network. Coded MPC across noisy, adversarial environments that would cripple traditional protocols.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">12</div>
        <h3 class="ed-topic-item-title">Agentic AI &amp; autonomous security operations</h3>
        <p>The MAESTRO and TAME frameworks: governed multi-agent security systems with cognitive light cones, guardian swarms, and bio-inspired collective intelligence &mdash; machine speed without losing human accountability.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">13</div>
        <h3 class="ed-topic-item-title">Self-healing infrastructure &amp; regenerative security</h3>
        <p>Salamanders regrow limbs; your cloud should too. Developmental biology, anatomical homeostasis, and TOTE loops applied to systems that recover without human intervention &mdash; regeneration, not backups.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">14</div>
        <h3 class="ed-topic-item-title">Hardware-rooted identity &amp; ephemeral credentials</h3>
        <p>Shared secrets are a liability. YubiKeys, FROST threshold signatures, Vault, and short-lived certificate chains &mdash; a concrete path from password chaos to phishing-resistant identity, from production deployments.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">15</div>
        <h3 class="ed-topic-item-title">Kubernetes security &amp; cloud-native hardening</h3>
        <p>The full attack surface: Pod security policies, CNI network policy enforcement, scheduler privilege, CI/CD pipeline injection, and secrets management &mdash; with CIS Benchmark-aligned remediations.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">16</div>
        <h3 class="ed-topic-item-title">Threat hunting &amp; advanced incident response</h3>
        <p>Alerts are noise; hunting is signal. macOS and Linux first-responder forensics, APT detection patterns, SIEM failure modes, Loki/Splunk pipelines, and IOC scanning at scale.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">17</div>
        <h3 class="ed-topic-item-title">AI governance, ethics &amp; the worthy successor</h3>
        <p>When an agent decides to contain a threat, who owns the consequences? Governance frameworks, the Petrov Rule for machine judgment, and systems powerful enough to matter and accountable enough to trust.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">18</div>
        <h3 class="ed-topic-item-title">Financial systems security</h3>
        <p>The highest consequences for failure and the most creative adversaries: financial APIs, DPAPI exploitation, cryptographic protocol weaknesses, and the attack surface of modern payment infrastructure.</p>
      </div>

      <div class="ed-topic-item">
        <div class="ed-topic-num">19</div>
        <h3 class="ed-topic-item-title">Bio-inspired defense &amp; morphogenetic security</h3>
        <p>Morphogenetic field theory, bioelectric signaling, and developmental biology applied to network defense &mdash; resilience through goal-directed behavior encoded at the architecture level, not more rules.</p>
      </div>

    </div>
  </section>

  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Engagement information</h2>
    </div>

    <dl class="ed-specs">
      <div class="ed-spec">
        <dt>Formats</dt>
        <dd>Keynote, deep-dive workshop, panel, fireside chat</dd>
      </div>
      <div class="ed-spec">
        <dt>Duration</dt>
        <dd>20-minute lightning &middot; 45-minute main stage &middot; 90-minute workshop</dd>
      </div>
      <div class="ed-spec">
        <dt>Audience fit</dt>
        <dd>Security engineers and architects, CISOs, ML and AI practitioners, cloud and platform engineers, academic and government audiences, financial services</dd>
      </div>
      <div class="ed-spec">
        <dt>A/V</dt>
        <dd>Slide deck (PDF or Keynote), lapel or handheld mic, HDMI output</dd>
      </div>
      <div class="ed-spec">
        <dt>Bio &amp; headshot</dt>
        <dd>Available on request. Full speaker kit provided on booking.</dd>
      </div>
      <div class="ed-spec">
        <dt>Fee</dt>
        <dd>On request. Travel and accommodation arranged by the event organizer.</dd>
      </div>
      <div class="ed-spec">
        <dt>Booking</dt>
        <dd><a href="mailto:{{ site.email | default: 'picklejar@haxx.ninja' }}">{{ site.email | default: 'picklejar@haxx.ninja' }}</a> or via <a href="https://www.linkedin.com/in/w8mej" target="_blank" rel="noopener">LinkedIn</a></dd>
      </div>
    </dl>
  </section>

</div>
