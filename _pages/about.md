---
layout: page
title: "About John Menerick"
permalink: /about/
description: "John Menerick is a Security Engineer and complex systems practitioner with 11+ years in information security. Specializing in application security, secure architecture, detection engineering, zero trust, cryptographic engineering, and trusted AI compute."
---

{% include glasswing_styles.html %}
<style>
.page > h1:first-of-type { display: none; }

/* ── Coder profile: language table ── */
.lang-table-wrap { overflow-x: auto; margin: 1.25rem 0; }
.lang-table { width: 100%; border-collapse: collapse; font-size: 12px; }
.lang-table th {
  font-size: 10.5px; font-weight: 600; color: var(--color-text-tertiary, #475569);
  text-align: left; padding: .45rem .75rem;
  background: var(--color-bg-secondary, #1E293B);
  border-bottom: 0.5px solid var(--color-border, rgba(255,255,255,0.08));
  white-space: nowrap;
}
.lang-table td {
  padding: .45rem .75rem;
  border-bottom: 0.5px solid rgba(255,255,255,0.04);
  color: var(--color-text-secondary, #94A3B8);
  vertical-align: middle;
}
.lang-table tr:last-child td { border-bottom: none; }
.lang-table tr:hover td { background: rgba(255,255,255,0.02); }
.lang-name  { font-weight: 600; color: var(--color-text-primary, #F1F5F9); font-size: 13px; }
.lang-score { font-variant-numeric: tabular-nums; color: var(--color-text-secondary); }
.rank-pill  { display: inline-block; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 10px; white-space: nowrap; }
.rank-elite { background: rgba(139,92,246,0.15); color: #C4B5FD; border: 0.5px solid rgba(139,92,246,0.3); }
.rank-top1  { background: rgba(52,211,153,0.12); color: #6EE7B7; border: 0.5px solid rgba(52,211,153,0.25); }
.rank-top5  { background: rgba(96,165,250,0.12); color: #93C5FD; border: 0.5px solid rgba(96,165,250,0.22); }
.rank-top10 { background: rgba(148,163,184,0.10); color: #94A3B8; border: 0.5px solid rgba(148,163,184,0.18); }
.bar-outer  { width: 80px; height: 5px; background: rgba(255,255,255,0.07); border-radius: 3px; display: inline-block; vertical-align: middle; }
.bar-inner  { height: 100%; border-radius: 3px; }
.bar-purple { background: #8B5CF6; }
.bar-teal   { background: #34D399; }
.bar-blue   { background: #60A5FA; }
.bar-slate  { background: #475569; }

/* ── Coder profile: tech chips ── */
.tech-category-label {
  font-size: 10px; font-weight: 700; letter-spacing: .1em; text-transform: uppercase;
  color: var(--color-text-tertiary, #475569);
  display: block; margin: 1.25rem 0 .5rem;
  padding-bottom: .3rem;
  border-bottom: 0.5px solid rgba(255,255,255,0.05);
}
.tech-grid  { display: flex; flex-wrap: wrap; gap: .4rem; }
.tech-chip  { display: inline-flex; align-items: center; gap: .35rem; font-size: 11px; font-weight: 500; padding: .3rem .7rem; border-radius: 20px; border: 0.5px solid; white-space: nowrap; }
.tech-elite { background: rgba(139,92,246,0.12); color: #C4B5FD; border-color: rgba(139,92,246,0.3); }
.tech-top1  { background: rgba(52,211,153,0.10); color: #6EE7B7; border-color: rgba(52,211,153,0.25); }
.tech-top5  { background: rgba(96,165,250,0.10); color: #93C5FD; border-color: rgba(96,165,250,0.2); }
.tech-top10 { background: rgba(251,191,36,0.08); color: #FCD34D; border-color: rgba(251,191,36,0.18); }
.tech-other { background: rgba(148,163,184,0.07); color: #94A3B8; border-color: rgba(148,163,184,0.15); }
.tech-pct   { font-size: 9px; font-weight: 700; opacity: .85; }

/* ── Coder profile: GigaStreak ── */
.streak-feature {
  background: linear-gradient(135deg, rgba(251,191,36,0.08) 0%, rgba(245,158,11,0.04) 100%);
  border: 0.5px solid rgba(251,191,36,0.25);
  border-radius: 12px;
  padding: 1.25rem 1.5rem;
  display: flex; gap: 1.5rem; align-items: center; flex-wrap: wrap;
  margin: 1.25rem 0;
}
.streak-num  { font-size: 52px; font-weight: 800; color: #FBBF24; line-height: 1; font-variant-numeric: tabular-nums; flex-shrink: 0; }
.streak-body { flex: 1; min-width: 180px; }
.streak-body h4 { font-size: 15px; font-weight: 700; color: #F1F5F9; margin: 0 0 .35rem; }
.streak-body p  { font-size: 12px; color: #94A3B8; line-height: 1.6; margin: 0; }

@media (max-width: 600px) {
  .streak-feature { flex-direction: column; gap: .75rem; }
  .streak-num { font-size: 40px; }
}
</style>

<div class="glasswing-wrapper">
<div class="s3-intro-block">

  <div class="s3-series-header">
    <div class="s3-series-badge">
      <span class="s3-badge-dot" aria-hidden="true"></span>
      Security Engineer &middot; Complex Systems Practitioner
    </div>
    <h2 class="s3-series-title-display">John Menerick</h2>
    <p class="s3-series-subtitle-display">11+ years securing Fortune 500 financial institutions, tech companies, startups, and public-sector organizations &mdash; applying complex systems science to build defenses that evolve under pressure.</p>
  </div>

  <p class="s3-lede">Most security programs assume more tools and more operators will keep pace with an ever-expanding attack surface. That assumption is wrong. Defense is a complex adaptive system &mdash; one that senses, responds, and evolves. Drawing on TAME, TOTE feedback loops, and Ashby&rsquo;s Law of Requisite Variety to engineer security architectures that self-correct under pressure, spanning application security, detection engineering, zero trust, cryptographic protocol design, and AI/ML security.</p>

  <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:.5rem;margin:1.5rem 0;">
    <div class="s3-ss"><div class="s3-ss-num">11+</div><div class="s3-ss-sub">Years in information security</div></div>
    <div class="s3-ss"><div class="s3-ss-num">40K+</div><div class="s3-ss-sub">Endpoints secured via zero trust</div></div>
    <div class="s3-ss"><div class="s3-ss-num">78+</div><div class="s3-ss-sub">Engineers mentored</div></div>
    <div class="s3-ss"><div class="s3-ss-num">F500</div><div class="s3-ss-sub">FinTech, tech, and public sector</div></div>
  </div>

</div><!-- /s3-intro-block -->

<hr class="s3-hr">
<span class="s3-section-label">Core Competencies</span>

<div class="theme-grid">
  <div class="theme-card">
    <span class="theme-label theme-red">Application &amp; Product Security</span>
    <h4>Threat modeling, secure code review, supply chain</h4>
    <p>Secure code review, SAST/DAST integration, threat modeling (STRIDE, PASTA, attack trees), secure SDLC design, API security, and supply chain hardening. Built security programs adopted across Fortune 500 SDLC pipelines.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-amber">Detection, Response &amp; Threat Intelligence</span>
    <h4>Detection engineering, SIEM pipelines, forensics</h4>
    <p>Detection engineering end-to-end, SIEM and telemetry pipeline design, IR and forensics, threat hunting, vulnerability management, and red team automation. Reduced MTTD from hours to minutes at a Fortune 500.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-purple">Cryptographic Engineering &amp; Zero Trust</span>
    <h4>MPC, ZK proofs, TEE, PKI, formal verification</h4>
    <p>Zero trust and zero-knowledge architecture, MPC, threshold cryptography, SPIFFE/SPIRE, zk-SNARKs/zk-STARKs, BFT/PBFT, Paxos/Raft consensus security, TEE and confidential compute, side-channel mitigation, and formal verification of distributed protocols.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-teal">AI/ML Security &amp; Trusted Compute</span>
    <h4>LLM security, federated learning, autonomous agents</h4>
    <p>LLM security and prompt injection defense, federated learning security, differential privacy, model poisoning defenses, energy model-driven simulations, autonomous agent security, distributed agent consensus, and verifiable inference in untrusted environments.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-blue">Cloud, Infrastructure &amp; DevSecOps</span>
    <h4>AWS/GCP/OCI, CI/CD hardening, service mesh</h4>
    <p>AWS, GCP, and OCI security architecture, secure CI/CD and IaC hardening, distributed systems security (consistency models, linearizability, causal ordering), container security and service mesh trust, workload orchestration security.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-coral">Complex Systems Science</span>
    <h4>TAME, TOTE, Ashby&rsquo;s Law, adaptive defense modeling</h4>
    <p>Applying TAME framework, TOTE feedback loops, and Ashby&rsquo;s Law of Requisite Variety to security architecture. Models the problem before reaching for a tool &mdash; mapping feedback loops and failure modes before writing a single detection rule.</p>
  </div>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Published Research &amp; Open Source</span>

<div class="arc-grid">
  <div class="arc-card arc-purple">
    <h4>Whitepapers</h4>
    <ul class="arc-list">
      <li><a href="/images/CTOWhitepaper.pdf" target="_blank">From Complex Systems Biology to Agents &mdash; CTO Whitepaper</a></li>
      <li><a href="/images/Agentic_Defense_Biological_Security_for_AI.pdf" target="_blank">Agentic Defense &amp; Complex Systems Security for AI</a></li>
      <li><a href="/2026/01/31/season2-zeronoisecollective/" target="_blank">Agentic SOC Framework &mdash; Season 2 Series</a></li>
    </ul>
  </div>
  <div class="arc-card arc-teal">
    <h4>Open Source</h4>
    <ul class="arc-list">
      <li><a href="https://github.com/w8mej" target="_blank">Gyoithon &mdash; ML-Driven Penetration Testing Framework</a></li>
      <li><a href="https://github.com/w8mej/ThreatPlays" target="_blank">ThreatPlays / IRKnowledge</a></li>
      <li><a href="https://github.com/w8mej/credentials" target="_blank">Credentials &amp; Cryptographic Identities</a></li>
    </ul>
  </div>
  <div class="arc-card arc-red">
    <h4>Live Intelligence Dashboards</h4>
    <ul class="arc-list">
      <li><a href="https://intelmetrics.haxx.ninja" target="_blank">IntelMetrics &mdash; Global Threat Intelligence</a></li>
      <li><a href="https://vulnmetrics.haxx.ninja/" target="_blank">VulnMetrics &mdash; NVD Remediation Metrics</a></li>
      <li><a href="https://keyoxide.org/hkp/sephiroth@haxx.ninja" target="_blank">Keyoxide &mdash; Cryptographic Identity Verification</a></li>
    </ul>
  </div>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Volunteerism &amp; Public Service</span>

<div class="arc-grid" style="margin-bottom:1rem;">
  <div class="arc-card arc-purple">
    <h4>White House, Office of the President</h4>
    <ul class="arc-list">
      <li>Contributor — Executive Order on the Safe, Secure, and Trustworthy Development and Use of Artificial Intelligence</li>
      <li>Contributor — National Strategy for Trusted Identities in Cyberspace (NSTIC)</li>
    </ul>
  </div>
  <div class="arc-card arc-red">
    <h4>DARPA — Defense Advanced Research Projects Agency</h4>
    <ul class="arc-list">
      <li>Cyber Grand Challenge Finalist</li>
      <li>AI Cyber Challenge Participant</li>
    </ul>
  </div>
  <div class="arc-card arc-teal">
    <h4>US Department of Defense</h4>
    <ul class="arc-list">
      <li>Satellite Contributor</li>
      <li>InfraGard — US Critical Infrastructure First Responder</li>
      <li>Alameda County Sheriff&rsquo;s OES Comm. Team — Incident Management</li>
    </ul>
  </div>
</div>

<div class="theme-grid" style="margin-bottom:1rem;">
  <div class="theme-card">
    <span class="theme-label theme-teal">CNCF / Kubernetes</span>
    <h4>Cloud-Native Security Governance</h4>
    <p>CNCF SIG Security member and Kubernetes SIG Security contributor &mdash; working on security standards, threat models, and policy guidance for cloud-native deployments.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-blue">OWASP</span>
    <h4>CFP &amp; CFW Review Board</h4>
    <p>Call-for-Papers and Call-for-Workshop reviewer for OWASP conferences, evaluating security research submissions for technical rigor and practitioner relevance.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-amber">CSA</span>
    <h4>Steering Committee Member</h4>
    <p>Cloud Security Alliance Steering Committee, contributing to cloud security standards, best practice guidance, and enterprise adoption frameworks.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-coral">Conference Presenter &amp; Lecturer</span>
    <h4>DEF CON · ISC2 · CCC · GrrCON · DerbyCon · Skytalks · BSides · RootCon</h4>
    <p>Invited speaker and lecturer at 8+ major information security conferences spanning offensive security research, supply chain attacks, and AI security architecture.</p>
  </div>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Accomplishments</span>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:.75rem;margin:1.25rem 0;">

  <div style="background:linear-gradient(135deg,rgba(139,92,246,0.12) 0%,rgba(59,130,246,0.06) 100%);border:0.5px solid rgba(139,92,246,0.3);border-radius:12px;padding:1.25rem;">
    <span style="font-size:10px;font-weight:700;letter-spacing:.12em;text-transform:uppercase;color:#A78BFA;display:block;margin-bottom:.5rem;">DEF CON Black Badge</span>
    <h4 style="font-size:15px;font-weight:700;color:#F1F5F9;margin:0 0 .5rem;line-height:1.3;">Black Badge Holder</h4>
    <p style="font-size:12px;color:#94A3B8;line-height:1.6;margin:0;">The DEF CON Black Badge is the most prestigious award in competitive hacking — issued only to winners of DEF CON CTF and select elite competitions. Fewer than a few hundred exist worldwide. A lifetime pass to DEF CON and a permanent mark of elite offensive security capability.</p>
  </div>

  <div style="background:linear-gradient(135deg,rgba(248,113,113,0.08) 0%,rgba(251,191,36,0.04) 100%);border:0.5px solid rgba(248,113,113,0.25);border-radius:12px;padding:1.25rem;">
    <span style="font-size:10px;font-weight:700;letter-spacing:.12em;text-transform:uppercase;color:#F87171;display:block;margin-bottom:.5rem;">National Honor</span>
    <h4 style="font-size:15px;font-weight:700;color:#F1F5F9;margin:0 0 .5rem;line-height:1.3;">Tomb of the Unknown Soldier — Wreath Bearer</h4>
    <p style="font-size:12px;color:#94A3B8;line-height:1.6;margin:0;">Selected as a Wreath Bearer at the Tomb of the Unknown Soldier at Arlington National Cemetery — one of the most solemn honors the United States extends to a civilian. Reserved for individuals recognized for distinguished service to the nation.</p>
  </div>

</div>

<div class="arc-grid" style="margin-bottom:.75rem;">
  <div class="arc-card arc-purple">
    <h4>White House, Office of the President</h4>
    <ul class="arc-list">
      <li>Letter of Recognition for Outstanding Achievements and Merit</li>
    </ul>
  </div>
  <div class="arc-card arc-teal">
    <h4>US Congress</h4>
    <ul class="arc-list">
      <li>US Senate &mdash; Resolution of Merit and Accomplishment</li>
      <li>US House of Representatives &mdash; Resolution of Recognition</li>
    </ul>
  </div>
  <div class="arc-card arc-red">
    <h4>Michigan State Senate</h4>
    <ul class="arc-list">
      <li>Resolution of Merit and Accomplishment</li>
    </ul>
  </div>
</div>

<span class="s3-section-label" style="margin-top:1.25rem;">Letters of Commendation</span>
<div class="theme-grid" style="margin-top:.5rem;">
  <div class="theme-card">
    <span class="theme-label theme-blue">US Air Force</span>
    <h4>Letter of Commendation</h4>
    <p>Formal recognition from the United States Air Force for distinguished contributions to national security.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-red">US Marine Corps</span>
    <h4>Letter of Commendation</h4>
    <p>Formal recognition from the United States Marine Corps for distinguished contributions to national security.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-amber">US Army</span>
    <h4>Letter of Commendation</h4>
    <p>Formal recognition from the United States Army for distinguished contributions to national security.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-teal">US Navy</span>
    <h4>Letter of Commendation</h4>
    <p>Formal recognition from the United States Navy for distinguished contributions to national security.</p>
  </div>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Certifications</span>

<div class="tbl-wrap">
  <table>
    <thead>
      <tr>
        <th>Credential</th>
        <th>Issuer</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="2" style="background:rgba(139,92,246,0.08);color:#A78BFA;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;padding:.4rem .75rem;">
          Security Professional
        </td>
      </tr>
      <tr><td class="tbl-name">Certified Information Systems Security Professional (CISSP)</td><td>(ISC)²</td></tr>
      <tr><td class="tbl-name">InfoSec Assessment Methodology (IAM) I / II / III</td><td>NSA</td></tr>
      <tr><td class="tbl-name">InfoSec Evaluation Methodology (IEM) I / II / III</td><td>NSA</td></tr>
      <tr><td class="tbl-name">Certified Kubernetes Security Specialist (CKS)</td><td>CNCF</td></tr>
      <tr><td class="tbl-name">Certified Kubernetes Administrator (CKA)</td><td>CNCF</td></tr>
      <tr><td class="tbl-name">SANS Elite Portfolio (GXPN, GDAT, GX-IA, and others) <em style="color:var(--color-text-tertiary);font-size:11px;">former</em></td><td>SANS Institute</td></tr>

      <tr>
        <td colspan="2" style="background:rgba(52,211,153,0.06);color:#34D399;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;padding:.4rem .75rem;">
          Google Cloud &amp; Infrastructure
        </td>
      </tr>
      <tr><td class="tbl-name">Google Cloud Professional Certification</td><td>Google</td></tr>
      <tr><td class="tbl-name">Professional Google Workspace Administrator</td><td>Google</td></tr>
      <tr><td class="tbl-name">GDC Air-Gapped Security Operator Fundamentals</td><td>Google</td></tr>
      <tr><td class="tbl-name">SecOps on Google Distributed Cloud (GDC) — Tier 1 Analyst</td><td>Google</td></tr>
      <tr><td class="tbl-name">SecOps on Google Distributed Cloud (GDC) — Tier 2 Analyst</td><td>Google</td></tr>
      <tr><td class="tbl-name">SecOps on Google Distributed Cloud (GDC) — Tier 3 Analyst</td><td>Google</td></tr>
      <tr><td class="tbl-name">Evaluate Your Cloud Next-Generation Firewall Needs</td><td>Google</td></tr>

      <tr>
        <td colspan="2" style="background:rgba(96,165,250,0.06);color:#60A5FA;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;padding:.4rem .75rem;">
          Google AI &amp; Machine Learning
        </td>
      </tr>
      <tr><td class="tbl-name">Gemini for Security Engineers</td><td>Google</td></tr>
      <tr><td class="tbl-name">Machine Learning Operations (MLOps) for Generative AI</td><td>Google</td></tr>
      <tr><td class="tbl-name">Vector Search and Embeddings</td><td>Google</td></tr>
      <tr><td class="tbl-name">Transformer Models and BERT</td><td>Google</td></tr>
      <tr><td class="tbl-name">Attention Mechanism</td><td>Google</td></tr>
      <tr><td class="tbl-name">Encoder-Decoder Architecture</td><td>Google</td></tr>
      <tr><td class="tbl-name">Introduction to Generative AI</td><td>Google</td></tr>

      <tr>
        <td colspan="2" style="background:rgba(251,191,36,0.06);color:#FBBF24;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;padding:.4rem .75rem;">
          Google Responsible AI
        </td>
      </tr>
      <tr><td class="tbl-name">Responsible AI for Developers: Privacy &amp; Safety</td><td>Google</td></tr>
      <tr><td class="tbl-name">Responsible AI for Developers: Fairness &amp; Bias</td><td>Google</td></tr>
      <tr><td class="tbl-name">Responsible AI: Applying AI Principles with Google Cloud</td><td>Google</td></tr>
      <tr><td class="tbl-name">Introduction to Responsible AI</td><td>Google</td></tr>

      <tr>
        <td colspan="2" style="background:rgba(248,113,113,0.06);color:#F87171;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;padding:.4rem .75rem;">
          Oracle Cloud Infrastructure
        </td>
      </tr>
      <tr><td class="tbl-name">OCI Foundations Associate</td><td>Oracle</td></tr>
      <tr><td class="tbl-name">OCI AI Foundations Associate</td><td>Oracle</td></tr>
      <tr><td class="tbl-name">OCI Data Management Foundations Associate</td><td>Oracle</td></tr>

      <tr>
        <td colspan="2" style="background:rgba(148,163,184,0.06);color:#94A3B8;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;padding:.4rem .75rem;">
          Government &amp; Federal
        </td>
      </tr>
      <tr><td class="tbl-name">IS-100, IS-200, IS-700, IS-800 — Incident Command System</td><td>US FEMA</td></tr>
      <tr><td class="tbl-name">Public Trust Clearance</td><td>US Department of Justice / FBI</td></tr>

      <tr>
        <td colspan="2" style="background:rgba(52,211,153,0.04);color:#6EE7B7;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;padding:.4rem .75rem;">
          Other Professional
        </td>
      </tr>
      <tr><td class="tbl-name">Certified Scrum Master</td><td>Scrum Alliance</td></tr>
      <tr><td class="tbl-name">Amateur Extra Class License (W8MEJ)</td><td>US FCC</td></tr>
      <tr><td class="tbl-name">General Class &amp; GMRS License</td><td>US FCC</td></tr>
      <tr><td class="tbl-name">LinkedIn Trusted Cryptographic Identity Portfolio</td><td>LinkedIn</td></tr>
    </tbody>
  </table>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Coding Identity &amp; Developer Rankings</span>

<p class="s3-lede" style="margin-bottom:1rem;">Rankings derived from verified repository activity — not self-reported skills — across a career-spanning corpus of open source and professional work. Independently computed by <a href="https://profile.codersrank.io/user/w8mej" target="_blank" style="color:#A78BFA;">CodersRank</a> from 627,824+ active developers worldwide.</p>

<div style="display:grid;grid-template-columns:repeat(4,1fr);gap:.5rem;margin:1rem 0 1.25rem;">
  <div class="s3-ss"><div class="s3-ss-num">#364</div><div class="s3-ss-sub">Global rank of 627,824</div></div>
  <div class="s3-ss"><div class="s3-ss-num">Top 1%</div><div class="s3-ss-sub">Worldwide percentile</div></div>
  <div class="s3-ss"><div class="s3-ss-num">2,751</div><div class="s3-ss-sub">CodersRank score</div></div>
  <div class="s3-ss"><div class="s3-ss-num">13+</div><div class="s3-ss-sub">Ranked languages</div></div>
</div>

<div class="streak-feature">
  <div class="streak-num">579</div>
  <div class="streak-body">
    <h4>GigaStreak &mdash; 579 Consecutive Days of Commits</h4>
    <p>June 29, 2020 &ndash; January 28, 2022. CodersRank awards the GigaStreak badge for unbroken daily commit activity measured in hundreds of days. This streak places it among the longest verified streaks on the platform &mdash; sustained through the pandemic, across security tooling, infrastructure automation, and open source research.</p>
  </div>
</div>

<span class="s3-section-label" style="margin-top:1.25rem;">Language Rankings &mdash; Verified from Repository Activity</span>

<div class="lang-table-wrap">
  <table class="lang-table">
    <thead>
      <tr>
        <th>Language</th>
        <th>Score</th>
        <th>World Rank</th>
        <th>US Rank</th>
        <th>Activity</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><span class="lang-name">TypeScript</span></td>
        <td class="lang-score">743.2</td>
        <td><span class="rank-pill rank-elite">Top 0.2% of 118K</span></td>
        <td><span class="rank-pill rank-top1">Top 1% of 1K</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-purple" style="width:100%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">JavaScript</span></td>
        <td class="lang-score">424.8</td>
        <td><span class="rank-pill rank-elite">Top 0.5% of 279K</span></td>
        <td><span class="rank-pill rank-top5">Top 3% of 2K</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-purple" style="width:83%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">JSON</span></td>
        <td class="lang-score">311.0</td>
        <td><span class="rank-pill rank-elite">Top 0.8% of 283K</span></td>
        <td><span class="rank-pill rank-top5">Top 4% of 2K</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-purple" style="width:70%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">HCL</span></td>
        <td class="lang-score">206.2</td>
        <td><span class="rank-pill rank-elite">Top 0.7% of 8K</span></td>
        <td><span class="rank-pill rank-top5">Top 3% of 70</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-teal" style="width:56%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">Shell</span></td>
        <td class="lang-score">172.9</td>
        <td><span class="rank-pill rank-elite">Top 0.2% of 140K</span></td>
        <td><span class="rank-pill rank-top1">Top 1% of 1K</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-teal" style="width:50%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">SQL</span></td>
        <td class="lang-score">83.7</td>
        <td><span class="rank-pill rank-elite">Top 0.2% of 52K</span></td>
        <td><span class="rank-pill rank-top1">Top 1% of 440</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-teal" style="width:37%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">TSQL</span></td>
        <td class="lang-score">62.9</td>
        <td><span class="rank-pill rank-elite">Top 0.3% of 55K</span></td>
        <td><span class="rank-pill rank-top5">Top 2% of 395</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-teal" style="width:32%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">HTML</span></td>
        <td class="lang-score">144.2</td>
        <td><span class="rank-pill rank-top5">Top 2% of 292K</span></td>
        <td><span class="rank-pill rank-top5">Top 5% of 2K</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-blue" style="width:44%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">CSS / SCSS</span></td>
        <td class="lang-score">120.9 / 101.1</td>
        <td><span class="rank-pill rank-top5">Top 2% of 266K</span></td>
        <td><span class="rank-pill rank-top5">Top 4&ndash;6%</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-blue" style="width:38%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">Python</span></td>
        <td class="lang-score">108.4</td>
        <td><span class="rank-pill rank-top5">Top 5% of 165K</span></td>
        <td><span class="rank-pill rank-top10">Top 9% of 1K</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-blue" style="width:36%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">PHP</span></td>
        <td class="lang-score">116.3</td>
        <td><span class="rank-pill rank-top5">Top 4% of 107K</span></td>
        <td><span class="rank-pill rank-top5">Top 5% of 628</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-blue" style="width:35%"></span></span></td>
      </tr>
      <tr>
        <td><span class="lang-name">PLpgSQL</span></td>
        <td class="lang-score">54.3</td>
        <td><span class="rank-pill rank-top5">Top 2% of 6K</span></td>
        <td><span class="rank-pill rank-top5">Top 2% of 58</span></td>
        <td><span class="bar-outer"><span class="bar-inner bar-slate" style="width:28%"></span></span></td>
      </tr>
    </tbody>
  </table>
</div>

<span class="s3-section-label" style="margin-top:1.25rem;">Technology Rankings</span>

<div style="margin:.75rem 0 1.25rem;">
  <span class="tech-category-label">Node / Frontend &mdash; Elite Rankings</span>
  <div class="tech-grid">
    <span class="tech-chip tech-elite">Socket.io <span class="tech-pct">Top 0.01%</span></span>
    <span class="tech-chip tech-elite">ExpressJS <span class="tech-pct">Top 0.06%</span></span>
    <span class="tech-chip tech-elite">NodeJS <span class="tech-pct">Top 0.4%</span></span>
    <span class="tech-chip tech-top1">ReactJS <span class="tech-pct">Top 2%</span></span>
    <span class="tech-chip tech-top1">Redux Saga <span class="tech-pct">Top 2%</span></span>
    <span class="tech-chip tech-top5">Enzyme <span class="tech-pct">Top 7%</span></span>
    <span class="tech-chip tech-top5">Cypress <span class="tech-pct">Top 6%</span></span>
    <span class="tech-chip tech-top5">Webpack <span class="tech-pct">Top 7%</span></span>
    <span class="tech-chip tech-top5">Chai <span class="tech-pct">Top 14%</span></span>
    <span class="tech-chip tech-top10">Supertest <span class="tech-pct">Top 18%</span></span>
    <span class="tech-chip tech-other">Flask <span class="tech-pct">Top 16%</span></span>
    <span class="tech-chip tech-other">NextJS <span class="tech-pct">Top 59%</span></span>
  </div>
  <span class="tech-category-label">Database &amp; Backend</span>
  <div class="tech-grid">
    <span class="tech-chip tech-top10">node-postgres <span class="tech-pct">Top 8%</span></span>
    <span class="tech-chip tech-other">MySQL <span class="tech-pct">Top 40%</span></span>
    <span class="tech-chip tech-other">Fastify <span class="tech-pct">Top 34%</span></span>
    <span class="tech-chip tech-other">SQLAlchemy <span class="tech-pct">Top 44%</span></span>
    <span class="tech-chip tech-other">mongoose <span class="tech-pct">Top 55%</span></span>
    <span class="tech-chip tech-other">FastAPI <span class="tech-pct">Top 73%</span></span>
    <span class="tech-chip tech-other">PyMongo <span class="tech-pct">Top 52%</span></span>
  </div>
  <span class="tech-category-label">Data Science &amp; ML</span>
  <div class="tech-grid">
    <span class="tech-chip tech-other">Pandas <span class="tech-pct">Top 32%</span></span>
    <span class="tech-chip tech-other">SciPy <span class="tech-pct">Top 33%</span></span>
    <span class="tech-chip tech-other">PySpark <span class="tech-pct">Top 54%</span></span>
    <span class="tech-chip tech-other">Scikit-Learn <span class="tech-pct">Top 64%</span></span>
    <span class="tech-chip tech-other">Sinon <span class="tech-pct">Top 46%</span></span>
    <span class="tech-chip tech-other">Pytest <span class="tech-pct">Top 46%</span></span>
  </div>
</div>

<div class="theme-grid">
  <div class="theme-card">
    <span class="theme-label theme-amber">GigaStreak Badge</span>
    <h4>579 consecutive days of commits</h4>
    <p>Awarded for unbroken daily coding activity spanning June 29, 2020 to January 28, 2022. One of the longest verified streaks on the platform, sustained through active security research and infrastructure engineering.</p>
  </div>
  <div class="theme-card">
    <span class="theme-label theme-purple">VeteranDeveloper Badge</span>
    <h4>5+ years in multiple technologies</h4>
    <p>Awarded for sustained, deep engagement with multiple technologies over multi-year periods — verified from repository history rather than self-reported. Reflects career-spanning commitment to TypeScript, JavaScript, Shell, and security tooling.</p>
  </div>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Work Philosophy</span>

<div class="pullquote">
  <p>Models the problem before reaching for a tool. Maps feedback loops, failure modes, and emergent behavior before writing a single rule.</p>
</div>
<div class="pullquote" style="border-left-color:var(--red-dark, #F87171);">
  <p>Builds what doesn&rsquo;t exist. Built Gyoithon and IntelMetrics when the tooling wasn&rsquo;t there. Ships solutions, not vendor evaluations.</p>
</div>
<div class="pullquote" style="border-left-color:var(--teal-dark, #34D399);">
  <p>Operates at both altitudes. Moves between executive architecture conversations and hands-on code review, packet captures, and IR triage in the same week.</p>
</div>
<div class="pullquote" style="border-left-color:var(--amber-dark, #FBBF24);">
  <p>Teaches by doing. Pairs on active incidents and co-authors detections with junior engineers to build genuine systems thinking, not process compliance.</p>
</div>
<div class="pullquote" style="border-left-color:var(--blue-dark, #60A5FA);">
  <p>Defaults to transparency. Publishes research and open-sources tooling so the community can build on it rather than rediscover it.</p>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Perspective</span>

<div class="s3-infobox">
  <p><strong>How do you apply complex systems theory to security engineering?</strong></p>
  <p>Threat landscapes are nonlinear &mdash; attackers adapt, environments shift, controls interact unpredictably. Ashby&rsquo;s Law of Requisite Variety ensures defensive systems match the adaptive capacity of threats. Practically: detection pipelines with self-tuning feedback loops, architectures where subsystem failure doesn&rsquo;t cascade, and security operations treated as a living system rather than a fixed-state machine.</p>
</div>

<div class="s3-infobox" style="margin-top:.75rem;">
  <p><strong>What&rsquo;s missing from how most organizations approach security engineering today?</strong></p>
  <p>Three things. First, optimizing for compliance over resilience &mdash; while defenders check annual audit boxes, threat actors use AI-driven reconnaissance to compress the attack lifecycle toward near-zero. Second, the velocity gap from underinvestment in automation: without real-time telemetry pipelines and self-healing response workflows, you&rsquo;re bringing a manual process to a machine-speed fight. Third, failure to treat security as a high-concurrency distributed systems problem. Security has to be a set of algorithmic guarantees, not a gate.</p>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Identity</span>

<div class="conflict-box">
  <span class="conflict-label">sts:GetCallerIdentity</span>
  <pre style="font-size:11px;color:var(--color-text-secondary);background:transparent;border:none;margin:.5rem 0 0;padding:0;white-space:pre-wrap;font-family:'SF Mono',Menlo,Monaco,Consolas,monospace;">{
  "id": "ocid1.user.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxx",
  "name": "john.menerick@haxx.ninja",
  "compartmentId": "ocid1.tenancy.oc1..aaaaaaaayyyyyyyyyyyyyyyyyyyyyyyy",
  "timeCreated": "2024-01-25T15:00:00.000Z",
  "lifecycleState": "ACTIVE"
}

{
  "email": "john.menerick@haxx.ninja",
  "sub": "117813812345678901234",
  "name": "John Menerick",
  "iss": "https://accounts.google.com"
}</pre>
  <p style="margin-top:.75rem;font-size:12px;"><a href="https://github.com/w8mej/credentials" target="_blank">Additional credentials for various services and entities →</a></p>
</div>

</div><!-- /glasswing-wrapper -->
