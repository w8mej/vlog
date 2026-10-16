---
layout: post
title: Google Glass Developer program - more DOS and XSS
image: /images/2013/more-google-glass-vulns.jpg   # full-bleed hero, 16:7
image_alt: "Hardware debugging interface illustrating wearable sensor vulnerabilities and side-channel leakage"
takeaways:
  - "Wearables treat ambient environmental data as trusted input at their own peril."
  - "When sensors are always listening and watching, unauthorized exfiltration becomes trivial."
  - "Privilege separation must extend all the way to augmented reality peripherals."
date: 2013-05-03
categories: ["Google Glass", "Mirror API", "DOS vulnerability", "XSS vulnerability", "security fixes", "GitHub changeset", "error handling", "code security", "vr insecurity", "ar vulnerability", "augmented reality vulnerability"]
excerpt: There were two very simple Google Glass Mirror's quickstart DOS and XSS vulnerabilities. The fixes have been introduced in changeset https
---
There were two very simple Google Glass Mirror's quickstart DOS and XSS
vulnerabilities.  The fixes have been introduced in changeset
https://github.com/googleglass/mirror-quickstart-
java/commit/738352eb5b5b73aa7bb911d0aeee3386f40dbf26

​

​The DOS fix is rather simple.  Limit the request to 1000 lines.  The XSS fix
is hackish but works.  Instead of reflecting the client's input back to the
user, the error is directed to the error logging infrastructure.  Let's hope
the error logging infrastructure is anti-XSS enabled.  


