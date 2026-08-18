---
layout: post
title: Impressive Node.JS vulnerability reduction
image: /images/2015/nodejs-security-posture-improvement.jpg   # full-bleed hero, 16:7
image_alt: "Full-stack Node.js security blueprint including HTTP headers, dependency scanning, and sandbox isolation"
takeaways:
  - "Harden Node.js applications with strict security headers, scoped npm tokens, and unprivileged runtimes."
  - "Automate dependency vulnerability scanning directly inside the continuous delivery pipeline."
  - "Isolate untrusted child processes to prevent host filesystem compromise."
date: 2015-04-21
categories: ["NodeJS", "vulnerability reduction", "secure coding", "code review", "security improvements", "open source security", "risk mitigation", "JavaScript security", "community contributions", "remediation efforts"]
excerpt: In 2013, when I last performed a secure code review on Node.JS, it did not look pretty.
---
In 2013, when I last performed a secure code review on Node.JS, it did not
look pretty.

![Pie chart showing numerous Node.js vulnerabilities in 2013](/images/image-asset.png.avif)

Now the vulnerability pie looks like the following;

![Pie chart showing significantly reduced Node.js vulnerabilities in 2015](/images/image-asset.png.avif)

Impressive change.  Over the coming months, we will dig into the fixes and
remediations involved to reduce the risk to the Node.JS community.


