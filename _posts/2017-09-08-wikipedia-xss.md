---
layout: post
title: Serious XSS affecting Wikipedia
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


