---
layout: post
title: Random thought for an exploding honey token
date: 2013-06-27
categories: ["honey tokens", "compressed file attacks", "mail server vulnerabilities", "resource exhaustion", "insider threat detection", "security experimentation", "MTA inspection", "system logs monitoring"]
excerpt: I remember when Nuxi and I would create computationally compact compressed files and see which mail servers would attempt to inspect the contents. Typically, the MTA would fail over due
---
I remember when Nuxi and I would create computationally compact compressed
files and see which mail servers would attempt to inspect the contents.
Typically, the MTA would fail over due to lacking heap space, heavy swapping,
insanely large disk IO, and other resource utilization problems.  Besides,
during the school year, exploding the mail gateways was a great way to cause
the university’s mail server to go down and buy a few day’s extra time.  So
why not cause the same reckless behavior, but cause a large blip to happen
when an inside actor attempts to inspect a honey token?

Name the compressed file CreditCard_Customers.zip , <insert juicy file
name>.zip, etc…. Then place it somewhere available for the intended audience.
Or somewhere not available.  For instance, put it in the confidential file
share.  Then watch asset’s system logs for resource utilization errors related
to unpacking a 35 PB zip file.  Or see if someone attempts to email it to
their personal email address (assuming the MTA will cough and die when
inspection occurs.)  You did make your MTA rugged, right?

[Here are](/s/42PBSizeCompact.zip) [two test
files](/s/selfgzMassExplosionUnpacked.gz)[​](/s/42PBSizeCompact.zip).  Modify
to your liking.

​​


