---
layout: post
title: Serious XSS affecting Wikipedia
image: /images/2017/wikipedia-xss.jpg   # full-bleed hero, 16:7
image_alt: "DOM rendering pipeline analysis demonstrating cross-site scripting attack vectors in MediaWiki parser"
takeaways:
  - "Complex wikitext parsing engines create intricate sanitization bypass surfaces."
  - "High-trust collaborative encyclopedias require ruthless DOM-purifying output filters."
  - "XSS on high-reputation knowledge repositories turns legitimate information into malware vectors."
date: 2017-09-08
categories: ["Vulnerabilities", "Web Security", "XSS", "MediaWiki", "Wikipedia", "Disclosure", "Security Patching", "Manual Code Review"]
excerpt: XSS vulnerability in thumb.php in Wikipedia Mediawiki
---
Cross-site scripting (XSS) vulnerability in thumb.php in MediaWiki before
1.23.10, 1.24.x before 1.24.3, and 1.25.x before 1.25.2 allows remote
attackers to inject arbitrary web script or HTML via the rel404 parameter,
which is not properly handled in an error page.

[ Above was an interesting XSS affecting all of Wikipedia and MediaWiki
software.   It was found during manual code review.  Not much to be said about
it other than failure to validate and / or sanitize input.  Great response by
the MediaWiki development and Wikipedia Security team!


