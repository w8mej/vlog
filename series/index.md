---
layout: default
title: "Series | securesql.info"
description: "Curated multi-part series on security engineering, AI-driven operations, and complex systems science. Each series pairs blog episodes with whitepapers, podcasts, and interactive resources."
permalink: /series/
---

<article class="series-hub">
  <header class="series-hub__header">
    <h1>Series</h1>
    <p class="series-hub__lead">Deep-dive collections on the ideas reshaping how we think about and build security. Each series pairs original research, long-form posts, and companion materials—podcasts, whitepapers, infographics—into a coherent arc you can follow start to finish.</p>
  </header>

  <section class="series-hub__grid">

    <!-- Season 1 -->
    <a class="series-card" href="/series/autonomous-ai-soc/">
      <div class="series-card__season">Season 1</div>
      <h2 class="series-card__title">Autonomous AI SOC</h2>
      <p class="series-card__subtitle">Energy-Based Models Meet SecOps</p>
      <p class="series-card__desc">Eight episodes exploring how energy-based anomaly detection, AI-driven ETL, self-improving playbooks, and autonomous response loops combine to build a next-generation security operations center—without the alert fatigue.</p>
      <ul class="series-card__meta">
        <li>📺 8 Episodes</li>
        <li>🎙️ Podcast companion</li>
        <li>📄 Whitepaper</li>
        <li>📊 Infographics</li>
      </ul>
      <span class="series-card__cta">Explore the series →</span>
    </a>

    <!-- Season 2 -->
    <a class="series-card" href="/series/morphogenetic-soc/">
      <div class="series-card__season">Season 2</div>
      <h2 class="series-card__title">Morphogenetic SOC</h2>
      <p class="series-card__subtitle">Complex Systems Science in Security Engineering</p>
      <p class="series-card__desc">Nine episodes applying biological control theory—TAME, Ashby's Law, bioelectricity, and governed agency—to security architecture. Complete with whitepaper, executive deck, infographic, YouTube walkthrough, and mind map.</p>
      <ul class="series-card__meta">
        <li>📺 9 Episodes</li>
        <li>📄 Whitepaper + Exec Deck</li>
        <li>📊 Infographic + Mind Map</li>
        <li>🎬 YouTube Series</li>
      </ul>
      <span class="series-card__cta">Explore the series →</span>
    </a>

    <!-- Season 3 -->
    <a class="series-card" href="/series/project-butterfly-of-damocles/">
      <div class="series-card__season">Season 3</div>
      <h2 class="series-card__title">Project Butterfly of Damocles</h2>
      <p class="series-card__subtitle">A decade of being right about the wrong thing</p>
      <p class="series-card__desc">Ten episodes exploring Project Glasswing, AI capability withholding, and the new attack surface of the ML dependency graph. A deep dive into the most consequential AI security policy decisions of the decade.</p>
      <ul class="series-card__meta">
        <li>📺 10 Episodes</li>
        <li>📄 Whitepaper</li>
        <li>📊 Infographics</li>
      </ul>
      <span class="series-card__cta">Explore the series →</span>
    </a>

  </section>
</article>

<style>
.series-hub { max-width: 960px; margin: 0 auto; padding: 2rem 1rem 4rem; }
.series-hub__header { margin-bottom: 2.5rem; }
.series-hub__header h1 { font-size: 2.4rem; margin-bottom: 0.5rem; }
.series-hub__lead { font-size: 1.1rem; opacity: 0.85; max-width: 680px; line-height: 1.6; }
.series-hub__grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 1.5rem; }
.series-card { display: flex; flex-direction: column; gap: 0.6rem; border: 1px solid rgba(255,255,255,0.12); border-radius: 12px; padding: 1.8rem; text-decoration: none; color: inherit; background: rgba(255,255,255,0.03); transition: border-color 0.2s, background 0.2s; }
.series-card:hover { border-color: rgba(100,200,255,0.5); background: rgba(100,200,255,0.05); }
.series-card__season { font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.08em; opacity: 0.55; }
.series-card__title { font-size: 1.5rem; margin: 0; }
.series-card__subtitle { font-size: 0.9rem; opacity: 0.7; margin: 0; }
.series-card__desc { font-size: 0.9rem; line-height: 1.6; opacity: 0.85; }
.series-card__meta { list-style: none; padding: 0; margin: 0.5rem 0; display: flex; flex-wrap: wrap; gap: 0.5rem; }
.series-card__meta li { font-size: 0.78rem; background: rgba(255,255,255,0.07); border-radius: 4px; padding: 0.2rem 0.5rem; }
.series-card__cta { font-size: 0.85rem; color: #64c8ff; margin-top: auto; }
</style>
