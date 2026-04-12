---
layout: page
permalink: /casting/
title: "Live Intelligence Broadcasts — John Menerick"
description: "John Menerick streams live threat-hunting, security deep-dives, and podcast transmissions across Twitch, YouTube, and Spotify."
---

{% include glasswing_styles.html %}
<style>
.page > h1:first-of-type { display: none; }

.platform-block {
  margin: 1.25rem 0;
}
.platform-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: .875rem;
  padding-bottom: .75rem;
  border-bottom: 0.5px solid var(--color-border, rgba(255,255,255,0.06));
}
.platform-icon {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  flex-shrink: 0;
}
.platform-icon.twitch  { background: rgba(145,70,255,0.15); border: 0.5px solid rgba(145,70,255,0.3); }
.platform-icon.youtube { background: rgba(255,70,70,0.12);  border: 0.5px solid rgba(255,70,70,0.25); }
.platform-icon.podcast { background: rgba(52,211,153,0.10); border: 0.5px solid rgba(52,211,153,0.22); }

.platform-meta { flex: 1; }
.platform-name {
  font-size: 15px;
  font-weight: 700;
  color: var(--color-text-primary, #F1F5F9);
  margin: 0 0 .1rem;
}
.platform-tagline {
  font-size: 11px;
  color: var(--color-text-tertiary, #475569);
  font-style: italic;
}
.platform-follow {
  font-size: 11px;
  font-weight: 600;
  padding: .35rem .75rem;
  border-radius: 6px;
  text-decoration: none;
  white-space: nowrap;
}
.platform-follow.twitch  { background: rgba(145,70,255,0.15); color: #C4B5FD; border: 0.5px solid rgba(145,70,255,0.3); }
.platform-follow.youtube { background: rgba(255,70,70,0.12);  color: #FCA5A5; border: 0.5px solid rgba(255,70,70,0.25); }
.platform-follow.podcast { background: rgba(52,211,153,0.10); color: #6EE7B7; border: 0.5px solid rgba(52,211,153,0.22); }
.platform-follow:hover { opacity: .8; }

.platform-points {
  display: flex;
  flex-wrap: wrap;
  gap: .4rem;
  margin-bottom: .875rem;
}
.platform-point {
  font-size: 11px;
  color: var(--color-text-secondary, #94A3B8);
  background: var(--color-bg-secondary, #1E293B);
  border: 0.5px solid var(--color-border, rgba(255,255,255,0.06));
  border-radius: 6px;
  padding: .3rem .65rem;
  line-height: 1.3;
}

.embed-wrap {
  border-radius: 10px;
  overflow: hidden;
  border: 0.5px solid var(--color-border, rgba(255,255,255,0.08));
  background: #0a0a0a;
  position: relative;
}
.embed-wrap iframe {
  display: block;
  width: 100%;
  border: none;
}
.embed-wrap.tall  { height: 400px; }
.embed-wrap.short { height: 200px; }

.signal-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: .75rem;
  margin: 1.25rem 0;
}
.signal-card {
  background: var(--color-bg-secondary, #1E293B);
  border: 0.5px solid var(--color-border, rgba(255,255,255,0.06));
  border-radius: 10px;
  padding: 1rem 1.1rem;
}
.signal-card h4 { font-size: 13px; font-weight: 600; color: var(--color-text-primary, #F1F5F9); margin: 0 0 .35rem; }
.signal-card p  { font-size: 12px; color: var(--color-text-secondary, #94A3B8); line-height: 1.6; margin: 0; }

.connect-row {
  display: flex;
  flex-wrap: wrap;
  gap: .5rem;
  margin: 1rem 0;
}
.connect-btn {
  display: inline-flex;
  align-items: center;
  gap: .4rem;
  font-size: 12px;
  font-weight: 600;
  padding: .5rem 1rem;
  border-radius: 7px;
  text-decoration: none;
  letter-spacing: .02em;
}
.connect-btn.twitch  { background: rgba(145,70,255,0.14); color: #C4B5FD; border: 0.5px solid rgba(145,70,255,0.28); }
.connect-btn.youtube { background: rgba(255,70,70,0.11);  color: #FCA5A5; border: 0.5px solid rgba(255,70,70,0.22); }
.connect-btn.podcast { background: rgba(52,211,153,0.09); color: #6EE7B7; border: 0.5px solid rgba(52,211,153,0.2);  }
.connect-btn.email   { background: rgba(251,191,36,0.09);  color: #FCD34D; border: 0.5px solid rgba(251,191,36,0.2); }
.connect-btn:hover   { opacity: .8; }

.hero-image-wrap {
  float: right;
  margin: 0 0 1rem 1.5rem;
  border-radius: 12px;
  overflow: hidden;
  border: 0.5px solid rgba(139,92,246,0.25);
  width: clamp(140px, 28%, 220px);
}
.hero-image-wrap img { width: 100%; height: auto; display: block; }

@media (max-width: 600px) {
  .signal-grid { grid-template-columns: 1fr; }
  .hero-image-wrap { float: none; width: 120px; margin: 0 auto 1rem; }
}
</style>

<div class="glasswing-wrapper">
<div class="s3-intro-block">

  <div class="s3-series-header">
    <div class="hero-image-wrap">
      <img src="https://securesql.info/images/cybercowboy2.png.avif"
           alt="John Menerick — cybersecurity broadcaster"
           width="275" height="412"
           fetchpriority="high">
    </div>

    <div class="s3-series-badge">
      <span class="s3-badge-dot" aria-hidden="true"></span>
      Live Streaming &middot; Threat Intelligence &middot; Podcast
    </div>
    <h2 class="s3-series-title-display">Live Intelligence<br>Broadcasts</h2>
    <p class="s3-series-subtitle-display">Threat-hunting live streams, security deep-dives, and coded transmissions from the edge of applied security &mdash; across Twitch, YouTube, and Spotify.</p>
  </div>

  <p class="s3-lede">In a networked era drowning in digital noise, signal matters more than volume. These broadcasts cut through — live threat scenarios, unscripted, interactive. Part engineer, part analyst: decoding what&rsquo;s happening before the industry names it.</p>

  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:.5rem;margin:1.5rem 0;">
    <div class="s3-ss"><div class="s3-ss-num">Twitch</div><div class="s3-ss-sub">Live threat-hunting streams</div></div>
    <div class="s3-ss"><div class="s3-ss-num">YouTube</div><div class="s3-ss-sub">Deep-dive security series</div></div>
    <div class="s3-ss"><div class="s3-ss-num">Podcast</div><div class="s3-ss-sub">Infosec frontier conversations</div></div>
  </div>

</div><!-- /s3-intro-block -->

<hr class="s3-hr">

<!-- ═══════════════════════════════════ TWITCH ═══════════════════════════════════ -->
<div class="platform-block">
  <div class="platform-header">
    <div class="platform-icon twitch">📡</div>
    <div class="platform-meta">
      <div class="platform-name">Twitch — Complex Systems Live</div>
      <div class="platform-tagline">Raw, unscripted, real-time</div>
    </div>
    <a href="https://www.twitch.tv/w8mej" target="_blank" class="platform-follow twitch">Follow →</a>
  </div>

  <div class="platform-points">
    <span class="platform-point">Live threat-hunting scenarios</span>
    <span class="platform-point">Real-time attack &amp; defense demos</span>
    <span class="platform-point">Interactive hacking sessions</span>
    <span class="platform-point">Unscripted incident walkthroughs</span>
    <span class="platform-point">Viewer Q&amp;A and direct engagement</span>
  </div>

  <div class="embed-wrap tall">
    <iframe
        src="https://player.twitch.tv/?channel=w8mej&parent=www.securesql.info&autoplay=true&muted=true"
        height="400"
        allowfullscreen
        loading="lazy"
        title="John Menerick live on Twitch">
    </iframe>
  </div>
</div>

<hr class="s3-hr">

<!-- ═══════════════════════════════════ YOUTUBE ══════════════════════════════════ -->
<div class="platform-block">
  <div class="platform-header">
    <div class="platform-icon youtube">▶</div>
    <div class="platform-meta">
      <div class="platform-name">YouTube — Glitched Realities &amp; Security Exploits</div>
      <div class="platform-tagline">High-impact, zero-noise security analysis</div>
    </div>
    <a href="https://youtube.com/channel/UCUfaf6mQgh_cX6V-SaAww1w" target="_blank" class="platform-follow youtube">Subscribe →</a>
  </div>

  <div class="platform-points">
    <span class="platform-point">Concise cyber defense frameworks</span>
    <span class="platform-point">Critical vulnerability walkthroughs</span>
    <span class="platform-point">Emergent threat breakdowns</span>
    <span class="platform-point">Applied AI security analysis</span>
    <span class="platform-point">Supply chain attack reconstructions</span>
  </div>

  <div class="embed-wrap tall">
    <div class="youtube-facade" data-id="PLqkNg6Ph1jC-ey6nGNwx5jSx99VTj0RY7" style="background-image:url('{{ site.baseurl }}/images/youtube-facade.png');height:400px;background-size:cover;background-position:center;display:flex;align-items:center;justify-content:center;cursor:pointer;">
      <div class="play-button" style="width:68px;height:48px;background:rgba(255,0,0,0.85);border-radius:12px;display:flex;align-items:center;justify-content:center;">
        <svg viewBox="0 0 24 24" width="28" height="28" fill="white"><path d="M8 5v14l11-7z"/></svg>
      </div>
    </div>
  </div>
</div>

<hr class="s3-hr">

<!-- ═══════════════════════════════════ PODCAST ══════════════════════════════════ -->
<div class="platform-block">
  <div class="platform-header">
    <div class="platform-icon podcast">🎙</div>
    <div class="platform-meta">
      <div class="platform-name">Podcast — Dark Signals from the Infosec Fringe</div>
      <div class="platform-tagline">Transmissions from the edge of AI security</div>
    </div>
    <a href="https://open.spotify.com/show/4BZNfTMlJ5iCD9bUW13sNq?si=301d39755a0f4c41" target="_blank" class="platform-follow podcast">Listen →</a>
  </div>

  <div class="platform-points">
    <span class="platform-point">Unfiltered infosec dialogues</span>
    <span class="platform-point">AI security and trusted compute</span>
    <span class="platform-point">Supply chain and nation-state analysis</span>
    <span class="platform-point">Speculative security futures</span>
    <span class="platform-point">Practitioners and counterculture analysts</span>
  </div>

  <div class="embed-wrap short">
    <iframe
        src="https://open.spotify.com/embed/show/4BZNfTMlJ5iCD9bUW13sNq?utm_source=generator"
        height="200"
        frameborder="0"
        allowfullscreen
        allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
        loading="lazy"
        title="John Menerick Security Podcast on Spotify">
    </iframe>
  </div>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Why Signal Over Noise</span>

<div class="signal-grid">
  <div class="signal-card">
    <h4>Precision over volume</h4>
    <p>No padding, no sponsored content, no algorithm-chasing. Each broadcast exists because there&rsquo;s something specific worth understanding — a technique, an incident, an architectural decision that changes how you think about defense.</p>
  </div>
  <div class="signal-card">
    <h4>Practitioner perspective</h4>
    <p>11+ years in Fortune 500 environments, DARPA competitions, and national security contexts. The analysis comes from someone who has written the detections, built the pipelines, and presented at DEF CON — not from a content calendar.</p>
  </div>
  <div class="signal-card">
    <h4>Interactive and live</h4>
    <p>Twitch sessions are unscripted. Viewer questions shape the direction. Threat scenarios play out in real time. The feedback loop between question and demonstration is the point.</p>
  </div>
  <div class="signal-card">
    <h4>Cross-platform continuity</h4>
    <p>Each platform serves a different depth: Twitch for real-time engagement, YouTube for replayable deep-dives, Podcast for long-form analysis you can absorb anywhere. The same signal, three formats.</p>
  </div>
</div>

<hr class="s3-hr">
<span class="s3-section-label">Connect</span>

<div class="connect-row">
  <a href="https://www.twitch.tv/w8mej" target="_blank" class="connect-btn twitch">📡 Twitch</a>
  <a href="https://youtube.com/channel/UCUfaf6mQgh_cX6V-SaAww1w" target="_blank" class="connect-btn youtube">▶ YouTube</a>
  <a href="https://open.spotify.com/show/4BZNfTMlJ5iCD9bUW13sNq?si=301d39755a0f4c41" target="_blank" class="connect-btn podcast">🎙 Podcast</a>
  <a href="mailto:picklejar@haxx.ninja" class="connect-btn email">✉ Contact</a>
</div>

<div class="pullquote">
  <p>The future won&rsquo;t wait. Neither should your threat model.</p>
  <span class="attr">&mdash; securesql.info</span>
</div>

</div><!-- /glasswing-wrapper -->
