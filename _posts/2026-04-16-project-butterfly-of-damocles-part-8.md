---
layout: post
title: "Part VII — What this means if you work in security, build OSS, run AI infrastructure, or set policy"
date: 2026-04-16
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 9
categories: ["Security", "Project Glasswing", "Takeaways"]
tags: ["Project Glasswing", "Claude Mythos", "discovery velocity", "patch velocity", "CISOs", "incident response", "OSS maintainers", "SLSA", "OIDC provenance", "ML infrastructure", "AI gateway", "LiteLLM", "regulators", "CISA KEV", "FedRAMP", "NVD reform", "AI governance", "voluntary restraint", "practical guidance", "remediation"]
excerpt: "The scarcity of finding capability is over. The crisis of fixing it is just beginning. Six takeaways for the six categories of people who need to act now — with the specific actions, the honest timelines, and the non-obvious implications each category tends to miss."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper gw-dark">

<div class="ep-series-header">
  <div class="ep-num-row">
    <span class="ep-badge-dot"></span>
    <span class="ep-series-name">Season 3 &middot; Project Butterfly of Damocles &middot; Episode 9 of 10</span>
  </div>
  <h2 class="ep-title-display">Part VIII</h2>
  <p class="ep-header-tagline">What this means if you work in security, build OSS, run AI infrastructure, or set policy</p>
</div>

<hr class="gw-hr">

<div class="ep-lede-block">
  <p class="ep-lede">This is the operational episode. The preceding eight episodes built the analytical framework: the DEF CON 22 dataset, the supply chain attack surface, the March 2026 cascade, the ML stack vulnerability landscape, the twelve-year timeline, the Glasswing policy precedent, and the honest accounting of what the initiative does and doesn&rsquo;t change.</p>
  <p class="ep-lede">This episode translates the framework into action. Six audience categories. Six sets of takeaways. Each takeaway goes beyond the headline to the non-obvious implication, the specific action, the honest timeline, and the thing that category is most likely to get wrong even when they understand the headline.</p>
  <p class="ep-lede">The common thread across all six: the bottleneck has moved. The old security model was constrained by the scarcity of finding capability &mdash; by the fact that finding vulnerabilities required human expert time and didn&rsquo;t scale. That scarcity is over. The constraints that replaced it &mdash; human patching velocity, governance frameworks built for the old model, incentive structures unchanged since 2014 &mdash; are the new bottleneck. Acting on this change means acting on the new bottleneck, not the old one.</p>
</div>

<div class="audience-nav">
  <div class="an-label">Jump to your audience</div>
  <div class="an-links">
    <span class="an-link">01 Everyone</span>
    <span class="an-sep">&middot;</span>
    <span class="an-link">02 Security teams</span>
    <span class="an-sep">&middot;</span>
    <span class="an-link">03 OSS maintainers</span>
    <span class="an-sep">&middot;</span>
    <span class="an-link">04 AI/ML teams</span>
    <span class="an-sep">&middot;</span>
    <span class="an-link">05 Regulators</span>
    <span class="an-sep">&middot;</span>
    <span class="an-link">06 AI industry</span>
  </div>
</div>

<hr class="gw-hr">

<!-- ── Takeaway 01 ── -->
<div class="takeaway">
  <div class="tk-audience-tag tk-everyone">For everyone</div>
  <span class="tk-num">Takeaway 01</span>
  <div class="tk-head">The scarcity of finding capability is over. The crisis of fixing it is just beginning.</div>

  <p>Every institution in the security ecosystem &mdash; vendors, governments, enterprises, registries, standards bodies, certification authorities &mdash; was built around the assumption that finding vulnerabilities was the hard part. This assumption was correct for fifty years. It is no longer correct as of April 2026.</p>
  <p>The CVE assignment process was designed for a world where a human researcher found a vulnerability, wrote it up, and submitted it to a numbering authority, which reviewed and assigned it. The CISA KEV was designed for a world where known-exploited vulnerabilities entered the system one at a time with enough separation for manual review. FedRAMP continuous monitoring was designed for a world where &ldquo;scan monthly for new vulnerabilities&rdquo; was an adequate cadence because the discovery rate made monthly scanning sufficient. NVD CVSS scoring was designed for a world where human analysts could score each entry in a reasonable timeframe because the inflow was human-paced.</p>
  <p>Glasswing does not just add capacity to the existing vulnerability discovery pipeline. It changes the rate at which new findings arrive by orders of magnitude. Every downstream process that was calibrated for the old rate is now operating outside its design parameters. This is not a theoretical future problem. The NVD backlog already exceeded acceptable levels before Glasswing. Log4Shell&rsquo;s remediation took years because the patching infrastructure was not designed for a single finding at that scale. Glasswing will produce findings at a scale that makes Log4Shell look like a one-off event.</p>

  <div class="tk-action-block">
    <div class="tk-action-label">The non-obvious implication most institutions will miss</div>
    <p>The instinct will be to add capacity to existing pipelines: more CVE reviewers, more NVD analysts, more CISA staff. This is the wrong response. Adding capacity to a pipeline designed for a different order-of-magnitude input rate produces a slightly less overwhelmed version of the same failing pipeline. The correct response is redesigning the pipeline for the new input rate: automated CVSS scoring, AI-assisted triage, tiered disclosure protocols that match disclosure cadence to maintainer capacity, and compliance mandates that acknowledge the impossibility of patching everything simultaneously. The difference between &ldquo;add staff&rdquo; and &ldquo;redesign the process&rdquo; is the difference between spending the head-start window on incremental improvement and spending it on structural change.</p>
  </div>

  <div class="tk-timeline-block">
    <div class="tk-tl-item tk-urgent"><div class="tk-tl-marker">Now</div><div>Acknowledge publicly that the existing disclosure and compliance framework is operating outside its design parameters. This acknowledgment is the prerequisite for the redesign conversations that need to start immediately.</div></div>
    <div class="tk-tl-item tk-medium"><div class="tk-tl-marker">6 months</div><div>Standards bodies (NIST, FIRST, ISO) need to have working groups on AI-velocity disclosure protocols. The 18-month window for meaningful change requires the working groups to exist in the first 6 months.</div></div>
    <div class="tk-tl-item tk-long"><div class="tk-tl-marker">18 months</div><div>The disclosure and compliance framework redesign needs to be operational before the Glasswing disclosure flood peaks. Not in draft. Operational.</div></div>
  </div>
