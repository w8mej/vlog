---
layout: post
title: What does it take to break into a Cloud Service?
image: /images/2019/cp-rsync-cloud.jpg   # full-bleed hero, 16:7
image_alt: "Multi-cloud data transfer attack path exploiting unauthenticated object storage sync jobs"
takeaways:
  - "Automated cloud sync scripts often bypass perimeter controls and leak data into untrusted buckets."
  - "Verify IAM roles and bucket policies on both source and destination before running rsync pipelines."
  - "Unrestricted cloud-to-cloud copies are a primary mechanism for silent data exfiltration."
date: 2019-06-29
categories: ["Cloud Security", "Exploitation", "File Transfer", "cp", "rsync", "Cloud Service", "Cybersecurity", "Threat Intelligence"]
excerpt: Sometimes, all it takes is cp and rsync. See the image below for an example.
---
Sometimes, all it takes is cp and rsync. See the image below for an example.

<img loading="lazy" src="/images/exploit" alt="Exploit Code Snippet" width="1108" height="1478">


