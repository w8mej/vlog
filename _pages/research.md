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
    display: inline-block;
    font-size: 0.75rem;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: #888;
    margin-bottom: 0.75rem;
  }
  .research-page__hero h1 { font-size: 2.5rem; font-weight: 800; margin: 0.25rem 0 0.75rem; }
  .research-page__hero .tagline { font-size: 1.05rem; color: #888; max-width: 650px; margin: 0 auto 1.5rem; }

  /* Grid Layout */
  .projects-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; margin-top: 2rem; }
  @media (max-width: 680px) { .projects-grid { grid-template-columns: 1fr; } }
  
  .project-card {
    border: 1px solid #eee;
    border-radius: 12px;
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
    transition: transform 0.2s, box-shadow 0.2s;
    background: #fff;
  }
  .project-card:hover { transform: translateY(-3px); box-shadow: 0 10px 20px rgba(0,0,0,0.05); }
  
  .project-card__image { 
    height: 60px; 
    margin-bottom: 1.25rem; 
    display: flex;
    align-items: center;
  }
  .project-card__image img { max-height: 100%; width: auto; }
  
  .project-card h3 { font-size: 1.1rem; font-weight: 700; margin: 0 0 0.75rem; color: #111; }
  .project-card p { font-size: 0.92rem; color: #666; line-height: 1.6; margin: 0 0 1.25rem; flex-grow: 1; }
  
  .project-card__link {
    font-size: 0.85rem;
    font-weight: 700;
    color: #3a86ff;
    text-decoration: none;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    display: flex;
    align-items: center;
  }
  .project-card__link:after { content: ' →'; }

  /* Private R&D Section */
  .research-section-title {
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: #888;
    border-bottom: 1px solid #e8e8e8;
    padding-bottom: 0.5rem;
    margin: 4rem 0 1.5rem;
  }
  .private-rd { text-align: center; }
  .private-rd img { 
    width: 250px; 
    border-radius: 12px; 
    filter: grayscale(1); 
    opacity: 0.7; 
    margin-top: 1rem;
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
      <span class="project-card__link" style="color:#aaa;">Commercial Access Only</span>
    </div>

  </div>

  <h2 class="research-section-title">Private R&D</h2>
  <div class="private-rd">
    <p style="color:#888; font-style: italic; font-size: 0.9rem;">Stealth-mode initiatives in systems-inspired defense, autonomous architectures, ZK/MPC, and cryptographic protocol resilience.</p>
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