</div>

<!-- ── Takeaway 02 ── -->
<div class="takeaway tk-red">
  <div class="tk-audience-tag tk-security">For security teams &amp; CISOs</div>
  <span class="tk-num">Takeaway 02</span>
  <div class="tk-head">If your environment touched Trivy, KICS, LiteLLM, or Axios between March 19&ndash;April 3, 2026: assume full compromise. Rotate everything. And then fix the structural gaps that made you vulnerable.</div>

  <p>The remediation step is urgent and non-negotiable, but it is not the end of the work. Rotating credentials after a CI/CD pipeline compromise addresses the immediate exposure. It does not address the architectural conditions that made the pipeline a single-point-of-failure for all of those credentials simultaneously. The security team that completes the rotation and declares the incident closed has addressed the symptom. The security team that completes the rotation and then redesigns the pipeline architecture has addressed the cause.</p>

  <div class="tk-remediation-grid">
    <div class="tk-rem-section rem-critical">
      <div class="tk-rem-title">&#9888; Immediate (do now if not already done)</div>
      <ul class="bullets">
        <li><strong>Trivy/KICS (Mar 19&ndash;22):</strong> Rotate all AWS IAM keys, GCP service account tokens, Azure credentials, K8s service account tokens, SSH private keys, GitHub PATs, npm/PyPI publish tokens, and database credentials in any CI/CD runner that executed during those windows. Update Trivy to v0.69.3 or earlier. Remove or remediate any <code>sysmon.service</code> entries polling <code>checkmarx.zone</code> every 50 minutes &mdash; this is an active backdoor on unremediated Linux hosts.</li>
        <li><strong>LiteLLM 1.82.7/1.82.8:</strong> Rotate all LLM API keys (OpenAI, Anthropic, Azure OpenAI, Google Vertex, AWS Bedrock, and every other provider configured). Find and remove <code>litellm_init.pth</code> in all Python site-packages directories. Audit K8s clusters for unauthorized kube-system pods with host filesystem access. Treat any Python interpreter that ran after installation as fully compromised.</li>
        <li><strong>Axios 1.14.1/0.30.4 (window: Mar 31 00:21&ndash;03:15 UTC):</strong> Check for <code>plain-crypto-js</code> in node_modules. Rotate credentials on any machine that ran <code>npm install</code> during this window. Search network logs for connections to sfrclak.com:8000 and 142.11.206.72.</li>
        <li><strong>CISA KEV deadline:</strong> CVE-2026-33634 deadline was April 9. If not remediated: you are now in violation of KEV requirements. Document your remediation timeline and communicate with your AO/ISSO immediately.</li>
      </ul>
    </div>
    <div class="tk-rem-section rem-structural">
      <div class="tk-rem-title">&#9654; Structural (do in the next 30 days)</div>
      <ul class="bullets">
        <li><strong>Pin all GitHub Actions to commit SHAs.</strong> Not version tags. <code>uses: aquasecurity/trivy-action@f781cce5aab226378d3e6f493a1a2d3ca7b15b2</code>. Force-pushed tags are the exploit vector for the entire Trivy attack class. SHA references cannot be force-pushed. This is a one-time change with near-zero operational cost and eliminates an entire attack class.</li>
        <li><strong>Implement SLSA provenance monitoring</strong> on your highest-impact npm and PyPI dependencies. The absence of SLSA provenance on a new release from a package that historically had it is an automated alert. For Axios specifically, the malicious releases had no SLSA attestation. This check would have fired within seconds of the malicious publication.</li>
        <li><strong>Enforce <code>npm ci</code> (not <code>npm install</code>) in all CI/CD pipelines</strong> and commit all lockfiles to version control. <code>npm ci</code> with a committed lockfile is deterministic and will not auto-upgrade to a malicious new version. <code>npm install</code> with floating semver ranges will.</li>
        <li><strong>Implement egress filtering on CI/CD runners.</strong> A runner that can only reach known package registries, internal services, and approved external endpoints cannot exfiltrate credentials to an unknown C2 host. This is the control that would have blocked the Trivy credential exfiltration even on a compromised runner.</li>
        <li><strong>Introduce a package publication cooldown policy:</strong> do not auto-update any package published less than 72 hours ago. This window gives the security community time to analyze new releases before they enter your pipeline automatically.</li>
      </ul>
    </div>
  </div>

  <div class="tk-action-block">
    <div class="tk-action-label">The thing security teams are most likely to get wrong</div>
    <p>Treating the March 2026 cascade as a set of specific incidents to remediate rather than as a demonstration of a structural vulnerability class. The Trivy attack, the LiteLLM attack, and the Axios attack are three instances of the same attack class: trusted, privileged tooling inside a CI/CD pipeline, compromised via either tag manipulation or maintainer social engineering, exfiltrating credentials to which the tool had ambient access. Fixing Trivy without fixing the tag pinning problem means the next tool in the same attack class will produce the same result. The structural fix is: minimize ambient secret access in pipelines, verify the integrity of tooling at execution time (not just at installation time), and detect unexpected outbound connections from runners in real time.</p>
  </div>

  <div class="tk-action-block tk-ab-teal">
    <div class="tk-action-label">The Glasswing preparedness gap</div>
    <p>Glasswing will produce vulnerability disclosures for software your organization uses. Your security program needs a process for receiving and triaging AI-generated vulnerability disclosures, which are likely to be more numerous, more technically precise, and more difficult to assess for exploitability context than traditional disclosures. Prepare now: designate a Glasswing liaison, establish SLAs for AI-generated disclosure triage, and be explicit with your maintainer relationships that you are a potential Glasswing downstream consumer who will need coordinated patching support.</p>
  </div>
</div>

