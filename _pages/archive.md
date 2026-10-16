---
layout: default
permalink: /archive/
title: Archived Experiments
kicker: Archive
description: "Every post, oldest to newest — experiments, research notes, and field write-ups going back to 2012."
---

<div class="ed-index">

  <header class="ed-page-head">
    <div class="ed-kicker">Archive</div>
    <h1 class="ed-page-title">{{ page.title }}</h1>
    <p class="ed-page-standfirst">{{ page.description }}</p>
  </header>

  <section class="ed-block">
    <div class="ed-block-head">
      <h2 class="ed-block-title">Every post</h2>
      <span class="ed-meta">{{ site.posts | size }} total</span>
    </div>

    {% assign postsByYear = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}
    {% for year in postsByYear %}
    <div class="ed-year">
      <div class="ed-year-label">{{ year.name }}</div>
      <div class="ed-archive-list">
        {% for post in year.items %}
        <a class="ed-archive-row" href="{{ site.baseurl }}{{ post.url }}">
          <span class="ed-archive-date">{{ post.date | date: "%b %-d" }}</span>
          <span class="ed-archive-title">{% if post.title and post.title != "" %}{{ post.title }}{% else %}{{ post.excerpt | strip_html | truncate: 90 }}{% endif %}</span>
          {% if post.series %}<span class="ed-archive-tag">{{ post.series_name | default: "Series" }}</span>{% endif %}
        </a>
        {% endfor %}
      </div>
    </div>
    {% endfor %}
  </section>

</div>
