---
layout: post
title: Google Glass 0days
date: 2013-04-19
categories: ["Google Glass", "software development lifecycle", "vulnerabilities", "DOS attacks", "reflected XSS", "code security", "open source code", "responsible disclosure", "vr insecurity", "ar vulnerability", "augmented reality vulnerability"]
excerpt: Jenny Murphy has some clean code. However, it isn't the most secure. The Google Glass team must be under an intense timeline. Without looking too hard into the libraries and
---
Jenny Murphy has some clean code.  However, it isn't the most secure.  The
Google Glass team must be under an intense timeline.  Without looking too hard
into the libraries and open source code, there are 22+ vulnerabilities.
Everything from DOS to reflected XSS.  I was hoping for a stronger SDL. ​

Until the issues have gone through Responsible Disclosure, one can review the
code @ https://developers.google.com/glass/overview


https://github.com/googleglass/mirror-quickstart-php/commit/215374669072a8b788df464434f923bdc5f4e8e4

https://github.com/googleglass/mirror-quickstart-java/blob/fcdd3e48dfca4f4c3fcbe5e368683ca32b3e9720/src/main/java/com/google/glassware/NotifyServlet.java#L72

https://github.com/googleglass/mirror-quickstart-go/commit/0d33b01b6557ab7bcdba83022c6e729912ee2275

https://github.com/googleglass/gdk-level-sample/commit/2fab0d65f187a4b395ed4903ecf0023a516f8455




