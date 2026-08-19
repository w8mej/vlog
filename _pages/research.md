---
layout: default
title: Publicly available research efforts
permalink: /research/
description: "Explore John Menerick's public security research, including threat intelligence metrics, vulnerability databases, and Gyoithon - AI-driven penetration testing."
---

<div class="ed-index">

  <header class="ed-page-head">
    <div class="ed-kicker">Open source &amp; public labs</div>
    <h1 class="ed-page-title">Public research efforts</h1>
    <p class="ed-page-standfirst">Data-driven security initiatives focused on global threat signaling, vulnerability prioritization, and machine-learning driven offensive automation.</p>
  </header>

  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Active projects</h2>
      <span class="ed-meta">Four labs</span>
    </div>

    <div class="ed-cred-grid">

      <div class="ed-cred">
        <div class="ed-proj-logo">
          <img src="{{ site.baseurl }}/images/threatintellogo.png.avif" alt="Threat Intelligence Metrics" width="418" height="229" loading="lazy" />
        </div>
        <div class="ed-cred-name">Threat Intelligence Metrics</div>
        <p class="ed-cred-desc">Continuous ingestion and analysis of global threat feeds to generate high-fidelity metrics and attribution insights. Mapping the shift from raw signal to actionable defensive signal.</p>
        <a class="ed-textlink" href="https://intelmetrics.haxx.ninja" target="_blank" rel="noopener">Explore metrics &rarr;</a>
      </div>

      <div class="ed-cred">
        <div class="ed-proj-logo">
          <img src="{{ site.baseurl }}/images/nvd.png.avif" alt="Vulnerability Metrics" width="259" height="194" loading="lazy" />
        </div>
        <div class="ed-cred-name">Vulnerability &amp; remediation</div>
        <p class="ed-cred-desc">Automated parsing and prioritization of the US DHS National Vulnerability Database. Focused on remediation efficiency and the delta between disclosure and patch saturation.</p>
        <a class="ed-textlink" href="https://vulnmetrics.haxx.ninja/" target="_blank" rel="noopener">View vuln data &rarr;</a>
      </div>

      <div class="ed-cred">
        <div class="ed-proj-logo">
          <img src="{{ site.baseurl }}/images/1580877.png.avif" alt="Gauntlt Attacks" width="182" height="182" loading="lazy" />
        </div>
        <div class="ed-cred-name">Rugged SecDevOps testing</div>
        <p class="ed-cred-desc">Hardening the software lifecycle through automated attack simulation &mdash; a curated library of adapters and testing plans designed to be mean to your code before production deployment.</p>
        <a class="ed-textlink" href="https://web.archive.org/web/20211020084042/https://gauntltattacks.haxx.ninja" target="_blank" rel="noopener">View test plans &rarr;</a>
      </div>

      <div class="ed-cred">
        <div class="ed-proj-logo">
          <img src="{{ site.baseurl }}/images/gyoithon_logo.png.avif" alt="Gyoithon AI" width="1065" height="212" loading="lazy" />
        </div>
        <div class="ed-cred-name">Gyoithon: AI-driven pentesting</div>
        <p class="ed-cred-desc">A machine-learning framework designed to pass the Hacker Turing Test. Genetic algorithms and deep neural networks automating complex offensive security workflows with human-like precision.</p>
        <span class="ed-meta">Commercial access only</span>
      </div>

    </div>
  </section>

  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Vulnerability disclosures &amp; presentations</h2>
      <span class="ed-meta">26 entries</span>
    </div>

    <div class="ed-disc-grid">

      <div class="ed-disc">
        <div class="ed-cred-issuer">DEF CON</div>
        <h3 class="ed-disc-title">Open Source Fairy Dust</h3>
        <p>Research revealing flaws in internet infrastructure architecture and their economic and national security impacts.</p>
        <a class="ed-textlink" href="https://www.youtube.com/watch?v=OnJ18pyMncE" target="_blank" rel="noopener">Presentation &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">DEF CON</div>
        <h3 class="ed-disc-title">Backdooring Git &amp; version control</h3>
        <p>Cryptographic weaknesses and supply chain attacks via Git internals &mdash; how code breaches jeopardize development pipelines.</p>
        <a class="ed-textlink" href="https://www.youtube.com/watch?v=lXf9nlTmnK4" target="_blank" rel="noopener">Presentation &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">37signals</div>
        <h3 class="ed-disc-title">Basecamp infrastructure analysis</h3>
        <p>Discovered and responsibly disclosed critical vulnerabilities within Basecamp and 37signals infrastructure.</p>
        <a class="ed-textlink" href="https://37signals.com/policies/security/response/" target="_blank" rel="noopener">Disclosure &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Apache Foundation</div>
        <h3 class="ed-disc-title">Apache Solr &amp; Jetty vulnerability</h3>
        <p>Identified a critical vulnerability (SOLR-4861) affecting Apache Jetty and Solr, coordinating a secure resolution.</p>
        <a class="ed-textlink" href="https://issues.apache.org/jira/browse/SOLR-4861" target="_blank" rel="noopener">Advisory &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Security Onion</div>
        <h3 class="ed-disc-title">Security Onion CapMe vulnerability</h3>
        <p>Uncovered vulnerabilities within the Security Onion CapMe interface, patched before adversaries could leverage them.</p>
        <a class="ed-textlink" href="https://blog.securityonion.net/2016/02/securityonion-capme-20121213_10.html" target="_blank" rel="noopener">Advisory &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Scalr</div>
        <h3 class="ed-disc-title">Scalr infrastructure SQLi</h3>
        <p>SQL injection and input validation vulnerabilities within the Scalr cloud management platform.</p>
        <a class="ed-textlink" href="https://web.archive.org/web/20150915120000/https://securesql.info/vulnerabilitiesexploits/2013/5/26/scalr-sqli-and-poor-validation" target="_blank" rel="noopener">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Threat research</div>
        <h3 class="ed-disc-title">Pandora DDoS botnet nullification</h3>
        <p>Investigated the command-and-control infrastructure of the Pandora botnet, revealing vulnerabilities to dismantle its operations.</p>
        <a class="ed-textlink" href="https://web.archive.org/web/20150915120000/https://securesql.info/vulnerabilitiesexploits/2013/5/2/pandora-ddos-botnet-0days" target="_blank" rel="noopener">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Publication</div>
        <h3 class="ed-disc-title">IS administration &amp; architecture</h3>
        <p>Technical editor for <em>Organizational, Legal, and Technological Dimensions of IS Admin</em> &mdash; a reference work bridging IT system administration with legal considerations.</p>
        <a class="ed-textlink" href="https://www.amazon.com/Organizational-Technological-Dimensions-Information-Administration/dp/1466645261" target="_blank" rel="noopener">Publication &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">LDAP Tool Box</div>
        <h3 class="ed-disc-title">LDAP Tool Box XSS</h3>
        <p>Cross-site scripting vulnerabilities within the LDAP Tool Box self-service password application.</p>
        <a class="ed-textlink" href="{% post_url 2014-12-01-ldap-vulnerabilities-exploits %}">Advisory &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Block (Square)</div>
        <h3 class="ed-disc-title">Keywhiz secret management</h3>
        <p>Vulnerabilities within Block&rsquo;s Keywhiz secret management system regarding secret sanitation and handling.</p>
        <a class="ed-textlink" href="https://github.com/square/keywhiz/pull/50" target="_blank" rel="noopener">Pull request &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">jQuery</div>
        <h3 class="ed-disc-title">jQuery core XSS vulnerability</h3>
        <p>A widespread cross-site scripting vulnerability within the core jQuery library (ticket #12254), impacting millions of deployments.</p>
        <a class="ed-textlink" href="https://bugs.jquery.com/ticket/12254/" target="_blank" rel="noopener">Bug report &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Hack The Box</div>
        <h3 class="ed-disc-title">Hack The Box Elite Hacker</h3>
        <p>Reached Elite Hacker rank in competitive exploitation across Solaris, FreeBSD, Linux, and Windows environments.</p>
        <a class="ed-textlink" href="https://app.hackthebox.com/profile/6891" target="_blank" rel="noopener">Profile &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">RFC research</div>
        <h3 class="ed-disc-title">HTTP cookie DoS vulnerabilities</h3>
        <p>Analyzed anomalies in HTTP and cookie RFC implementations to uncover novel denial-of-service attack vectors.</p>
        <a class="ed-textlink" href="https://web.archive.org/web/20150915120000/https://securesql.info/vulnerabilitiesexploits/2013/4/11/nifty-cookie-dos-hacks" target="_blank" rel="noopener">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Google</div>
        <h3 class="ed-disc-title">Google Translate sandbox breakout</h3>
        <p>Critical vulnerabilities allowing a sandbox breakout within Google Translate&rsquo;s infrastructure.</p>
        <a class="ed-textlink" href="{% post_url 2013-07-31-google-translate-breakout %}">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Google</div>
        <h3 class="ed-disc-title">Google Glass &amp; AR/VR 0-days</h3>
        <p>Deep attack surfaces in Google Glass and early AR/VR hardware, disclosing DoS and XSS vulnerabilities to the Glass team.</p>
        <div class="ed-disc-links">
          <a class="ed-textlink" href="{% post_url 2013-04-19-google-glass-vulns %}">Demo &rarr;</a>
          <a class="ed-textlink" href="https://github.com/googleglass/mirror-quickstart-java/commit/738352eb5b5b73aa7bb911d0aeee3386f40dbf26" target="_blank" rel="noopener">Source patch &rarr;</a>
        </div>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Threat research</div>
        <h3 class="ed-disc-title">Malicious mobile power stations</h3>
        <p>Novel attack vectors exploiting public USB charging stations to compromise smartphones via hidden hardware.</p>
        <a class="ed-textlink" href="{% post_url 2013-06-05-mobile-power-station %}">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Threat research</div>
        <h3 class="ed-disc-title">Firesale botnet analysis</h3>
        <p>A comprehensive evaluation of the Firesale botnet panel to uncover exploitable flaws in the threat actor&rsquo;s infrastructure.</p>
        <a class="ed-textlink" href="{% post_url 2012-10-10-firesale-0days %}">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Cloud9</div>
        <h3 class="ed-disc-title">Cloud9 IDE remote code execution</h3>
        <p>Unpatched XSS and potential remote code execution vulnerabilities within the Cloud9 online development environment.</p>
        <a class="ed-textlink" href="https://web.archive.org/web/20150915120000/https://securesql.info/vulnerabilitiesexploits/2013/6/4/unpatched-cloud9-xss-and-potential-remote-code-execution-vulnerability" target="_blank" rel="noopener">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Threat research</div>
        <h3 class="ed-disc-title">Carberp botnet cryptography</h3>
        <p>Reverse-engineered the Carberp banking trojan, discovering critical vulnerabilities and broken cryptographic implementations in the C2.</p>
        <a class="ed-textlink" href="{% post_url 2013-06-27-carberp-vulnerabilities-cc-pie %}">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Wikimedia Foundation</div>
        <h3 class="ed-disc-title">Wikipedia core XSS</h3>
        <p>Analyzed MediaWiki infrastructure and disclosed a cross-site scripting vulnerability (CVE-2015-6729).</p>
        <a class="ed-textlink" href="https://nvd.nist.gov/vuln/detail/CVE-2015-6729" target="_blank" rel="noopener">View CVE &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">CNN</div>
        <h3 class="ed-disc-title">CNN digital infrastructure XSS</h3>
        <p>Critical cross-site scripting vulnerabilities in CNN&rsquo;s digital infrastructure brought to light for prompt resolution.</p>
        <a class="ed-textlink" href="{% post_url 2013-05-06-cnn-xss %}">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">BSIMM</div>
        <h3 class="ed-disc-title">Building Security In Maturity Model</h3>
        <p>Contributed to the BSIMM program, building and improving software security maturity benchmarks for enterprise organizations.</p>
        <a class="ed-textlink" href="https://www.synopsys.com/software-integrity/software-security-services/bsimm-maturity-model.html" target="_blank" rel="noopener">View BSIMM &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">ISC&sup2;</div>
        <h3 class="ed-disc-title">Bug bounty &amp; external scrutiny</h3>
        <p>On the strategic importance of external scrutiny and bug bounty programs to enhance institutional security postures.</p>
        <a class="ed-textlink" href="https://isc2chapter-westmi.org/page/6/" target="_blank" rel="noopener">Presentation &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Threat research</div>
        <h3 class="ed-disc-title">BlackEnergy botnet neutralization</h3>
        <p>Analyzed the BlackEnergy botnet C2 infrastructure to identify exploitable vulnerabilities and safely neutralize the threat.</p>
        <a class="ed-textlink" href="https://web.archive.org/web/20150915120000/https://securesql.info/vulnerabilitiesexploits/2013/5/2/blackenergy-botnet-0days" target="_blank" rel="noopener">Research &rarr;</a>
      </div>

      <div class="ed-disc">
        <div class="ed-cred-issuer">Apache Foundation</div>
        <h3 class="ed-disc-title">Apache Batik DoS vulnerability</h3>
        <p>A denial-of-service vulnerability (BATIK-1023) within the Apache Batik SVG toolkit, enabling rapid mitigation.</p>
        <a class="ed-textlink" href="https://issues.apache.org/jira/browse/BATIK-1023" target="_blank" rel="noopener">Advisory &rarr;</a>
      </div>

    </div>
  </section>

  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Private R&amp;D</h2>
    </div>

    <div class="ed-feature">
      <div class="ed-feature-text">
        <p>Stealth-mode initiatives in systems-inspired defense, autonomous architectures, ZK/MPC, and cryptographic protocol resilience.</p>
      </div>
      <img class="ed-proof ed-redacted" src="{{ site.baseurl }}/images/redacted.webp" alt="Redacted research" width="1024" height="1024" loading="lazy" />
    </div>
  </section>

</div>