<!-- ── Takeaway 03 ── -->
<div class="takeaway tk-teal">
  <div class="tk-audience-tag tk-oss">For OSS maintainers</div>
  <span class="tk-num">Takeaway 03</span>
  <div class="tk-head">You are the highest-value social engineering target in the software ecosystem. Technical controls cannot replace that fact &mdash; but they can make you detectable when you&rsquo;re compromised, and that window matters.</div>

  <p>The Axios attack is the clearest possible demonstration of the threat model you now face. UNC1069 did not find a vulnerability in Axios&rsquo;s code. They found Jason Saayman. They spent two weeks building a relationship with him. They deployed a nation-state-grade social engineering operation specifically tailored to his professional context, his interests, and his likely responses. At 100M weekly downloads, the ROI for that investment was exceptional. At your download count, calculate your own ROI. If it is in the millions of weekly downloads: you are a target. Not potentially a target. A target.</p>
  <p>This is not a failure of your security practices. It is a structural condition of being a high-impact OSS maintainer in 2026. The correct response is not to become a recluse who never speaks to anyone. It is to understand what detection signals exist when your credentials are compromised, and to make those signals as sensitive as possible so the window between compromise and detection is as short as possible.</p>

  <div class="tk-oss-priorities">
    <div class="oss-priority op-critical">
      <div class="op-label">Highest priority: make a credential compromise detectable in minutes</div>
      <ul class="bullets">
        <li><strong>Enable SLSA level 2 provenance and OIDC-attested publishing on every release.</strong> This is the single most impactful security control available to OSS maintainers today, specifically because it is a detection signal rather than a prevention control. When your npm credentials are stolen and used to publish a malicious release via stolen token rather than your normal GitHub Actions pipeline, the absence of SLSA provenance is the signal that fires immediately. Without this: the malicious release looks identical to a legitimate one. With it: the absence is detectable within seconds of publication.</li>
        <li><strong>Use npm&rsquo;s trusted publishing with OIDC</strong> (or PyPI&rsquo;s equivalent). These systems tie package publication to specific GitHub Actions workflows rather than to bearer tokens. A stolen npm token cannot publish a release that passes OIDC verification if the token was not generated by your designated publishing workflow. This is the architectural control that would have made the Axios attack significantly harder to execute without detection.</li>
        <li><strong>Enable 2FA on your registry accounts and configure notifications for all account changes.</strong> UNC1069&rsquo;s first action after obtaining Saayman&rsquo;s credentials was to change the registered email on his npm account. If email change notifications had been configured to a separate, attacker-inaccessible address, this action would have been visible within minutes. 2FA would have made the initial credential theft insufficient without a second factor.</li>
      </ul>
    </div>
    <div class="oss-priority op-high">
      <div class="op-label">High priority: understand the social engineering pattern</div>
      <ul class="bullets">
        <li><strong>Know the UNC1069 pattern:</strong> the attack starts with a business Slack workspace that looks legitimate, moves to Teams, involves an audio problem requiring a software fix. This is not the only pattern &mdash; nation-state social engineering is tailored to the target &mdash; but it is the documented pattern. Any invitation to install software during a video call from an unknown party should be treated as a potential RAT delivery mechanism.</li>
        <li><strong>Verify identities through out-of-band channels</strong> before taking any action that involves installing software, running scripts, or providing credentials. If a company claims to want to collaborate on your project and asks you to install something, contact the company through their official website to verify the request is legitimate. This takes 10 minutes and prevents the Axios attack class.</li>
        <li><strong>Understand your ROI as a target.</strong> Your weekly download count multiplied by the credential value per compromised developer machine is approximately your ROI for a nation-state social engineering operation. If that number is in the millions: threat actors have done this calculation. If it is in the billions: multiple threat actors have probably done this calculation and some are actively running operations against targets with similar profiles.</li>
      </ul>
    </div>
    <div class="oss-priority op-medium">
      <div class="op-label">Medium priority: prepare for Glasswing disclosures</div>
      <ul class="bullets">
        <li><strong>Document your security disclosure process explicitly</strong> (SECURITY.md, CVE CNA enrollment if applicable, a defined timeline for acknowledgment and triage). Glasswing&rsquo;s disclosures will be high-volume, technically precise, and on a disclosure timeline that may not match your current patch velocity. Having a defined process means the first disclosure doesn&rsquo;t hit you without a framework for responding.</li>
        <li><strong>Consider joining the Glasswing partner program</strong> or a Glasswing-adjacent disclosure channel if your project is critical infrastructure. Early access to findings means more lead time for patching. The alternative is receiving disclosures simultaneously with a broader audience, potentially before you have resources in place to respond.</li>
        <li><strong>Know your project&rsquo;s bundling footprint.</strong> How many downstream applications bundle your project directly? How many have it as a transitive dependency? This number is your obligation multiplier for patching: every critical vulnerability you patch needs to propagate to all of those downstream projects, and many of them will not update without explicit notification. GitHub Dependabot and npm/PyPI advisory systems help with this; using them proactively means your downstream users are alerted automatically when you release a security fix.</li>
      </ul>
    </div>
  </div>

  <div class="tk-action-block">
    <div class="tk-action-label">The thing OSS maintainers are most likely to get wrong</div>
    <p>Focusing on technical hardening while underinvesting in the detection signal. Perfect 2FA configuration, SLSA provenance, and OIDC-attested publishing do not prevent a nation-state social engineering operation. What they do is create an observable gap when the attack succeeds: the malicious release doesn&rsquo;t have SLSA provenance, the account change generates a notification, the OIDC verification fails. The correct framing is not &ldquo;prevent the attack&rdquo; but &ldquo;minimize the window between attack and detection, and minimize the blast radius during that window.&rdquo; Two hours and fifty-four minutes was the Axios window. With SLSA monitoring, it could have been under ten minutes.</p>
  </div>
</div>

