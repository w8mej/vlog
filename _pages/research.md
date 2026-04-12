---
layout: default
title: Publicly available research efforts
permalink: /research/
description: "Explore John Menerick's public security research, including threat intelligence metrics, vulnerability databases, and Gyoithon - AI-driven penetration testing."
---

<style>
  .research-page { max-width: 860px; margin: 0 auto; padding: 2rem 1rem 4rem; }
  .research-page__hero { text-align: center; margin-bottom: 3rem; }
  .research-page__season-label {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: var(--post-meta-color);
    margin-bottom: 0.75rem;
  }
  .research-page__season-label::before {
    content: '';
    display: inline-block;
    width: 7px; height: 7px;
    border-radius: 50%;
    background: var(--accent-primary);
    box-shadow: 0 0 8px var(--glow-purple);
  }
  .research-page__hero h1 {
    font-family: Georgia, 'Times New Roman', serif;
    font-size: clamp(1.8rem, 4vw, 2.5rem);
    font-weight: 800;
    letter-spacing: -0.02em;
    margin: 0.25rem 0 0.75rem;
    color: var(--heading-color);
  }
  .research-page__hero .tagline {
    font-size: 1rem;
    font-style: italic;
    color: var(--post-meta-color);
    max-width: 650px;
    margin: 0 auto 1.5rem;
    line-height: 1.65;
  }

  /* Grid Layout */
  .projects-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1.25rem; margin-top: 2rem; }
  @media (max-width: 680px) { .projects-grid { grid-template-columns: 1fr; } }

  .project-card {
    background: var(--bg-secondary);
    border: 1px solid var(--border-color);
    border-radius: 14px;
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
    transition: transform 220ms ease, box-shadow 220ms ease, border-color 220ms ease;
    position: relative;
    overflow: hidden;
  }
  .project-card::before {
    content: '';
    position: absolute;
    top: -60px; right: -60px;
    width: 180px; height: 180px;
    background: radial-gradient(circle, var(--glow-purple) 0%, transparent 70%);
    pointer-events: none;
    opacity: 0;
    transition: opacity 300ms ease;
  }
  .project-card:hover { transform: translateY(-3px); box-shadow: 0 10px 32px var(--glow-purple); border-color: var(--accent-primary); }
  .project-card:hover::before { opacity: 1; }

  .project-card__image {
    height: 52px;
    margin-bottom: 1.1rem;
    display: flex;
    align-items: center;
  }
  .project-card__image img { max-height: 100%; width: auto; }

  .project-card h3 {
    font-size: 1rem;
    font-weight: 700;
    margin: 0 0 0.6rem;
    color: var(--heading-color);
    line-height: 1.3;
  }
  .project-card p {
    font-size: 0.88rem;
    color: var(--post-meta-color);
    line-height: 1.65;
    margin: 0 0 1.25rem;
    flex-grow: 1;
  }

  .project-card__link {
    font-size: 0.8rem;
    font-weight: 700;
    color: var(--accent-primary);
    text-decoration: none;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    display: inline-flex;
    align-items: center;
    gap: 4px;
    border-bottom: 1px solid rgba(139,92,246,0.3);
    padding-bottom: 1px;
    width: fit-content;
    transition: border-color 150ms ease;
  }
  .project-card__link:after { content: ' →'; }
  .project-card__link:hover { border-color: var(--accent-primary); }

  /* Private R&D Section */
  .research-section-title {
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: var(--post-meta-color);
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 0.5rem;
    margin: 4rem 0 1.5rem;
  }
  .private-rd { text-align: center; }
  .private-rd p { color: var(--post-meta-color) !important; }
  .private-rd img {
    width: 250px;
    border-radius: 12px;
    filter: grayscale(1);
    opacity: 0.55;
    margin-top: 1rem;
    border: 1px solid var(--border-color);
  }
</style>

