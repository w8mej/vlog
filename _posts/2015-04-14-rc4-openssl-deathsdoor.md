---
layout: post
title: Yet another nail in SSL TLS 's coffin
date: 2015-04-14
categories: ["SSL", "TLS", "RC4 vulnerability", "cryptographic attacks", "BEAST attack", "cipher suite weaknesses", "man-in-the-middle", "encryption insecurity", "deprecated protocols", "security research"]
excerpt: RC4 has long been considered problematic, but until very recently there was no known way to exploit the weaknesses
---
Via [Ivan](https://community.qualys.com/blogs/securitylabs/2013/03/19/rc4-in-
tls-is-broken-now-what) \- "...RC4 has long been considered problematic, but
until very recently there was no known way to exploit the weaknesses. After
the BEAST attack was disclosed in 2011, we—grudgingly—started using RC4 in
order to avoid the vulnerable CBC suites in TLS 1.0 and earlier. This caused
the usage of RC4 to increase, and some say that it now accounts for about 50%
of all TLS traffic.

Last week, a group of researchers (Nadhem AlFardan, Dan Bernstein, Kenny
Paterson, Bertram Poettering and Jacob Schuldt) [announced significant
advancements in the attacks against RC4](http://www.isg.rhul.ac.uk/tls/),
unveiling new weaknesses as well as new methods to exploit them. Matthew Green
has a [great overview](http://blog.cryptographyengineering.com/2013/03/attack-
of-week-rc4-is-kind-of-broken-in.html) on his blog, and here are the
[slides](http://cr.yp.to/talks/2013.03.12/slides.pdf) from the talk where the
new issues were announced.

At the moment, the attack is not yet practical because it requires access to
millions and possibly billions of copies of the same data encrypted using
different keys. A browser would have to make that many connections to a server
to give the attacker enough data. A possible exploitation path is to somehow
instrument the browser to make a large number of connections, while a man in
the middle is observing and recording the traffic.

We are still safe at the moment, but there is a tremendous incentive for
researchers to improve the attacks on RC4, which means that we need to act
swiftly...."






