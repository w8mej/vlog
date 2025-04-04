---
layout: post
title: Google Glass Developer program - more DOS and XSS
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