<div class="research-page">

  <div class="research-page__hero">
    <div class="research-page__season-label">Open Source & Public Labs</div>
    <h1>Public Research Efforts</h1>
    <p class="tagline">Data-driven security initiatives focused on global threat signaling, vulnerability prioritization, and machine-learning driven offensive automation.</p>
  </div>

  <div class="projects-grid">
    
    <!-- Threat Intelligence Metrics -->
    <div class="project-card">
      <div class="project-card__image">
        <img src="/images/threatintellogo.png.avif" alt="Threat Intelligence Metrics">
      </div>
      <h3>Threat Intelligence Metrics</h3>
      <p>Continuous ingestion and analysis of global threat feeds to generate high-fidelity metrics and attribution insights. Mapping the shift from raw signal to actionable defensive signal.</p>
      <a href="https://intelmetrics.haxx.ninja" class="project-card__link" target="_blank">Explore Metrics</a>
    </div>

    <!-- VulnMetrics -->
    <div class="project-card">
      <div class="project-card__image">
        <img src="/images/nvd.png.avif" alt="Vulnerability Metrics">
      </div>
      <h3>Vulnerability & Remediation</h3>
      <p>Automated parsing and prioritization of the US DHS National Vulnerability Database (NVD). Focused on identifying remediation efficiency and the delta between disclosure and patch saturation.</p>
      <a href="https://vulnmetrics.haxx.ninja/" class="project-card__link" target="_blank">View Vuln Data</a>
    </div>

    <!-- SecDevOps -->
    <div class="project-card">
      <div class="project-card__image" style="background:transparent;">
         <img src="/images/1580877.png.avif" alt="Gauntlt Attacks" style="height:40px;">
      </div>
      <h3>Rugged SecDevOps Testing</h3>
      <p>Hardening the software lifecycle through automated attack simulation. A curated library of adapters and testing plans designed to "be mean to your code" before production deployment.</p>
      <a href="https://gauntltattacks.haxx.ninja" class="project-card__link" target="_blank">View Test Plans</a>
    </div>

    <!-- Gyoithon -->
    <div class="project-card">
      <div class="project-card__image">
        <img src="/images/gyoithon_logo.png.avif" alt="Gyoithon AI">
      </div>
      <h3>Gyoithon: AI-Driven PenTesting</h3>
      <p>A machine-learning framework designed to pass the Hacker Turing Test. Leveraging genetic algorithms and deep neural networks to automate complex offensive security workflows with human-like precision.</p>
      <span class="project-card__link" style="opacity:0.45; cursor:default; border-bottom-color:transparent;">Commercial Access Only</span>
    </div>

  </div>

  <h2 class="research-section-title">Vulnerability Disclosures & Presentations</h2>
  
  <div class="projects-grid">
    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">DEFCON</div>
      <h3>Open Source Fairy Dust</h3>
      <p>Presented research revealing flaws in internet infrastructure architecture and their economic and national security impacts.</p>
      <a href="https://www.youtube.com/watch?v=OnJ18pyMncE" class="project-card__link" target="_blank">View Presentation</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">DEFCON</div>
      <h3>Backdooring Git & Version Control</h3>
      <p>Explored cryptographic weaknesses and supply chain attacks via Git internals, demonstrating how code breaches jeopardize development pipelines.</p>
      <a href="https://www.youtube.com/watch?v=lXf9nlTmnK4" class="project-card__link" target="_blank">View Presentation</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">37signals</div>
      <h3>Basecamp Infrastructure Analysis</h3>
      <p>Discovered and responsibly disclosed critical vulnerabilities within Basecamp and 37signals infrastructure.</p>
      <a href="https://37signals.com/policies/security/response/" class="project-card__link" target="_blank">View Disclosure</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Apache Foundation</div>
      <h3>Apache Solr & Jetty Vulnerability</h3>
      <p>Identified a critical vulnerability (SOLR-4861) affecting Apache Jetty and Solr, coordinating a secure resolution with the Apache Foundation.</p>
      <a href="https://issues.apache.org/jira/browse/SOLR-4861" class="project-card__link" target="_blank">View Advisory</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Security Onion</div>
      <h3>Security Onion CapMe Vulnerability</h3>
      <p>Uncovered vulnerabilities within the Security Onion CapMe interface, ensuring they were patched before adversaries could leverage them.</p>
      <a href="https://blog.securityonion.net/2016/02/securityonion-capme-20121213_10.html" class="project-card__link" target="_blank">View Advisory</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Scalr</div>
      <h3>Scalr Infrastructure SQLi</h3>
      <p>Discovered SQL injection and input validation vulnerabilities within the Scalr cloud management platform.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/5/26/scalr-sqli-and-poor-validation" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Threat Research</div>
      <h3>Pandora DDoS Botnet Nullification</h3>
      <p>Investigated the command-and-control infrastructure of the Pandora botnet, revealing vulnerabilities to dismantle its operations.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/5/2/pandora-ddos-botnet-0days" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Publication</div>
      <h3>IS Administration & Architecture</h3>
      <p>Technical Editor for "Organizational, Legal, and Technological Dimensions of IS Admin," a reference work bridging IT system administration with legal considerations.</p>
      <a href="https://www.amazon.com/Organizational-Technological-Dimensions-Information-Administration/dp/1466645261" class="project-card__link" target="_blank">View Publication</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">LDAP Toolbox</div>
      <h3>LDAP Tool Box XSS</h3>
      <p>Identified Cross-Site Scripting vulnerabilities within the LDAP Tool Box self-service password application.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2014/3/6/ldap-tool-box-vulnerabilities" class="project-card__link" target="_blank">View Advisory</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Block (Square)</div>
      <h3>Keywhiz Secret Management</h3>
      <p>Identified vulnerabilities within Block's Keywhiz secret management system regarding secret sanitation and handling.</p>
      <a href="https://github.com/square/keywhiz/pull/50" class="project-card__link" target="_blank">View Pull Request</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">jQuery</div>
      <h3>jQuery Core XSS Vulnerability</h3>
      <p>Discovered a widespread Cross-Site Scripting vulnerability within the core jQuery library (Ticket #12254), impacting millions of deployments.</p>
      <a href="https://bugs.jquery.com/ticket/12254/" class="project-card__link" target="_blank">View Bug Report</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Hack The Box</div>
      <h3>Hack The Box Elite Hacker</h3>
      <p>Reached the rank of Elite Hacker in competitive exploitation across Solaris, FreeBSD, Linux, and Windows environments.</p>
      <a href="https://app.hackthebox.com/profile/6891" class="project-card__link" target="_blank">View Profile</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">RFC Research</div>
      <h3>HTTP Cookie DoS Vulnerabilities</h3>
      <p>Analyzed anomalies in HTTP and Cookie RFC implementations to uncover novel Denial-of-Service attack vectors.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/4/11/nifty-cookie-dos-hacks" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Google</div>
      <h3>Google Translate Sandbox Breakout</h3>
      <p>Identified critical vulnerabilities allowing a sandbox breakout within Google Translate’s infrastructure.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/7/30/google-translate-vulnerability-and-exploit" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Google</div>
      <h3>Google Glass & AR/VR 0-days</h3>
      <p>Explored deep attack surfaces in Google Glass and early AR/VR hardware, disclosing DoS and XSS vulnerabilities to the Glass team.</p>
      <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
        <a href="https://securesql.info/vulnerabilitiesexploits/2013/5/2/google-glass-developer-program-dos-and-xss" class="project-card__link" target="_blank">View Demo</a>
        <a href="https://github.com/googleglass/mirror-quickstart-java/commit/738352eb5b5b73aa7bb911d0aeee3386f40dbf26" class="project-card__link" target="_blank">View Source Patch</a>
      </div>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Threat Research</div>
      <h3>Malicious Mobile Power Stations</h3>
      <p>Demonstrated novel attack vectors exploiting public USB charging stations to compromise smartphones via hidden hardware.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/5/7/2q35is1o62y86fqqo84es5efzygur4" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Threat Research</div>
      <h3>Firesale Botnet Analysis</h3>
      <p>Conducted a comprehensive evaluation of the Firesale botnet panel to uncover exploitable flaws in the threat actor's infrastructure.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/5/2/firesale-webpanel-botnet-0days" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Cloud9</div>
      <h3>Cloud9 IDE Remote Code Execution</h3>
      <p>Discovered unpatched XSS and potential Remote Code Execution vulnerabilities within the Cloud9 online development environment.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/6/4/unpatched-cloud9-xss-and-potential-remote-code-execution-vulnerability" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Threat Research</div>
      <h3>Carberp Botnet Cryptography</h3>
      <p>Reverse-engineered the Carberp banking trojan, discovering critical vulnerabilities and broken cryptographic implementations in the C2.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/6/25/carberp-vulnerabilities-overview-and-poor-cryptography" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Wikipedia Foundation</div>
      <h3>Wikipedia Core XSS</h3>
      <p>Analyzed MediaWiki infrastructure and disclosed a Cross-Site Scripting vulnerability (CVE-2015-6729).</p>
      <a href="https://nvd.nist.gov/vuln/detail/CVE-2015-6729" class="project-card__link" target="_blank">View CVE</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">CNN</div>
      <h3>CNN Digital Infrastructure XSS</h3>
      <p>Brought critical Cross-Site Scripting vulnerabilities in CNN's digital infrastructure to light for prompt resolution.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/5/3/cnncom-xss-vulnerabilities" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">BSIMM</div>
      <h3>Building Security In Maturity Model</h3>
      <p>Contributed to the BSIMM program, building and improving software security maturity benchmarks for enterprise organizations.</p>
      <a href="https://www.synopsys.com/software-integrity/software-security-services/bsimm-maturity-model.html" class="project-card__link" target="_blank">View BSIMM</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">ISC2</div>
      <h3>ISC2 Bug Bounty & External Scrutiny</h3>
      <p>Presented on the strategic importance of external scrutiny and bug bounty programs to enhance institutional security postures.</p>
      <a href="https://isc2chapter-westmi.org/page/6/" class="project-card__link" target="_blank">View Presentation</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Threat Research</div>
      <h3>Black Energy Botnet Neutralization</h3>
      <p>Analyzed the Black Energy botnet C2 infrastructure to identify exploitable vulnerabilities and safely neutralize the threat.</p>
      <a href="https://securesql.info/vulnerabilitiesexploits/2013/5/2/blackenergy-botnet-0days" class="project-card__link" target="_blank">Read Research</a>
    </div>

    <div class="project-card">
      <div style="font-size: 0.65rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--accent-primary); margin-bottom: 0.5rem;">Apache Foundation</div>
      <h3>Apache Batik DoS Vulnerability</h3>
      <p>Discovered a Denial-of-Service vulnerability (BATIK-1023) within the Apache Batik SVG toolkit, enabling rapid mitigation.</p>
      <a href="https://issues.apache.org/jira/browse/BATIK-1023" class="project-card__link" target="_blank">View Advisory</a>
    </div>
  </div>

  <h2 class="research-section-title">Private R&D</h2>
  <div class="private-rd">
    <p style="font-style: italic; font-size: 0.9rem;">Stealth-mode initiatives in systems-inspired defense, autonomous architectures, ZK/MPC, and cryptographic protocol resilience.</p>
    <img src="/images/redacted.webp" alt="REDACTED RESEARCH">
  </div>

</div>

<!--
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "SoftwareApplication",
      "name": "Gyoithon",
      "applicationCategory": "SecurityApplication",
      "operatingSystem": "Linux, macOS, Windows",
      "description": "Gyoithon uses machine learning and deep networking for intelligent penetration testing automation, passing the Hacker Turing Test."
    },
    {
      "@type": "SoftwareApplication",
      "name": "IntelMetrics",
      "applicationCategory": "SecurityApplication",
      "url": "https://intelmetrics.haxx.ninja",
      "description": "Daily queries of threat intelligence platforms to generate metrics and related attribution insights."
    },
    {
      "@type": "SoftwareApplication",
      "name": "VulnMetrics",
      "applicationCategory": "SecurityApplication",
      "url": "https://vulnmetrics.haxx.ninja/",
      "description": "Daily parsing of the US DHS National Vulnerability Database to generate vulnerability and remediation metrics."
    }
  ]
}
</script>
-->
