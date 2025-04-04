---
layout: page
title: Sometimes escalating privileges is that easy
date: 2019-11-29
categories: [TBD]
excerpt: 
---
![](/images/61231935_457720931698319_1779304573052125184_n.jpg)

symlink to the file you want to CRUD with root privileges. then sudo vi
/var/www/html/<insert symlink name.

Or once inside vim

`:set shell=/bin/sh`

`:shell`