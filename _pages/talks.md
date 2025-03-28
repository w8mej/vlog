---
layout: page
permalink: /talks/
title: Lectures & Conversations
---

<div class="talks">
  {% for talk in site.data.talks %}
  <div class="talk-item" style="margin-bottom: 2em;">
    <h3>{{ talk.title }}</h3>
    <p><strong>Date:</strong> {{ talk.date }}</p>
    <p><strong>Event/Location:</strong> {{ talk.event }}</p>

    {% if talk.slides %}
    <p><a href="{{ talk.slides }}" target="_blank">📑 View Slides</a></p>
    {% endif %}

    {% if talk.video %}
    <div class="video-responsive" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;">
      <iframe src="https://www.youtube.com/embed/{{ talk.video }}" frameborder="0" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;"></iframe>
    </div>
    {% endif %}

    {% if talk.description %}
    <p>{{ talk.description }}</p>
    {% endif %}
  </div>
  <hr />
  {% endfor %}
</div>
