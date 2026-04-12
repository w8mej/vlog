---
layout: page
title: "Tech Posts"
permalink: /tech_posts/
description: "John Menerick's technical deep dives — AI governance, agentic workloads, cloud security, and applied security engineering."
---

{% include glasswing_styles.html %}
<style>
.page > h1:first-of-type { display: none; }

.blog-post-row {
  display: grid;
  grid-template-columns: 56px 1fr auto;
  gap: 0 1rem;
  padding: .75rem 0;
  border-bottom: 0.5px solid var(--color-border, rgba(255,255,255,0.06));
  align-items: start;
}
.blog-post-row:last-child { border-bottom: none; }
.blog-post-row:hover { background: rgba(255,255,255,0.02); margin: 0 -.5rem; padding-left: .5rem; padding-right: .5rem; border-radius: 6px; }

.blog-date-col {
  font-size: 11px;
  color: var(--color-text-tertiary, #475569);
  font-variant-numeric: tabular-nums;
  padding-top: .15rem;
  line-height: 1.4;
}
.blog-date-day  { font-weight: 600; font-size: 14px; color: var(--color-text-secondary, #94A3B8); line-height: 1; }
.blog-date-mon  { font-size: 10px; text-transform: uppercase; letter-spacing: .06em; }

.blog-post-title {
  font-size: 13px;
  font-weight: 600;
  color: var(--color-text-primary, #F1F5F9);
  text-decoration: none;
  line-height: 1.4;
  display: block;
  margin-bottom: .2rem;
}
.blog-post-title:hover { color: #A78BFA; }
.blog-post-excerpt {
  font-size: 12px;
  color: var(--color-text-secondary, #94A3B8);
  line-height: 1.5;
  margin: 0;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
.blog-post-cats {
  display: flex;
  flex-wrap: wrap;
  gap: .25rem;
  margin-top: .3rem;
}
.blog-cat-tag {
  font-size: 10px;
  padding: 1px 6px;
  border-radius: 8px;
  background: rgba(52,211,153,0.08);
  color: #6EE7B7;
  border: 0.5px solid rgba(52,211,153,0.18);
}

.blog-year-label {
  font-size: 11px;
  font-weight: 700;
  letter-spacing: .08em;
  text-transform: uppercase;
  color: var(--color-text-tertiary, #475569);
  display: block;
  margin: 1.75rem 0 .5rem;
  padding-bottom: .35rem;
  border-bottom: 0.5px solid var(--color-border, rgba(255,255,255,0.06));
}

.archive-row {
  display: flex;
  align-items: baseline;
  gap: .75rem;
  padding: .3rem 0;
  border-bottom: 0.5px solid rgba(255,255,255,0.03);
}
.archive-date {
  font-size: 11px;
  color: var(--color-text-tertiary, #475569);
  white-space: nowrap;
  min-width: 64px;
  font-variant-numeric: tabular-nums;
}
.archive-link {
  font-size: 12px;
  color: var(--color-text-secondary, #94A3B8);
  text-decoration: none;
  line-height: 1.4;
}
.archive-link:hover { color: #A78BFA; }

@media (max-width: 600px) {
  .blog-post-row { grid-template-columns: 44px 1fr; }
}
</style>

{% assign all_tech = site.tech_posts | sort: "date" | reverse %}
{% assign recent_tech = all_tech | limit: 8 %}

<div class="glasswing-wrapper">
<div class="s3-intro-block">

  <div class="s3-series-header">
    <div class="s3-series-badge">
      <span class="s3-badge-dot" aria-hidden="true"></span>
      AI Governance &middot; Agentic Security &middot; Cloud Infrastructure &middot; Applied Engineering
    </div>
    <h2 class="s3-series-title-display">Technical Intelligence Archive</h2>
    <p class="s3-series-subtitle-display">Practitioner-grade technical deep dives on agentic workloads, AI security architecture, cloud infrastructure, and applied security engineering.</p>
  </div>

  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:.5rem;margin:1.5rem 0;">
    <div class="s3-ss"><div class="s3-ss-num">{{ all_tech | size }}</div><div class="s3-ss-sub">Tech posts published</div></div>
    <div class="s3-ss"><div class="s3-ss-num">AI / Cloud</div><div class="s3-ss-sub">Primary focus areas</div></div>
    <div class="s3-ss"><div class="s3-ss-num">Long-form</div><div class="s3-ss-sub">Practitioner depth</div></div>
  </div>

</div><!-- /s3-intro-block -->

<hr class="s3-hr">
<span class="s3-section-label">Recent Posts</span>

<div style="margin:1rem 0;">
  {% for post in recent_tech %}
  <div class="blog-post-row">
    <div class="blog-date-col">
      <div class="blog-date-day">{{ post.date | date: "%-d" }}</div>
      <div class="blog-date-mon">{{ post.date | date: "%b %Y" }}</div>
    </div>
    <div>
      <a href="{{ post.url }}" class="blog-post-title">{{ post.title }}</a>
      {% if post.excerpt %}
      <p class="blog-post-excerpt">{{ post.excerpt | strip_html | strip_newlines | truncatewords: 22 }}</p>
      {% endif %}
      {% if post.categories.size > 0 %}
      <div class="blog-post-cats">
        {% for cat in post.categories limit:3 %}
        <span class="blog-cat-tag">{{ cat }}</span>
        {% endfor %}
      </div>
      {% endif %}
    </div>
    <div style="padding-top:.1rem;">
      <a href="{{ post.url }}" style="font-size:11px;font-weight:600;color:#60A5FA;text-decoration:none;white-space:nowrap;">Read &rarr;</a>
    </div>
  </div>
  {% endfor %}
  {% if all_tech.size == 0 %}
  <p style="font-size:13px;color:var(--color-text-tertiary,#475569);padding:1rem 0;">No tech posts yet &mdash; check back soon.</p>
  {% endif %}
</div>

<hr class="s3-hr">
<span class="s3-section-label">Full Archive</span>

{% assign postsByYear = all_tech | group_by_exp:"post", "post.date | date: '%Y'" %}
{% for year in postsByYear %}
<span class="blog-year-label">{{ year.name }}</span>
<div>
  {% for post in year.items %}
  <div class="archive-row">
    <span class="archive-date">{{ post.date | date: "%b %-d" }}</span>
    <a href="{{ post.url }}" class="archive-link">{{ post.title }}</a>
  </div>
  {% endfor %}
</div>
{% endfor %}
{% if postsByYear.size == 0 %}
<p style="font-size:12px;color:var(--color-text-tertiary,#475569);padding:.5rem 0;">Archive is empty.</p>
{% endif %}

</div><!-- /glasswing-wrapper -->