<!-- ── Takeaway 04 ── -->
<div class="takeaway tk-amber">
  <div class="tk-audience-tag tk-ml">For AI/ML infrastructure teams</div>
  <span class="tk-num">Takeaway 04</span>
  <div class="tk-head">The LiteLLM compromise is the canary for an architectural failure that most ML deployments share. Your AI gateway is your credential vault. It should not be.</div>

  <p>LiteLLM&rsquo;s March 2026 compromise happened because of a pattern that most multi-provider AI deployments follow: a single gateway service centralizes API keys for all LLM providers, and that service runs with ambient access to all of those credentials simultaneously. This pattern is convenient. It is also a single-point-of-failure for your entire AI provider relationship portfolio. When LiteLLM was compromised, organizations didn&rsquo;t lose access to one LLM provider. They lost access to all of them simultaneously, because all the keys were in one place.</p>
  <p>This is not a LiteLLM-specific problem. It is an architectural problem that persists in any deployment where credential centralization trades operational convenience for a catastrophic single-point-of-failure. The question for every AI/ML team is not &ldquo;did we run LiteLLM?&rdquo; but &ldquo;do we have any service that holds credentials for multiple AI providers simultaneously?&rdquo; If the answer is yes &mdash; and for most organizations running a multi-provider AI strategy it is yes &mdash; you have the same architectural vulnerability.</p>

  <div class="ml-action-grid">
    <div class="ml-action ma-critical">
      <div class="ma-label">Architecture changes (do in the next 60 days)</div>
      <ul class="bullets">
        <li><strong>Implement credential segmentation for LLM API keys.</strong> No single service should have read access to all your LLM provider credentials simultaneously. At minimum: separate the credentials by provider, use a secrets manager (AWS Secrets Manager, HashiCorp Vault) with fine-grained access policies, and ensure the gateway service can only fetch the credentials it needs for an active request rather than holding them in memory at all times.</li>
        <li><strong>Apply the principle of least privilege to your LLM gateway&rsquo;s K8s service account.</strong> LiteLLM&rsquo;s lateral movement deployed privileged pods to every K8s node because the service account had excessive permissions. Your LLM gateway does not need cluster-admin privileges. It does not need kube-system access. Audit the service account permissions on any gateway service and reduce them to the minimum necessary for the service to function.</li>
        <li><strong>Migrate model loading from pickle to safetensors.</strong> This is a one-time migration for each model. Safetensors is a pure data format: no code execution, bounded memory access, cryptographically hashable. The migration eliminates the &ldquo;loading a model file is arbitrary code execution&rdquo; problem for that model permanently. HuggingFace&rsquo;s <code>safetensors</code> library provides a drop-in replacement for most PyTorch loading workflows.</li>
        <li><strong>Authenticate your Ray cluster.</strong> If you run Ray, enable authentication on the Jobs API and the Ray dashboard. The default Ray configuration is unauthenticated by design &mdash; ShadowRay. Any network-accessible Ray cluster without authentication is an unauthenticated RCE endpoint. This is not a difficult fix; it is a configuration change that takes an afternoon and eliminates an entire attack class.</li>
      </ul>
    </div>
    <div class="ml-action ma-ongoing">
      <div class="ma-label">Ongoing hygiene</div>
      <ul class="bullets">
        <li><strong>Audit Python site-packages for unexpected <code>.pth</code> files</strong> after any dependency installation: <code>find $(python -c "import site; print(':'.join(site.getsitepackages()))") -name "*.pth" | xargs grep -l "import" 2>/dev/null</code>. Any <code>.pth</code> file containing an import statement that you did not explicitly create is suspicious. This check takes ten seconds and detects the LiteLLM persistence mechanism class.</li>
        <li><strong>Treat LangChain-based applications that make external HTTP requests as SSRF-adjacent.</strong> Any LangChain agent with a web fetching tool that processes documents from untrusted sources is potentially vulnerable to prompt injection that causes SSRF to internal metadata endpoints (169.254.169.254 for AWS, 169.254.169.254 for GCP, 169.254.169.254 for Azure IMDS). Disable the URL fetching tool for agents that process untrusted documents, or implement egress filtering that blocks IMDS and internal subnet ranges for the agent&rsquo;s HTTP client.</li>
        <li><strong>Establish an ML dependency approval process</strong> analogous to code review. Any new Python package added to an ML training or inference environment should go through the same review as application code: source verification, provenance check, known-vulnerability scan, SLSA attestation presence. ML environments have historically treated package installation as an operational task rather than a security-relevant one. That distinction is no longer tenable.</li>
      </ul>
    </div>
  </div>

  <div class="tk-action-block">
    <div class="tk-action-label">The thing ML teams are most likely to get wrong</div>
    <p>Treating the LiteLLM incident as a &ldquo;third-party vendor risk&rdquo; issue and responding with vendor risk management processes (questionnaires, attestations, insurance) rather than architectural changes. LiteLLM was compromised not because BerriAI is an irresponsible vendor, but because TeamPCP harvested BerriAI&rsquo;s PyPI publish token from BerriAI&rsquo;s own CI/CD pipeline (which ran Trivy) and used it to publish directly. No vendor risk questionnaire addresses this attack path. The architectural response &mdash; credential segmentation, PKI-attested publishing, SLSA verification before deployment &mdash; is what addresses it.</p>
  </div>
</div>

