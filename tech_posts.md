---
layout: page
title: "Tech Posts"
permalink: /tech_posts/
---

<ul>
  {% for post in site.tech_posts reversed %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <small>({{ post.date | date: "%B %-d, %Y" }})</small>
    <p>{{ post.excerpt }}</p>
  </li>
  {% endfor %}
</ul>
