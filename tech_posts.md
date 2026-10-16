---
layout: default
title: "Tech Posts"
permalink: /tech_posts/
description: "John Menerick's technical deep dives — AI governance, agentic workloads, cloud security, and applied security engineering."
---

{% assign all_tech = site.tech_posts | sort: "date" | reverse %}
{% assign recent_tech = all_tech | limit: 8 %}

<div class="ed-index">

  <header class="ed-page-head">
    <div class="ed-kicker">AI governance &middot; Agentic security &middot; Cloud infrastructure</div>
    <h1 class="ed-page-title">Technical intelligence archive</h1>
    <p class="ed-page-standfirst">Practitioner-grade technical deep dives on agentic workloads, AI security architecture, cloud infrastructure, and applied security engineering.</p>
  </header>

  <div class="ed-statbar" style="grid-template-columns: repeat(3, minmax(0, 1fr));">
    <div class="ed-stat"><div class="ed-stat-num">{{ all_tech | size }}</div><div class="ed-stat-label">Tech posts published</div></div>
    <div class="ed-stat"><div class="ed-stat-num">AI / Cloud</div><div class="ed-stat-label">Primary focus areas</div></div>
    <div class="ed-stat"><div class="ed-stat-num">Long-form</div><div class="ed-stat-label">Practitioner depth</div></div>
  </div>

  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Recent posts</h2>
      {% if all_tech.size > 8 %}<a class="ed-textlink" href="#tech-archive">Jump to archive &darr;</a>{% endif %}
    </div>

    {% if all_tech.size > 0 %}
    <div class="ed-rows">
      {% for post in recent_tech %}
      <article class="ed-row" style="grid-template-columns: minmax(0, 1fr);">
        <div class="ed-row-body">
          {% if post.categories.size > 0 %}
          <div class="ed-kicker">
            {% for cat in post.categories limit:3 %}{{ cat }}{% unless forloop.last %} &middot; {% endunless %}{% endfor %}
          </div>
          {% endif %}
          <h3 class="ed-row-title"><a href="{{ post.url }}">{{ post.title }}</a></h3>
          {% if post.excerpt %}
          <p class="ed-row-excerpt">{{ post.excerpt | strip_html | strip_newlines | truncatewords: 30 }}</p>
          {% endif %}
          <div class="ed-meta">
            {{ post.date | date: "%B %-d, %Y" }}
            &middot; {{ post.content | number_of_words | divided_by: 200 | plus: 1 }}-minute read
          </div>
        </div>
      </article>
      {% endfor %}
    </div>
    {% else %}
    <p class="ed-empty">No tech posts yet &mdash; check back soon.</p>
    {% endif %}
  </section>

  {% if all_tech.size > 0 %}
  <section class="ed-block" id="tech-archive">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Full archive</h2>
      <span class="ed-meta">{{ all_tech | size }} post{% if all_tech.size != 1 %}s{% endif %}</span>
    </div>

    {% assign postsByYear = all_tech | group_by_exp: "post", "post.date | date: '%Y'" %}
    {% for year in postsByYear %}
    <div class="ed-year">
      <div class="ed-year-label">{{ year.name }}</div>
      <div class="ed-archive-list">
        {% for post in year.items %}
        <a class="ed-archive-row" href="{{ post.url }}">
          <span class="ed-archive-date">{{ post.date | date: "%b %-d" }}</span>
          <span class="ed-archive-title">{{ post.title }}</span>
          {% if post.categories.first %}<span class="ed-archive-tag">{{ post.categories.first }}</span>{% endif %}
        </a>
        {% endfor %}
      </div>
    </div>
    {% endfor %}
  </section>
  {% endif %}

</div>