<!-- ── Takeaway 05 ── -->
<div class="takeaway tk-blue">
  <div class="tk-audience-tag tk-policy">For regulators &amp; policy makers</div>
  <span class="tk-num">Takeaway 05</span>
  <div class="tk-head">Your entire vulnerability management framework was designed for human-paced sequential disclosure. You have roughly 18 months before Glasswing-class findings flood the system. The redesign window is now.</div>

  <p>The compliance cliff is not a metaphor. It is an operational prediction: the existing vulnerability management regulatory framework will fail to function as designed when Glasswing-scale disclosure begins. Not &ldquo;function suboptimally.&rdquo; Fail to function. The KEV will have thousands of simultaneous entries. The NVD backlog will extend beyond any reasonable scoring timeline. The CMMC patch SLAs will become impossible for organizations that are simultaneously required to patch hundreds of critical findings in the same compliance cycle. The FedRAMP continuous monitoring requirement will be met by automated scans that produce outputs no human reviewer can process.</p>
  <p>This is not a hypothetical. It is a scaled version of what already happened with Log4Shell in 2021: a single finding at scale exposed the limits of the patch management infrastructure for federal agencies. Most agencies could not fully enumerate their Log4j exposure for months. Glasswing will produce Log4Shell-scale findings at a frequency that makes month-by-month management impossible.</p>

  <div class="policy-agenda">
    <div class="pa-section pa-urgent">
      <div class="pa-title">Urgent (start now, outcomes needed in 12 months)</div>
      <div class="pa-items">
        <div class="pa-item">
          <h4>Redesign CVE/NVD for AI-velocity input</h4>
          <p>The CVE assignment and NVD enrichment process needs a high-throughput pathway for AI-generated vulnerability reports. The current sequential model &mdash; human submission, CNA review, NVD analyst scoring &mdash; cannot process thousands of simultaneous submissions. The redesign requirements: automated initial classification, AI-assisted CVSS scoring with human review for the highest-severity entries, streamlined CNA delegation to project-level maintainers for their own software, and a public queue with estimated completion times that consuming organizations can rely on for triage prioritization.</p>
        </div>
        <div class="pa-item">
          <h4>CISA KEV process redesign for simultaneous bulk disclosure</h4>
          <p>The KEV catalog&rsquo;s 15-day and 60-day remediation mandates assume vulnerabilities are added to the catalog one at a time. The process for handling simultaneous bulk additions &mdash; including how agencies triage, prioritize, and communicate about patching when hundreds of critical findings arrive simultaneously &mdash; needs to be defined before that situation occurs. CISA should convene a working group on KEV reform in the context of AI-velocity disclosure within 90 days of this writing.</p>
        </div>
        <div class="pa-item">
          <h4>Engage the Glasswing legal dispute as a security policy problem</h4>
          <p>The legal dispute between Anthropic and the White House creates friction in exactly the government-industry coordination that CISA, NSA, and NIST need for Glasswing policy engagement. This is a governance failure with direct security consequences: federal agencies&rsquo; access to Mythos for Glasswing-related work, CISA&rsquo;s ability to use Glasswing findings in KEV decisions, and NIST&rsquo;s ability to develop NVD reform in coordination with Glasswing all become harder when the legal context creates adversarial framing. This specific dispute has direct national security implications that should elevate it above normal civil litigation timelines.</p>
        </div>
      </div>
    </div>
    <div class="pa-section pa-structural">
      <div class="pa-title">Structural (12&ndash;18 month horizon)</div>
      <div class="pa-items">
        <div class="pa-item">
          <h4>FedRAMP and CMMC reform for AI-discovery era</h4>
          <p>FedRAMP continuous monitoring and CMMC patch requirements were calibrated for a world where the vulnerability discovery rate was human-paced. The specific reform needed: tiered patch SLAs based on exploitability evidence (not just CVSS score), a defined process for simultaneous multi-finding disclosure that allows agencies to triage rather than requiring sequential response, and recognition that &ldquo;awareness of vulnerability&rdquo; and &ldquo;ability to patch within SLA&rdquo; are different conditions with different implications for authorization to operate.</p>
        </div>
        <div class="pa-item">
          <h4>SBOM mandate extension to AI/ML components</h4>
          <p>The Executive Order 14028 SBOM requirements apply to software developed for or procured by the federal government. ML model files, LLM API integrations, and AI gateway configurations are increasingly part of that software. The SBOM mandate needs to extend to these components: a federal agency deploying an AI system should be able to enumerate its LLM provider dependencies and model file provenance with the same specificity as its software library dependencies. This creates the inventory visibility that would have made LiteLLM-type compromises detectable in federal environments.</p>
        </div>
        <div class="pa-item">
          <h4>AARM standard development as a regulatory requirement</h4>
          <p>The governance gap in Glasswing&rsquo;s deployment &mdash; the absence of published AARM-class runtime controls for AI security agents &mdash; is a gap that regulatory mandate can help close. NIST should develop a standard for runtime controls for AI agents operating with elevated access to security-sensitive infrastructure. This standard should be incorporated into FedRAMP requirements for AI-powered security tools within 18 months, creating the regulatory signal that drives industry adoption of AARM-class controls.</p>
        </div>
      </div>
    </div>
  </div>

  <div class="tk-action-block">
    <div class="tk-action-label">The thing regulators are most likely to get wrong</div>
    <p>Moving too slowly because &ldquo;the compliance cliff is still 18 months away.&rdquo; The 18-month estimate for when the Glasswing disclosure flood hits the compliance framework at full velocity is not a comfortable buffer. It is the minimum time required to design, review, pilot, publish, and implement a reformed framework if work starts today. A standard that takes 24 months from concept to publication will miss the window. The CVE/NVD redesign working group needs to be chartered in the next 90 days, not after the first KEV mass-addition event demonstrates the failure empirically.</p>
  </div>
</div>

