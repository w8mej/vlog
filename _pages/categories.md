---
layout: default
permalink: /categories/
title: Categories
description: "Browse every post by subject — detection engineering, zero trust, supply chain security, AI governance, and more."
---

<div class="ed-index">

  <header class="ed-page-head">
    <div class="ed-kicker">Index</div>
    <h1 class="ed-page-title">{{ page.title }}</h1>
    <p class="ed-page-standfirst">{{ page.description }}</p>
  </header>

  <nav class="ed-catnav" aria-label="Jump to category">
    {% for category in site.categories %}
    {% assign category_name = category | first %}
    <a href="#{{ category_name | slugize }}">{{ category_name }} <span class="ed-catnav-count">{{ site.categories[category_name] | size }}</span></a>
    {% endfor %}
  </nav>

  {% for category in site.categories %}
  {% assign category_name = category | first %}
  <section class="ed-block" id="{{ category_name | slugize }}">
    <div class="ed-block-head">
      <h2 class="ed-block-title">{{ category_name }}</h2>
      <span class="ed-meta">{{ site.categories[category_name] | size }} post{% if site.categories[category_name].size != 1 %}s{% endif %}</span>
    </div>

    <div class="ed-archive-list">
      {% for post in site.categories[category_name] %}
      <a class="ed-archive-row" href="{{ site.baseurl }}{{ post.url }}">
        <span class="ed-archive-date">{{ post.date | date: "%b %Y" }}</span>
        <span class="ed-archive-title">{% if post.title and post.title != "" %}{{ post.title }}{% else %}{{ post.excerpt | strip_html | truncate: 90 }}{% endif %}</span>
        {% if post.series %}<span class="ed-archive-tag">{{ post.series_name | default: "Series" }}</span>{% endif %}
      </a>
      {% endfor %}
    </div>
  </section>
  {% endfor %}

</div>
