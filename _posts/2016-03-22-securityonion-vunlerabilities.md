---
layout: attachment
title: Multiple vulnerabilities in SecurityOnion
date: 2016-03-22
categories: ["SecurityOnion", "Vulnerabilities", "PHP Security", "Remote Code Execution", "Web Security", "Disclosure", "Exploit Development", "Open Source Security"]
excerpt: Let this be a reminder of the joys in programming PHP
---
Let this be a reminder of the joys in programming PHP

![](/images/image-
asset.jpeg)

I have started to take a look at a number of security silver bullets.  The
first on my list - SecurityOnion.

Fortunately, glossing over the source, the search didn't take longer than 3
minutes to find a few web vulnerabilities.   The poor programming practice was
an inherent trust in the malicious browser to do no harm.

I will leave the exercise of finding the RCE 0days to the reader.  There exist
3 web and 11 network traffic based vectors to enact arbitrary remote code
execution.

Disclosure may be found @

http://blog.securityonion.net/2016/02/securityonion-capme-20121213_10.html

Patches may be found @

<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/1>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/2>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/3>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/4>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/5>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/6>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/7>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/8>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/9>  
<https://github.com/Security-Onion-Solutions/securityonion-capme/issues/10>