<!-- ── Takeaway 06 ── -->
<div class="takeaway tk-coral">
  <div class="tk-audience-tag tk-ai-industry">For the AI industry broadly</div>
  <span class="tk-num">Takeaway 06</span>
  <div class="tk-head">Glasswing set the doctrine. It becomes a norm or a competitive disadvantage depending on what happens next. The window for the norm to form is the same window Glasswing opened.</div>

  <p>The Glasswing Doctrine &mdash; withhold a capability with significant dual-use implications, deploy it defensively through a controlled partner structure, disclose the evidence that motivated the decision &mdash; is a good policy framework and a difficult commercial position. Anthropic sacrificed general-release revenue on Mythos to establish this framework. This sacrifice is credible evidence of genuine commitment. It is also a competitive disadvantage relative to any lab that makes a different choice at the same capability threshold.</p>
  <p>The governance question that will determine whether the Glasswing Doctrine becomes a norm is not &ldquo;did Anthropic do the right thing?&rdquo; (they did) but &ldquo;what happens when the 13th lab crosses this threshold?&rdquo; The 13th lab will be making its decision in a context shaped by what happens in the next 18 months: whether the standards bodies produce meaningful governance frameworks, whether governments develop regulatory expectations, whether the industry coalesces around the doctrine or fragments around commercial incentives.</p>

  <div class="ai-industry-actions">
    <div class="aia-section">
      <div class="aia-title">For AI labs that have not yet crossed the capability threshold</div>
      <ul class="bullets">
        <li><strong>Develop your capability evaluation methodology now,</strong> before you need it. The Glasswing decision was made under time pressure: the capability existed before the governance framework. Having a predefined evaluation methodology &mdash; what capability profiles trigger the withholding decision, what evidence is required, what the deployment alternatives are &mdash; means the decision is made deliberately rather than reactively.</li>
        <li><strong>Contribute to AARM standard development.</strong> The governance vacuum for agentic AI security tooling is a collective action problem. Every lab that contributes to the standards development process makes the governance framework more credible and more likely to be adopted across the industry. Labs that sit out the standards development process lose the ability to shape the framework they will eventually operate under.</li>
        <li><strong>Plan for the disclosure context, not just the capability.</strong> When your model crosses the threshold, the disclosure context &mdash; who is told, when, through what channels, with what evidence &mdash; is as important as the capability itself. Glasswing&rsquo;s credibility rests substantially on the transparency of the sandbox escape disclosure. A lab that discovers equivalent capability and attempts to manage the disclosure narrowly will face a different governance context than Anthropic did.</li>
      </ul>
    </div>
    <div class="aia-section">
      <div class="aia-title">For the broader AI research community</div>
      <ul class="bullets">
        <li><strong>Treat capability evaluation research as core safety work,</strong> not as post-hoc compliance. The ability to assess when a model has crossed a Glasswing-equivalent threshold requires evaluation methodology that doesn&rsquo;t currently exist at the standards-body level. The AI safety research community needs to develop and publish this methodology with the same urgency as alignment research &mdash; because the governance decisions that depend on it will be made whether or not the methodology is ready.</li>
        <li><strong>Engage the OSS security community directly.</strong> The Glasswing initiative deploys AI capability against OSS security problems. The OSS security community &mdash; maintainers, SCA tool developers, CVE researchers, registries &mdash; has knowledge about the operational realities of OSS security that the AI research community does not. The governance framework for AI-powered vulnerability discovery will be better if it incorporates both communities&rsquo; perspectives.</li>
      </ul>
    </div>
  </div>

  <div class="tk-action-block">
    <div class="tk-action-label">The structural argument that makes voluntary restraint insufficient</div>
    <p>The Glasswing Doctrine relies on voluntary restraint by actors who have strong commercial incentives to not exercise it. The OSS security ecosystem relied on voluntary contribution by actors who had weak commercial incentives to contribute. Both failed to scale because voluntary systems fail when the cost of volunteering exceeds the individual benefit, even when the collective benefit is enormous. The governance framework that makes the Glasswing Doctrine durable is not more voluntary restraint. It is a mandatory disclosure requirement, a capability evaluation standard that can be independently verified, and an international coordination mechanism that creates the same type of credible commitment device that made nuclear non-proliferation partially (if imperfectly) work. Without these, the doctrine is a good idea that depends on everyone in the field sharing Anthropic&rsquo;s values indefinitely. That is not a governance system. That is a prayer.</p>
  </div>
</div>

<hr class="gw-hr">
<span class="section-label">The questions nobody is asking loudly enough</span>
<h2>Seven thought-provoking ideas that have not entered mainstream security discourse yet</h2>

<div class="thought-grid">
  <div class="thought-card t-purple">
    <span class="thought-label">For everyone</span>
    <h4>Who patches the patcher&rsquo;s patcher?</h4>
    <p>Glasswing finds vulnerabilities in OSS. Maintainers patch them using build pipelines. Those pipelines run scanners. Those scanners were compromised in March 2026. The patch for the vulnerability that Glasswing found is being delivered through the same supply chain that TeamPCP just demonstrated is systemically compromisable. The trust problem doesn&rsquo;t end when the patch is written. It extends through every step of the path from &ldquo;Mythos found a bug&rdquo; to &ldquo;user is running patched software.&rdquo;</p>
  </div>
  <div class="thought-card t-red">
    <span class="thought-label">For security teams</span>
    <h4>Is the compliance framework protecting you or providing the appearance of protection?</h4>
    <p>The European Commission ran Trivy on its CI/CD pipeline because it was required to by its security controls framework. Running Trivy was the compliant behavior. The compliant behavior was the attack vector. If your compliance framework required running Trivy, you were more likely to be compromised than if you had run nothing. A compliance check that increases your actual risk while decreasing your perceived risk is not a security control. It is a liability transfer mechanism.</p>
  </div>
  <div class="thought-card t-teal">
    <span class="thought-label">For OSS maintainers</span>
    <h4>What is the security property of &ldquo;trusted contributor&rdquo; in a post-XZ world?</h4>
    <p>XZ Utils&rsquo; Jia Tan made legitimate, high-quality contributions for two years. By every available signal, Jia Tan was a trustworthy contributor. The trustworthiness of the contributions was the attack. In a world where nation-states will invest multi-year operations in establishing OSS contributor trust, the &ldquo;this person has a good contribution history&rdquo; signal needs to be evaluated against a threat model that includes manufactured contribution history. The security property of &ldquo;trusted contributor&rdquo; has been permanently downgraded.</p>
  </div>
  <div class="thought-card t-amber">
    <span class="thought-label">For AI/ML teams</span>
    <h4>What does &ldquo;model provenance&rdquo; mean when a malicious model is technically correct?</h4>
    <p>Pickle-based model files can contain malicious code alongside valid model weights. A model that produces correct outputs on standard benchmarks while also exfiltrating credentials on load is a correctly functioning model with a malicious secondary function. Standard model evaluation &mdash; accuracy, perplexity, benchmark scores &mdash; does not detect this. The security evaluation of a model file requires analysis of the serialized code, not just the weights. Most ML teams have the former capability and not the latter.</p>
  </div>
  <div class="thought-card t-blue">
    <span class="thought-label">For regulators</span>
    <h4>What happens to national security when the compliance framework fails simultaneously for every agency?</h4>
    <p>The compliance cliff scenario is not just a budget and staffing problem for individual agencies. If the KEV produces hundreds of simultaneous mandates that no federal agency can fully comply with on the required timeline, the entire compliance framework loses credibility. Agencies that cannot comply with the mandate have two choices: request extensions (reasonable but resource-intensive) or silently prioritize (de facto non-compliance). If the second option becomes widespread, the KEV stops being a reliable signal of what federal systems actually prioritize patching. That is a national security consequence, not just an administrative one.</p>
  </div>
  <div class="thought-card t-coral">
    <span class="thought-label">For the AI industry</span>
    <h4>What does the OSS social contract look like after a private AI lab unilaterally rewrote it?</h4>
    <p>The OSS social contract &mdash; take the code, contribute back, the community collectively maintains security &mdash; has operated since the 1980s as a voluntary, distributed governance system. Glasswing implicitly declared that contract insufficient for the current threat environment. Anthropic did not consult the OSS community before making this declaration. The new terms &mdash; a private AI lab scans your code, coordinates findings through its partner network, and releases patches on a timeline it controls &mdash; are better than the old terms in many ways. They were not negotiated. Whether the OSS community accepts or resists the new terms will determine whether Glasswing produces a collaborative governance structure or a contested one.</p>
  </div>
  <div class="thought-card t-purple">
    <span class="thought-label">For everyone</span>
    <h4>If Glasswing finds a vulnerability that&rsquo;s already in a nation-state&rsquo;s exploit inventory, does disclosing it help or hurt?</h4>
    <p>The head-start window assumes Glasswing is ahead of adversaries. For old, stable vulnerabilities in well-analyzed software, that assumption is uncertain. If a nation-state has been holding a zero-day in OpenBSD for several years and Glasswing finds and discloses it, the disclosure may accelerate exploitation by other adversaries who didn&rsquo;t have the zero-day, while providing no additional intelligence to the adversary who did. The net effect of disclosure depends on the distribution of adversary access &mdash; information that Glasswing doesn&rsquo;t have. The disclosure protocol needs to account for this uncertainty.</p>
  </div>
