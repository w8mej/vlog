---
layout: post
title: "Part III — Silicon Valley's new attack surface: the machine learning dependency graph"
date: 2026-04-12
series: project-butterfly-of-damocles
series_name: "Project Butterfly of Damocles"
episode: 5
categories: ["Security", "Open Source", "Project Glasswing", "Machine Learning"]
excerpt: "In 2014 the scariest projects were Exim, Bind, and OpenSSL. In 2026 the load-bearing walls include PyTorch, TensorFlow, and LiteLLM."
---

{% include glasswing_styles.html %}

<div class="glasswing-wrapper">

  <span class="section-label">Part III &mdash; The ML stack</span>
  <h2>Silicon Valley&rsquo;s new attack surface: the machine learning dependency graph</h2>
  <p>In 2014 the scariest projects were Exim, Bind, and OpenSSL. In 2026 the load-bearing walls include PyTorch, TensorFlow, ONNX Runtime, HuggingFace, LiteLLM, and Ray. Their vulnerability surface is underaudited relative to deployment footprint by an order of magnitude. The LiteLLM compromise crystallized a new failure mode: a single breach in the AI gateway layer exposes every LLM API key an organization holds, across every provider, simultaneously. This is an architectural consequence of centralizing credential management for a distributed AI stack &mdash; and it is the standard deployment pattern.</p>

  <div class="ml-section">
    <div class="ml-layer">
      <div class="ml-layer-label">Hardware / Firmware</div>
      <div class="ml-row"><div class="ml-name">CUDA runtime</div><div class="ml-bar-outer"><div class="ml-bar" style="width:72%;background:var(--red-dark)"></div></div><div class="ml-stat" style="color:var(--red-dark)">72 CVEs &middot; high</div></div>
      <div class="ml-row"><div class="ml-name">NVIDIA drivers</div><div class="ml-bar-outer"><div class="ml-bar" style="width:68%;background:#EF9F27"></div></div><div class="ml-stat" style="color:var(--amber-dark)">200+ CVEs &middot; high</div></div>
    </div>
    <div class="ml-layer">
      <div class="ml-layer-label">Frameworks</div>
      <div class="ml-row"><div class="ml-name">TensorFlow</div><div class="ml-bar-outer"><div class="ml-bar" style="width:90%;background:var(--red-dark)"></div></div><div class="ml-stat" style="color:var(--red-dark)">700+ CVEs &middot; critical</div></div>
      <div class="ml-row"><div class="ml-name">PyTorch</div><div class="ml-bar-outer"><div class="ml-bar" style="width:82%;background:var(--red-dark)"></div></div><div class="ml-stat" style="color:var(--red-dark)">~150 CVEs &middot; critical supply chain</div></div>
      <div class="ml-row"><div class="ml-name">ONNX Runtime</div><div class="ml-bar-outer"><div class="ml-bar" style="width:55%;background:#EF9F27"></div></div><div class="ml-stat" style="color:var(--amber-dark)">~40 CVEs &middot; high</div></div>
    </div>
    <div class="ml-layer">
      <div class="ml-layer-label">Model / Data Layer</div>
      <div class="ml-row"><div class="ml-name">HuggingFace Hub</div><div class="ml-bar-outer"><div class="ml-bar" style="width:65%;background:var(--red-dark)"></div></div><div class="ml-stat" style="color:var(--red-dark)">Pickle deserialization RCE &middot; critical</div></div>
      <div class="ml-row"><div class="ml-name">safetensors</div><div class="ml-bar-outer"><div class="ml-bar" style="width:22%;background:var(--teal-dark)"></div></div><div class="ml-stat" style="color:var(--teal-dark)">Low &middot; improving</div></div>
      <div class="ml-row"><div class="ml-name">MLflow / W&amp;B</div><div class="ml-bar-outer"><div class="ml-bar" style="width:58%;background:#EF9F27"></div></div><div class="ml-stat" style="color:var(--amber-dark)">SSRF / path traversal &middot; high</div></div>
    </div>
    <div class="ml-layer">
      <div class="ml-layer-label">AI Gateway / Serving</div>
      <div class="ml-row"><div class="ml-name">LiteLLM</div><div class="ml-bar-outer"><div class="ml-bar" style="width:95%;background:var(--red-dark)"></div></div><div class="ml-stat" style="color:var(--red-dark)">TeamPCP Mar 2026 &middot; critical</div></div>
      <div class="ml-row"><div class="ml-name">Ray</div><div class="ml-bar-outer"><div class="ml-bar" style="width:78%;background:var(--red-dark)"></div></div><div class="ml-stat" style="color:var(--red-dark)">ShadowRay unauth RCE &middot; critical</div></div>
      <div class="ml-row"><div class="ml-name">LangChain</div><div class="ml-bar-outer"><div class="ml-bar" style="width:69%;background:var(--red-dark)"></div></div><div class="ml-stat" style="color:var(--red-dark)">Prompt injection + SSRF chains</div></div>
      <div class="ml-row"><div class="ml-name">vLLM / TGI</div><div class="ml-bar-outer"><div class="ml-bar" style="width:42%;background:#EF9F27"></div></div><div class="ml-stat" style="color:var(--amber-dark)">Young projects &middot; growing surface</div></div>
    </div>
  </div>

</div>
