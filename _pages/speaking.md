---
layout: default
title: "Speaking"
description: "John Menerick (Lord_SQL & W8MEJ) speaks at DEF CON, ISC2, Stanford, CCC, ROOTCON, JavaOne, and more — covering adversarial AI, autonomous SOC, offensive security, zero knowledge computing, MPC, systems-inspired defense, cloud-native hardening, and complex systems science."
permalink: /speaking/
---

<style>
  .speaking-page { max-width: 860px; margin: 0 auto; padding: 2rem 1rem 4rem; }
  .speaking-page__hero { text-align: center; margin-bottom: 3rem; }
  .speaking-page__season-label {
    display: inline-block;
    font-size: 0.75rem;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: #888;
    margin-bottom: 0.75rem;
  }
  .speaking-page__hero h1 { font-size: 2.5rem; font-weight: 800; margin: 0.25rem 0 0.75rem; }
  .speaking-page__hero .tagline { font-size: 1.05rem; color: #888; max-width: 600px; margin: 0 auto 1.5rem; }
  .cta-button {
    display: inline-block;
    background: #3a86ff;
    color: #fff !important;
    padding: 0.7rem 1.8rem;
    border-radius: 6px;
    font-weight: 700;
    text-decoration: none;
    letter-spacing: 0.04em;
    transition: background 0.2s;
  }
  .cta-button:hover { background: #2563eb; }

  /* Section headers */
  .speaking-section-title {
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: #888;
    border-bottom: 1px solid #e8e8e8;
    padding-bottom: 0.5rem;
    margin: 2.5rem 0 1.25rem;
  }

  /* Talks table */
  .talks-table { width: 100%; border-collapse: collapse; font-size: 0.93rem; }
  .talks-table th {
    text-align: left;
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: #aaa;
    padding: 0.4rem 0.75rem;
    border-bottom: 2px solid #eee;
  }
  .talks-table td { padding: 0.6rem 0.75rem; border-bottom: 1px solid #f0f0f0; vertical-align: top; }
  .talks-table tr:last-child td { border-bottom: none; }
  .talks-table .year { color: #888; font-size: 0.85rem; white-space: nowrap; }
  .talks-table .conf { font-weight: 600; }
  .talks-table .note { color: #999; font-size: 0.82rem; }
  .talk-link {
    display: inline-block;
    font-size: 0.75rem;
    font-weight: 600;
    padding: 0.15rem 0.5rem;
    border-radius: 3px;
    margin-right: 0.3rem;
    text-decoration: none;
  }
  .talk-link--video { background: #fff0f0; color: #e03131 !important; border: 1px solid #ffc9c9; }
  .talk-link--slides { background: #f0f4ff; color: #3a86ff !important; border: 1px solid #bdd0ff; }
  .talk-link--archive { background: #f4f4f4; color: #555 !important; border: 1px solid #ddd; }
  .talk-link--notrecorded { background: #fafafa; color: #aaa !important; border: 1px solid #e8e8e8; font-style: italic; }

  /* Topics grid */
  .topics-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
  @media (max-width: 580px) { .topics-grid { grid-template-columns: 1fr; } }
  .topic-card {
    border: 1px solid #eee;
    border-radius: 8px;
    padding: 1.1rem 1.25rem;
  }
  .topic-card h3 { font-size: 0.95rem; font-weight: 700; margin: 0 0 0.4rem; }
  .topic-card p { font-size: 0.87rem; color: #666; margin: 0; }

  /* Info panel — full width when single panel */
  .info-panel-full {
    border: 1px solid #eee;
    border-radius: 8px;
    padding: 1.5rem 1.75rem;
  }
  .info-panel-full h3 { font-size: 0.9rem; font-weight: 700; margin: 0 0 0.75rem; text-transform: uppercase; letter-spacing: 0.08em; }
  .info-panel-full ul { margin: 0; padding-left: 1.2rem; columns: 2; column-gap: 2.5rem; }
  @media (max-width: 640px) { .info-panel-full ul { columns: 1; } }
  .info-panel-full li { font-size: 0.88rem; color: #555; margin-bottom: 0.4rem; }
  .info-panel-full a { color: #3a86ff; }

  /* Credential badges */
  .credential-badges { display: flex; flex-wrap: wrap; gap: 0.5rem; margin-top: 0.5rem; }
  .badge {
    display: inline-block;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.06em;
    padding: 0.25rem 0.65rem;
    border-radius: 4px;
    background: #f0f4f8;
    color: #444;
    border: 1px solid #dde4ed;
  }
</style>

<div class="speaking-page">

  <div class="speaking-page__hero">
    <div class="speaking-page__season-label">Available for Engagements</div>
    <img src="/images/circular_headshot.png" alt="John Menerick" width="120" height="120" style="border-radius:50%;margin-bottom:1rem;display:block;margin-left:auto;margin-right:auto;" />
    <h2>John Menerick — Speaker</h2>
    <p class="tagline">Two decades on stage at DEF CON, ISC2, Stanford, CCC, JavaOne, ROOTCON, and dozens more — covering adversarial AI, autonomous SOC architecture, offensive security research, zero knowledge computing, multi-party computation, bio-inspired defense, Kubernetes hardening, hardware-rooted identity, complex systems science, and financial systems security. Every talk is backed by published research, working exploits, and production deployments. If your audience needs to be challenged, not just informed, this is the speaker.</p>
    <a href="mailto:stefan@haxx.ninja" class="cta-button">📩 Book a Speaking Engagement</a>
  </div>

  <!-- PAST TALKS -->
  <h2 class="speaking-section-title">Conference History</h2>
  <table class="talks-table" aria-label="Speaking engagement history">
    <thead>
      <tr>
        <th>Year</th>
        <th>Conference</th>
        <th>Talk</th>
        <th>Links</th>
      </tr>
    </thead>
    <tbody>
      {% for talk in site.data.speaking.talks %}
      <tr>
        <td class="year">{{ talk.year }}</td>
        <td class="conf">
          {{ talk.conference }}
          {% if talk.note %}<br><span class="note">{{ talk.note }}</span>{% endif %}
        </td>
        <td>{{ talk.talk }}</td>
        <td>
          {% if talk.video_url != "" %}
            <a href="{{ talk.video_url }}" class="talk-link talk-link--video" target="_blank" rel="noopener">▶ Video</a>
          {% elsif talk.note contains "not recorded" %}
            <span class="talk-link talk-link--notrecorded">Not recorded</span>
          {% endif %}
          {% if talk.slides_url != "" %}
            <a href="{{ talk.slides_url }}" class="talk-link talk-link--slides" target="_blank" rel="noopener">📄 Slides</a>
          {% endif %}
        </td>
      </tr>
      {% endfor %}
    </tbody>
  </table>

  <!-- TOPICS -->
  <h2 class="speaking-section-title">Talk Topics &amp; Expertise</h2>
  <div class="topics-grid">
    <div class="topic-card">
      <h3>⚡ Adversarial AI &amp; Autonomous SOC</h3>
      <p>What happens when your SOC learns faster than your attackers evolve? John's research covers energy-based detection models, self-healing security architectures, and autonomous response loops — built and battle-tested, not theoretical.</p>
    </div>
    <div class="topic-card">
      <h3>🔓 Offensive Security &amp; Supply Chain Risk</h3>
      <p>From backdooring Git repositories to cracking financial systems at scale, John delivers talks that make engineering teams immediately audit their own code. Uncomfortable, actionable, and technically unimpeachable.</p>
    </div>
    <div class="topic-card">
      <h3>🏗️ Security Architecture at Scale</h3>
      <p>Zero-trust isn't a product — it's a discipline. John has designed and broken security architectures across cloud-native, distributed, and legacy environments. He speaks from the scar tissue, not the slide template.</p>
    </div>
    <div class="topic-card">
      <h3>🧬 Complex Systems &amp; Security Engineering</h3>
      <p>Security is a complex adaptive system. Drawing from cybernetics, developmental biology, and game theory, John challenges audiences to think about defense the way nature thinks about resilience — not brittleness.</p>
    </div>
    <div class="topic-card">
      <h3>🤖 Machine Learning in Information Security</h3>
      <p>Machine learning isn't a magic bullet — it's a force multiplier for attackers and defenders alike. John covers applied ML for threat detection, anomaly modeling, adversarial inputs, and the practical limits of what models can and cannot do in production security environments.</p>
    </div>
    <div class="topic-card">
      <h3>📡 Distributed Systems &amp; Information Theory</h3>
      <p>What are the theoretical speed limits of a secure distributed system? John explores multi-terminal information theory, Slepian-Wolf compression, MAC/BC interference management, and Physical Layer Network Coding to show how understanding the math behind performance boundaries lets you design optimized, decentralized architectures — with compute pushed to the edge where it belongs.</p>
    </div>
    <div class="topic-card">
      <h3>🔐 Zero Knowledge Computing</h3>
      <p>Prove you know something without revealing what you know. John breaks down zero knowledge proofs from the cryptographic fundamentals to real-world applications in authentication, privacy-preserving computation, and trust minimization — bridging theory and deployment for technical and executive audiences alike.</p>
    </div>
 <div class="topic-card">
  <h3>📡 Computing Through the Noise: Circuit-Scalable MPC</h3>
  <p>What if the network itself is working against you? John dives into the Constant-Rate Compiler and interactive-coding—breakthroughs that fuse error correction with encryption. He demonstrates how to maintain a Zero Trust environment even when communication channels are failing, noisy, or under active electronic interference.</p>
</div>

<div class="topic-card">
  <h3>⚡ The Straggler Solution: Coded-MPC for the Edge</h3>
  <p>In decentralized IoT, waiting for the slowest node is a performance death sentence. John introduces Private and Rateless Adaptive Coded Computation (PRAC), a method of "over-provisioning" math through polynomial codes. Discover how to achieve reliability without the bloat of traditional redundancy for massive, unreliable sensor networks.</p>
</div>

<div class="topic-card">
  <h3>🔐 Beyond the Algorithm: Unconditional Security</h3>
  <p>If a quantum computer can break any code, is anything truly secure? John explores the shift from "hard to break" to "impossible to observe." By leveraging Information-Theoretic Security and GHZ quantum states, he maps a future where the laws of physics—not just complex math—ensure your data remains private and untampered.</p>
</div>

<div class="topic-card">
  <h3>🤝 Multi-Party Computation: Beyond Bit-Perfect</h3>
  <p>What if you could compute together without any party learning another's inputs—even over a "broken" network? John explores the frontier of Coded-MPC, leveraging physical limits to achieve unconditional security and zero trust across noisy, adversarial environments that would cripple traditional protocols.</p>
</div>
    <div class="topic-card">
      <h3>🧠 Agentic AI &amp; Autonomous Security Operations</h3>
      <p>What happens when your security operations center stops waiting for human commands and starts thinking for itself? John presents the MAESTRO and TAME frameworks — architectures for governed, multi-agent security systems with cognitive light cones, guardian swarms, and bio-inspired collective intelligence. Built for the SOC that needs to operate at machine speed without losing human accountability.</p>
    </div>
    <div class="topic-card">
      <h3>🦎 Self-Healing Infrastructure &amp; Regenerative Security</h3>
      <p>Salamanders regrow limbs. Your cloud infrastructure should too. John draws from developmental biology, anatomical homeostasis, and TOTE loop theory to design systems that recover from breaches without human intervention — not through redundancy, but through genuine regenerative architecture. If you're still relying on backups, you're thinking about resilience wrong.</p>
    </div>
    <div class="topic-card">
      <h3>🔑 Hardware-Rooted Identity &amp; Ephemeral Credentials</h3>
      <p>shared secrets are a liability. John covers hardware-rooted authentication using YubiKeys, FROST threshold signatures, HashiCorp Vault, and short-lived certificate chains — eliminating standing credentials entirely. Built from production deployments at scale, this talk gives engineering teams a concrete path from password chaos to phishing-resistant, zero-trust identity.</p>
    </div>
    <div class="topic-card">
      <h3>☸️ Kubernetes Security &amp; Cloud-Native Hardening</h3>
      <p>Kubernetes is a force multiplier for attackers who find one misconfiguration. John walks through the full attack surface — Pod security policies, CNI network policy enforcement, scheduler privilege, CI/CD pipeline injection, and secrets management — with concrete CIS Benchmark-aligned remediations. Practical enough for engineering teams, sobering enough for leadership.</p>
    </div>
    <div class="topic-card">
      <h3>🕵️ Threat Hunting &amp; Advanced Incident Response</h3>
      <p>Alerts are noise. Hunting is signal. John covers macOS and Linux first-responder forensics, APT detection patterns, SIEM model failure modes, Loki/Splunk threat hunting pipelines, and IOC scanning at scale — drawn from years of incident response across enterprise and critical infrastructure environments. This is the talk for defenders who are tired of losing.</p>
    </div>
    <div class="topic-card">
      <h3>⚖️ AI Governance, Ethics &amp; the Worthy Successor</h3>
      <p>When an AI agent decides to contain a threat, who is responsible for the consequences? John explores the legal, ethical, and technical dimensions of autonomous decision-making in security contexts — covering AI governance frameworks, the Petrov Rule for machine judgment, and how to build systems that are powerful enough to matter and accountable enough to trust.</p>
    </div>
    <div class="topic-card">
      <h3>💸 Financial Systems Security &amp; Cryptographic Attack Surfaces</h3>
      <p>Financial systems carry the highest consequences for failure — and the most creative adversaries. John's research spans cracking financial APIs, DPAPI exploitation, cryptographic protocol weaknesses, and the attack surface of modern payment infrastructure. This talk has made engineering teams audit their own systems before the session ended.</p>
    </div>
    <div class="topic-card">
      <h3>🌱 Bio-Inspired Defense &amp; Morphogenetic Security</h3>
      <p>What if your security architecture could grow, adapt, and respond to threats the way a developing organism responds to injury? John applies morphogenetic field theory, bioelectric signaling models, and developmental biology to network defense — arguing that the future of resilient security isn't more rules or more alerts, but systems with genuine goal-directed behavior encoded at the architecture level.</p>
    </div>
  </div>

  <h2 class="speaking-section-title">Engagement Information</h2>

  <div class="info-panel-full">
    <h3>Book a Speaking Engagement</h3>
    <ul>
      <li><strong>Formats:</strong> Keynote, deep-dive workshop, panel, fireside chat</li>
      <li><strong>Duration:</strong> 20 min lightning · 45 min main stage · 90 min workshop</li>
      <li><strong>Audience fit:</strong> Security engineers &amp; architects, CISOs, ML &amp; AI practitioners, cloud &amp; platform engineers, academic &amp; government audiences, financial services — across all 16 topic areas above</li>
      <li><strong>A/V:</strong> Slide deck (PDF/Keynote), lapel or handheld mic, HDMI output</li>
      <li><strong>Bio &amp; headshot:</strong> Available on request. Full speaker kit provided upon booking.</li>
      <li><strong>Fee:</strong> Available on request. Travel and accommodations to be arranged by event organizer.</li>
      <li><strong>Book:</strong> <a href="mailto:stefan@haxx.ninja">stefan@haxx.ninja</a> — or reach out via <a href="https://www.linkedin.com/in/w8mej" target="_blank" rel="noopener">LinkedIn</a></li>
    </ul>
  </div>

</div>