</div>

<div class="final-callout">
  <div class="final-top">
    <p>The common thread across all six takeaways: the new bottleneck is not discovery. It is everything that comes after discovery &mdash; the patching, the disclosure coordination, the compliance response, the governance framework for the tool doing the discovering. Acting on this means redesigning those systems, not adding capacity to them. The window for redesign is the same window that Glasswing&rsquo;s defensive head start opens. The window will not be open twice.</p>
  </div>
  <div class="final-bottom">
    <p>The question that remains for the series finale: is the structural change that all six audiences need actually possible within the head-start window? The pattern from the previous twelve years says: the improvements are real, the structural conditions that produced the vulnerability backlog persist, and the next generation of the problem is already being built on a new substrate while the current one is being addressed. Whether 2026&rsquo;s version of that pattern produces a genuinely different outcome &mdash; structural change rather than incremental improvement &mdash; is the question that Episode 10 will attempt to answer honestly.</p>
  </div>
</div>

<div class="ep-nav-footer">
  <a href="{% post_url 2026-04-15-project-butterfly-of-damocles-part-7 %}" class="ep-nav-prev" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">&#8592; Previous</span>
    <span class="ep-nav-ep-title">Episode 8 &mdash; Part VI: The honest accounting</span>
  </a>
  <a href="{% post_url 2026-04-17-project-butterfly-of-damocles-conclusion %}" class="ep-nav-next" style="text-decoration:none; color:inherit;">
    <span class="ep-nav-dir">Next &#8594;</span>
    <span class="ep-nav-ep-title">Episode 10 &mdash; The pattern: only the substrate changes (series finale)</span>
  </a>
</div>

<div class="tag-row">
  <span class="tag">key takeaways</span><span class="tag">discovery velocity</span>
  <span class="tag">patch velocity</span><span class="tag">CISOs</span>
  <span class="tag">incident response</span><span class="tag">SLSA provenance</span>
  <span class="tag">OIDC publishing</span><span class="tag">OSS maintainers</span>
  <span class="tag">social engineering defense</span>
  <span class="tag">ML infrastructure security</span><span class="tag">credential segmentation</span>
  <span class="tag">LLM gateway architecture</span>
  <span class="tag">CISA KEV reform</span><span class="tag">NVD redesign</span>
  <span class="tag">FedRAMP reform</span><span class="tag">CMMC</span>
  <span class="tag">AI governance</span><span class="tag">voluntary restraint</span>
  <span class="tag">AARM</span><span class="tag">capability evaluation</span>
  <span class="tag">OSS social contract</span>
  <span class="tag">Project Glasswing</span><span class="tag">Project Butterfly of Damocles</span>
</div>

<div class="gw-byline">John Menerick is a senior information security architect and consultant (CISSP, NSA, CKS/CKA). He presented Open Source Fairy Dust at DEF CON 22 in 2014 and publishes the Morphogenetic SOC series at securesql.info. The views expressed are his own and do not represent the views of Anthropic, Project Glasswing, or any Glasswing launch partner.</div>

</div><!-- /glasswing-wrapper -->

