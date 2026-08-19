---
layout: default
title: Search
permalink: /search/
description: "Search 145 posts on detection engineering, zero trust, supply chain security, and autonomous security operations."
---

<div class="ed-index">

  <header class="ed-page-head">
    <div class="ed-kicker">Search</div>
    <h1 class="ed-page-title">Find something specific</h1>
    <p class="ed-page-standfirst">{{ site.posts | size }} posts indexed by title, date, and body copy.</p>
  </header>

  <div class="ed-search">
    <label class="ed-side-label" for="search-input">Search the archive</label>
    <input type="search" id="search-input" class="ed-search-input" placeholder="Detection engineering, SBOM, zero trust&hellip;" autocomplete="off" autofocus />
    <ul id="results-container" class="ed-search-results"></ul>
  </div>

</div>

<script src="{{ site.baseurl }}/assets/simple-jekyll-search.min.js" defer></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    SimpleJekyllSearch({
      searchInput: document.getElementById('search-input'),
      resultsContainer: document.getElementById('results-container'),
      searchResultTemplate:
        '<li class="ed-search-hit">' +
          '<a class="ed-search-hit-title" href="{url}">{title}</a>' +
          '<span class="ed-search-hit-date">{date}</span>' +
        '</li>',
      noResultsText: '<li class="ed-search-empty">No posts match that query.</li>',
      json: '{{ site.baseurl }}/search.json'
    });
  });
</script>
