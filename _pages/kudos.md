---
layout: page
title: "Credentials & Endorsements"
permalink: /kudos/
description: "Verified certifications, competitive security rankings, and independently assessed technical skills — John Menerick, Security Engineer."
---

{% include glasswing_styles.html %}
<style>
.page > h1:first-of-type { display: none; }

.cred-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: .75rem;
  margin: 1.25rem 0;
}
.cred-card {
  background: var(--color-bg, #0F172A);
  border: 0.5px solid var(--color-border, rgba(255,255,255,0.08));
  border-radius: 12px;
  padding: 1.25rem;
  display: flex;
  flex-direction: column;
  gap: .75rem;
}
.cred-card:hover {
  border-color: rgba(139,92,246,0.3);
  background: var(--color-bg-secondary, #1E293B);
}
.cred-badge-wrap {
  display: flex;
  align-items: center;
  gap: 1rem;
}
.cred-badge-img {
  width: 72px;
  height: 72px;
  object-fit: contain;
  flex-shrink: 0;
  border-radius: 8px;
}
.cred-badge-text { flex: 1; }
.cred-issuer {
  font-size: 10px;
  font-weight: 600;
  letter-spacing: .1em;
  text-transform: uppercase;
  color: var(--color-text-tertiary, #475569);
  margin-bottom: .2rem;
}
.cred-name {
  font-size: 14px;
  font-weight: 600;
  color: var(--color-text-primary, #F1F5F9);
  line-height: 1.3;
}
.cred-desc {
  font-size: 12px;
  line-height: 1.6;
  color: var(--color-text-secondary, #94A3B8);
  margin: 0;
}
.cred-verify {
  display: inline-flex;
  align-items: center;
  gap: .35rem;
  font-size: 11px;
  font-weight: 600;
  color: #A78BFA;
  text-decoration: none;
  letter-spacing: .02em;
  margin-top: auto;
  padding-top: .5rem;
  border-top: 0.5px solid var(--color-border, rgba(255,255,255,0.06));
}
.cred-verify:hover { color: #C4B5FD; }
.cred-verify::after { content: " →"; }

.htb-feature {
  background: linear-gradient(135deg, rgba(16,185,129,0.06) 0%, rgba(6,78,59,0.04) 100%);
  border: 0.5px solid rgba(16,185,129,0.18);
  border-radius: 12px;
  padding: 1.5rem;
  margin: 1.25rem 0;
}
.htb-rank-row {
  display: flex;
  gap: 1.5rem;
  margin: 1rem 0;
  flex-wrap: wrap;
}
.htb-rank {
  text-align: center;
}
.htb-rank-num {
  font-size: 36px;
  font-weight: 700;
  color: #34D399;
  line-height: 1;
  font-variant-numeric: tabular-nums;
}
.htb-rank-label {
  font-size: 11px;
  color: #6EE7B7;
  margin-top: .25rem;
  font-weight: 500;
}

.assess-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: .75rem;
  margin: 1.25rem 0;
}
.assess-card {
  background: var(--color-bg-secondary, #1E293B);
  border: 0.5px solid var(--color-border, rgba(255,255,255,0.06));
  border-radius: 10px;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  gap: .5rem;
}
.assess-platform {
  font-size: 10px;
  font-weight: 600;
  letter-spacing: .1em;
  text-transform: uppercase;
  color: var(--color-text-tertiary, #475569);
}
.assess-skill {
  font-size: 13px;
  font-weight: 600;
  color: var(--color-text-primary, #F1F5F9);
}
.assess-badge {
  font-size: 10px;
  padding: 2px 8px;
  border-radius: 10px;
  background: rgba(52,211,153,0.1);
  color: #34D399;
  border: 0.5px solid rgba(52,211,153,0.2);
  width: fit-content;
}
.assess-link {
  font-size: 11px;
  font-weight: 600;
  color: #60A5FA;
  text-decoration: none;
  margin-top: auto;
}
.assess-link:hover { color: #93C5FD; }

.screenshot-proof {
  width: 100%;
  border-radius: 8px;
  border: 0.5px solid var(--color-border, rgba(255,255,255,0.08));
  margin: .75rem 0;
  display: block;
}

.cv-cta {
  background: linear-gradient(135deg, rgba(139,92,246,0.1) 0%, rgba(59,130,246,0.06) 100%);
  border: 0.5px solid rgba(139,92,246,0.25);
  border-radius: 12px;
  padding: 1.5rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  flex-wrap: wrap;
  margin: 1.25rem 0;
}
.cv-cta-text h4 { font-size: 15px; font-weight: 600; color: #F1F5F9; margin: 0 0 .25rem; }
.cv-cta-text p  { font-size: 12px; color: #94A3B8; margin: 0; }
.cv-cta-btn {
  display: inline-flex;
  align-items: center;
  gap: .4rem;
  background: rgba(139,92,246,0.18);
  border: 0.5px solid rgba(139,92,246,0.4);
  color: #C4B5FD;
  font-size: 12px;
  font-weight: 600;
  padding: .5rem 1rem;
  border-radius: 6px;
  text-decoration: none;
  white-space: nowrap;
  letter-spacing: .02em;
}
.cv-cta-btn:hover { background: rgba(139,92,246,0.28); color: #DDD6FE; }

@media (max-width: 640px) {
  .cred-grid, .assess-grid { grid-template-columns: 1fr; }
  .htb-rank-row { gap: 1rem; }
}
</style>

<div class="glasswing-wrapper">
<div class="s3-intro-block">

  <div class="s3-series-header">
    <div class="s3-series-badge">
      <span class="s3-badge-dot" aria-hidden="true"></span>
      Independently Verified &middot; Third-Party Assessed
    </div>
    <h2 class="s3-series-title-display">Credentials &amp; Proof of Work</h2>
    <p class="s3-series-subtitle-display">Professional certifications, competitive security rankings, and technical skill assessments &mdash; each independently verified and linkable for due diligence.</p>
  </div>

  <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:.5rem;margin:1.5rem 0;">
    <div class="s3-ss"><div class="s3-ss-num">CISSP</div><div class="s3-ss-sub">ISC² Gold Standard</div></div>
    <div class="s3-ss"><div class="s3-ss-num">#602</div><div class="s3-ss-sub">HackTheBox global rank</div></div>
    <div class="s3-ss"><div class="s3-ss-num">GCP</div><div class="s3-ss-sub">Google Cloud Professional</div></div>
    <div class="s3-ss"><div class="s3-ss-num">10+</div><div class="s3-ss-sub">LinkedIn skill assessments</div></div>
  </div>

</div><!-- /s3-intro-block -->

<div class="cv-cta">
  <div class="cv-cta-text">
    <h4>Full Curriculum Vitae</h4>
    <p>Complete work history, project details, publications, and speaking engagements.</p>
  </div>
  <a href="https://cv.securesql.info/" target="_blank" class="cv-cta-btn">View CV</a>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Professional Certifications</span>

<div class="cred-grid">

  <div class="cred-card">
    <div class="cred-badge-wrap">
      <img src="/images/certified-information-systems-security-professional-cissp.png.avif"
           alt="CISSP Badge"
           width="72" height="72"
           class="cred-badge-img"
           loading="lazy">
      <div class="cred-badge-text">
        <div class="cred-issuer">ISC²</div>
        <div class="cred-name">Certified Information Systems Security Professional (CISSP)</div>
      </div>
    </div>
    <p class="cred-desc">The CISSP is the most globally recognized certification in information security. It validates expertise across 8 domains including security architecture, risk management, cryptography, and software security. Held by fewer than 160,000 professionals worldwide.</p>
    <a href="https://www.credly.com/badges/74c8e3e1-c951-4651-a905-adf5e2898186/public_url" target="_blank" class="cred-verify">Verify on Credly</a>
  </div>

  <div class="cred-card">
    <div class="cred-badge-wrap">
      <div class="cred-badge-text">
        <div class="cred-issuer">Google Cloud</div>
        <div class="cred-name">Google Cloud Professional Certification</div>
      </div>
    </div>
    <img src="/images/GCP.png.avif"
         alt="Google Cloud Professional certification profile"
         width="326" height="200"
         class="screenshot-proof"
         loading="lazy"
         style="height:160px;object-fit:cover;object-position:top;">
    <p class="cred-desc">Professional-level GCP certification demonstrating hands-on expertise in Google Cloud architecture, security controls, and enterprise deployments.</p>
    <a href="https://www.cloudskillsboost.google/public_profiles/335017d3-fb65-41f9-ad58-4e4668f5e783" target="_blank" class="cred-verify">View GCP Profile</a>
  </div>

</div>

<hr class="s3-hr">
<span class="s3-section-label">Competitive Security Rankings</span>

<div class="htb-feature">
  <span class="section-label" style="font-size:10px;font-weight:600;letter-spacing:.1em;text-transform:uppercase;color:#6EE7B7;display:block;margin-bottom:.5rem;">HackTheBox &mdash; Real-World Offensive Security</span>
  <h3 style="color:#34D399;margin:0 0 .5rem;font-size:16px;">Solo Ranked #602 in the World &middot; Team Rank #41</h3>
  <p style="font-size:13px;color:#94A3B8;margin-bottom:1rem;">HackTheBox is the industry benchmark for practical offensive security skill. Rankings are earned by solving active machines and challenges under real-world conditions &mdash; no study guides, no multiple choice. A global solo rank of #602 places me in the top 0.1% of the platform&rsquo;s active player base.</p>
  <div class="htb-rank-row">
    <div class="htb-rank">
      <div class="htb-rank-num">#602</div>
      <div class="htb-rank-label">Global Solo Rank</div>
    </div>
    <div class="htb-rank">
      <div class="htb-rank-num">#41</div>
      <div class="htb-rank-label">Team Rank</div>
    </div>
    <div class="htb-rank">
      <div class="htb-rank-num">Top 0.1%</div>
      <div class="htb-rank-label">Percentile</div>
    </div>
  </div>
  <img src="/images/HackTheBox.png.avif"
       alt="HackTheBox profile showing global rank #602"
       width="895" height="681"
       class="screenshot-proof"
       loading="lazy">
  <a href="https://app.hackthebox.com/profile/6891" target="_blank" class="cred-verify" style="color:#34D399;border-top-color:rgba(52,211,153,0.15);">View HTB Profile</a>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Technical Skill Assessments</span>

<div class="assess-grid">

  <div class="assess-card">
    <div class="assess-platform">HackerRank</div>
    <div class="assess-skill">Java (Basic)</div>
    <div class="assess-badge">Certified</div>
    <img src="/images/HackerRankJavaBasic.png.avif"
         alt="HackerRank Java Basic certificate"
         width="815" height="608"
         class="screenshot-proof"
         loading="lazy"
         style="margin:.5rem 0;">
    <p style="font-size:11px;color:var(--color-text-secondary);margin:0;">Standardized assessment of Java fundamentals covering data structures, OOP, and language idioms.</p>
    <a href="https://www.hackerrank.com/certificates/bea0e59a6a42" target="_blank" class="assess-link">Verify Certificate</a>
  </div>

  <div class="assess-card">
    <div class="assess-platform">HackerRank</div>
    <div class="assess-skill">Python (Basic)</div>
    <div class="assess-badge">Certified</div>
    <img src="/images/HackerRankPythonBasic.png.avif"
         alt="HackerRank Python Basic certificate"
         width="814" height="614"
         class="screenshot-proof"
         loading="lazy"
         style="margin:.5rem 0;">
    <p style="font-size:11px;color:var(--color-text-secondary);margin:0;">Standardized assessment of Python fundamentals covering data manipulation, functions, and standard library usage.</p>
    <a href="https://www.hackerrank.com/certificates/4551ad5e1696" target="_blank" class="assess-link">Verify Certificate</a>
  </div>

  <div class="assess-card">
    <div class="assess-platform">LinkedIn</div>
    <div class="assess-skill">Skill Assessments</div>
    <div class="assess-badge" style="background:rgba(59,130,246,0.1);color:#60A5FA;border-color:rgba(59,130,246,0.2);">10+ Passed</div>
    <img src="/images/LinkedinAssessments.png.avif"
         alt="LinkedIn skill assessment badges"
         width="543" height="400"
         class="screenshot-proof"
         loading="lazy"
         style="margin:.5rem 0;height:160px;object-fit:cover;object-position:top;">
    <p style="font-size:11px;color:var(--color-text-secondary);margin:0;">LinkedIn&rsquo;s proctored skill assessments across cloud, security, and software engineering domains.</p>
    <a href="https://www.linkedin.com/in/w8mej/" target="_blank" class="assess-link">View LinkedIn Profile</a>
  </div>

</div>

<hr class="s3-hr">
<span class="s3-section-label">Market Assessments</span>

<div class="cred-card" style="flex-direction:row;align-items:center;gap:1.25rem;flex-wrap:wrap;">
  <div style="flex:1;min-width:220px;">
    <div class="cred-issuer">Hired.com</div>
    <div class="cred-name" style="margin-bottom:.4rem;">Hired.com Technical Assessments</div>
    <p class="cred-desc" style="margin:0;">Third-party market assessments evaluating technical depth and seniority against the broader engineering talent pool.</p>
  </div>
  <img src="/images/Hired.png.avif"
       alt="Hired.com assessment results for John Menerick"
       width="869" height="338"
       loading="lazy"
       style="max-width:400px;width:100%;border-radius:8px;border:0.5px solid var(--color-border);flex-shrink:0;">
</div>

<hr class="s3-hr">
<span class="s3-section-label">All Credentials at a Glance</span>

<div class="tbl-wrap">
  <table>
    <thead>
      <tr>
        <th>Credential</th>
        <th>Issuer</th>
        <th>Category</th>
        <th>Verify</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="tbl-name">CISSP</td>
        <td>ISC²</td>
        <td>Professional Certification</td>
        <td><a href="https://www.credly.com/badges/74c8e3e1-c951-4651-a905-adf5e2898186/public_url" target="_blank" style="font-size:11px;color:#A78BFA;">Credly →</a></td>
      </tr>
      <tr>
        <td class="tbl-name">Google Cloud Professional</td>
        <td>Google</td>
        <td>Professional Certification</td>
        <td><a href="https://www.cloudskillsboost.google/public_profiles/335017d3-fb65-41f9-ad58-4e4668f5e783" target="_blank" style="font-size:11px;color:#A78BFA;">Google →</a></td>
      </tr>
      <tr>
        <td class="tbl-name">HackTheBox Global Rank #602</td>
        <td>HackTheBox</td>
        <td>Competitive Ranking</td>
        <td><a href="https://app.hackthebox.com/profile/6891" target="_blank" style="font-size:11px;color:#A78BFA;">HTB →</a></td>
      </tr>
      <tr>
        <td class="tbl-name">Java (Basic)</td>
        <td>HackerRank</td>
        <td>Skill Assessment</td>
        <td><a href="https://www.hackerrank.com/certificates/bea0e59a6a42" target="_blank" style="font-size:11px;color:#A78BFA;">HackerRank →</a></td>
      </tr>
      <tr>
        <td class="tbl-name">Python (Basic)</td>
        <td>HackerRank</td>
        <td>Skill Assessment</td>
        <td><a href="https://www.hackerrank.com/certificates/4551ad5e1696" target="_blank" style="font-size:11px;color:#A78BFA;">HackerRank →</a></td>
      </tr>
      <tr>
        <td class="tbl-name">LinkedIn Skill Assessments (10+)</td>
        <td>LinkedIn</td>
        <td>Skill Assessment</td>
        <td><a href="https://www.linkedin.com/in/w8mej/" target="_blank" style="font-size:11px;color:#A78BFA;">LinkedIn →</a></td>
      </tr>
      <tr>
        <td class="tbl-name">Amateur Extra Class License (W8MEJ)</td>
        <td>FCC</td>
        <td>Federal License</td>
        <td><a href="https://www.fcc.gov/uls/" target="_blank" style="font-size:11px;color:#A78BFA;">FCC ULS →</a></td>
      </tr>
    </tbody>
  </table>
</div>

</div><!-- /glasswing-wrapper -->

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ProfilePage",
  "mainEntity": {
    "@type": "Person",
    "@id": "https://www.securesql.info#john-menerick",
    "name": "John Menerick",
    "hasCredential": [
      {
        "@type": "EducationalOccupationalCredential",
        "name": "CISSP - Certified Information Systems Security Professional",
        "credentialCategory": "Professional",
        "url": "https://www.credly.com/badges/74c8e3e1-c951-4651-a905-adf5e2898186/public_url",
        "recognizedBy": { "@type": "Organization", "name": "ISC2" }
      },
      {
        "@type": "EducationalOccupationalCredential",
        "name": "Google Cloud Professional Certification",
        "credentialCategory": "Professional",
        "url": "https://www.cloudskillsboost.google/public_profiles/335017d3-fb65-41f9-ad58-4e4668f5e783",
        "recognizedBy": { "@type": "Organization", "name": "Google" }
      },
      {
        "@type": "EducationalOccupationalCredential",
        "name": "HackTheBox Global Rank #602 — Top 0.1% Worldwide",
        "credentialCategory": "Assessment",
        "url": "https://app.hackthebox.com/profile/6891",
        "recognizedBy": { "@type": "Organization", "name": "HackTheBox" }
      },
      {
        "@type": "EducationalOccupationalCredential",
        "name": "HackerRank Java (Basic) Certification",
        "credentialCategory": "Assessment",
        "url": "https://www.hackerrank.com/certificates/bea0e59a6a42",
        "recognizedBy": { "@type": "Organization", "name": "HackerRank" }
      },
      {
        "@type": "EducationalOccupationalCredential",
        "name": "HackerRank Python (Basic) Certification",
        "credentialCategory": "Assessment",
        "url": "https://www.hackerrank.com/certificates/4551ad5e1696",
        "recognizedBy": { "@type": "Organization", "name": "HackerRank" }
      },
      {
        "@type": "EducationalOccupationalCredential",
        "name": "Amateur Extra Class Amateur Radio License (W8MEJ)",
        "credentialCategory": "License",
        "recognizedBy": { "@type": "Organization", "name": "Federal Communications Commission" }
      }
    ]
  }
}
</script>
