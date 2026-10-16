---
layout: post
title: Rapid7 Google hacks extended
image: /images/2013/site-s3-amazonaws-com-filetype-docx-password-username.jpg   # full-bleed hero, 16:7
image_alt: "Search engine Google dork query uncovering unprotected AWS S3 bucket documents and credentials"
takeaways:
  - "A single misconfigured S3 bucket turns enterprise crown jewels into public search results."
  - "Cloud adoption without automated permission boundaries is accidental public disclosure."
  - "Reconnaissance using Google dorks still beats million-dollar intrusion suites against lazy configurations."
date: 2013-04-11
categories: ["data leakage", "S3 bucket security", "sensitive information", "file sharing services", "content delivery networks", "inadvertent sharing", "document security", "Form W-4", "Form W-9", "Form 1099"]
excerpt: How many other file sharing services are affected by the inadvertant sharing of sensitive information
---
site:s3.amazonaws.com filetype:docx password username

site:s3.amazonaws.com filetype:pdf password username

site:s3.amazonaws.com filetype:pdf social security number confidential

site:s3.amazonaws.com "Form W-4"​

site:s3.amazonaws.com "Form W-9"​​

site:s3.amazonaws.com "Form 1099"

How many other file sharing services are affected by the inadvertant sharing
of sensitive information?  I suspect there are many.  And the results will not
be noisey.    Or better yet: Content delivery networks.

​