{% capture extra_styles %}
<style>
/* ── Episode 9 additional styles ── */
.ep-nav-bar{display:flex;flex-wrap:wrap;align-items:center;gap:.5rem;font-size:.75rem;opacity:.55;margin-bottom:1.5rem;padding:.6rem .875rem;background:rgba(255,255,255,0.04);border-radius:8px}
.ep-nav-sep{opacity:.4}.ep-nav-series{font-weight:700}
.ep-lede{font-style:italic;font-size:1rem;line-height:1.75;margin-bottom:.75rem}
.ep-lede-block{margin-bottom:1.5rem}
.audience-nav{display:flex;flex-wrap:wrap;align-items:center;gap:.5rem;padding:.5rem .75rem;background:rgba(255,255,255,0.04);border-radius:8px;margin-bottom:1.25rem}
.an-label{font-size:.7rem;font-weight:700;opacity:.5;text-transform:uppercase;letter-spacing:.05em}
.an-links{display:flex;flex-wrap:wrap;gap:.25rem}
.an-link{font-size:.73rem;padding:2px 6px;background:rgba(255,255,255,0.04);border-radius:4px;opacity:.7}
.an-sep{font-size:.7rem;opacity:.3}
.tk-audience-tag{display:inline-block;font-size:.65rem;font-weight:700;padding:2px 8px;border-radius:10px;margin-bottom:.3rem;text-transform:uppercase;letter-spacing:.06em}
.tk-everyone{background:rgba(80,80,200,.1);color:#3333aa}
.tk-security{background:rgba(248,113,113,.1);color:#FCA5A5}
.tk-oss    {background:rgba(52,211,153,.1); color:#34D399}
.tk-ml     {background:rgba(251,191,36,.1);  color:#bf360c}
.tk-policy {background:rgba(96,165,250,.1);color:#60A5FA}
.tk-ai-industry{background:rgba(106,27,154,.1);color:#4a148c}
.tk-remediation-grid{display:flex;flex-direction:column;gap:.6rem;margin:1rem 0}
.tk-rem-section{border:1px solid rgba(255,255,255,0.12);border-radius:10px;padding:.9rem 1rem}
.rem-critical{border-left:3px solid #F87171}
.rem-structural{border-left:3px solid #60A5FA}
.tk-rem-title{font-size:.74rem;font-weight:700;opacity:.65;margin-bottom:.5rem}
.rem-critical .tk-rem-title{color:#F87171}
.rem-structural .tk-rem-title{color:#60A5FA}
.tk-action-block{background:rgba(255,255,255,0.04);border-radius:7px;padding:.75rem .875rem;margin:.75rem 0}
.tk-ab-teal{background:rgba(0,105,92,.05);border-left:2px solid rgba(0,150,136,.4)}
.tk-action-label{font-size:.7rem;font-weight:700;opacity:.55;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.3rem}
.tk-action-block p{font-size:.78rem;opacity:.78;line-height:1.6;margin:0}
.tk-timeline-block{margin:.75rem 0}
.tk-tl-item{display:grid;grid-template-columns:68px 1fr;gap:.6rem;font-size:.78rem;padding:.3rem 0;border-bottom:1px solid rgba(255,255,255,0.07)}
.tk-tl-item:last-child{border-bottom:none}
.tk-tl-marker{font-weight:700;opacity:.6;font-size:.73rem}
.tk-urgent  .tk-tl-marker{color:#F87171}
.tk-medium  .tk-tl-marker{color:#FBBF24}
.tk-long    .tk-tl-marker{color:#60A5FA}
.tk-oss-priorities{display:flex;flex-direction:column;gap:.6rem;margin:1rem 0}
.oss-priority{border:1px solid rgba(255,255,255,0.12);border-radius:10px;padding:.9rem 1rem}
.op-critical{border-left:3px solid #F87171}
.op-high    {border-left:3px solid #FBBF24}
.op-medium  {border-left:3px solid #60A5FA}
.op-label{font-size:.72rem;font-weight:700;opacity:.6;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.5rem}
.op-critical .op-label{color:#F87171}
.op-high     .op-label{color:#FBBF24}
.op-medium   .op-label{color:#60A5FA}
.ml-action-grid{display:grid;grid-template-columns:1fr 1fr;gap:.6rem;margin:1rem 0}
.ml-action{border:1px solid rgba(255,255,255,0.12);border-radius:10px;padding:.9rem 1rem}
.ma-critical{border-top:2px solid #F87171}
.ma-ongoing {border-top:2px solid #FBBF24}
.ma-label{font-size:.72rem;font-weight:700;opacity:.6;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.5rem}
.ma-critical .ma-label{color:#F87171}
.ma-ongoing  .ma-label{color:#FBBF24}
.policy-agenda{display:flex;flex-direction:column;gap:.6rem;margin:1rem 0}
.pa-section{border:1px solid rgba(255,255,255,0.12);border-radius:10px;overflow:hidden}
.pa-urgent    {border-top:2px solid #F87171}
.pa-structural{border-top:2px solid #60A5FA}
.pa-title{font-size:.72rem;font-weight:700;opacity:.6;padding:.45rem .875rem;background:rgba(255,255,255,0.04);border-bottom:1px solid rgba(255,255,255,0.08);text-transform:uppercase;letter-spacing:.05em}
.pa-urgent     .pa-title{color:#F87171}
.pa-structural .pa-title{color:#60A5FA}
.pa-items{padding:.5rem .875rem}
.pa-item{padding:.6rem 0;border-bottom:1px solid rgba(255,255,255,0.07)}
.pa-item:last-child{border-bottom:none}
.pa-item h4{font-size:.82rem;font-weight:700;margin-bottom:.3rem}
.pa-item p{font-size:.78rem;opacity:.75;line-height:1.6;margin:0}
.ai-industry-actions{display:flex;flex-direction:column;gap:.5rem;margin:1rem 0}
.aia-section{border:1px solid rgba(255,255,255,0.12);border-radius:10px;padding:.9rem 1rem}
.aia-title{font-size:.72rem;font-weight:700;opacity:.6;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.5rem}
.ep-nav-footer{display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-top:2rem;padding-top:1.25rem;border-top:1px solid rgba(255,255,255,0.12)}
.ep-nav-prev,.ep-nav-next{display:flex;flex-direction:column;gap:.2rem}
.ep-nav-next{text-align:right}
.ep-nav-dir{font-size:.72rem;font-weight:700;opacity:.5}
.ep-nav-ep-title{font-size:.8rem;opacity:.75;line-height:1.4}
/* Dark mode */












@media(max-width:600px){
  .ml-action-grid{grid-template-columns:1fr}
  .ep-nav-footer{grid-template-columns:1fr}
  .ep-nav-next{text-align:left}
  .tk-tl-item{grid-template-columns:56px 1fr}
}
</style>
{% endcapture %}
{{ extra_styles }}
