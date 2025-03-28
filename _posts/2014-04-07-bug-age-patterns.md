---
layout: post
title: Bug Age - Pattern series
date: 2014-04-07
categories: ["bug patterns", "code insecurity", "secure coding", "software vulnerabilities", "formal proofs", "code correctness", "legacy code", "holistic security", "open source security", "security automation", "developer tools"]
excerpt: I love standards. My blackhat persona says this makes it easy to break into systems
---
I love standards. My blackhat persona says this makes it easy to break into
systems (mono-risk culture.) Everyone must buy the same machine, same
software, same configuration. My whitehat persona says this leads to less
configuration flaws. Then opponents must move further up the stack and delve
into about code insecurity. One would think we would be prepared / situated
when attackers are forced to move onto code insecurity. Mind you, this is a
2-5 years evolution. But 2-5 years is a lot of time preparing for code
insecurity. The challenge is how does one build secure code cost-effectively?
I am amazed at all the clever ways one can break poorly written php / java /
perl / javascript / actionscript/ C / ruby / python code. Software insecurity
is a well understood challenge. I have never met a software developer who
wanted to create insecure code. It is not a soft problem is the sense
programmers write insecure code. But there exist tools (behavioral,
developmental, and thought) to reduce / eliminate classes of vulnerabilities.
Lost long ago were formal proofs. These computing systems formal designed
stuff at a higher level, assigned appropriate interfaces and with some
mathematical confidence show a permutation of interfaces couldn’t be utilized
by a hacker in the right order to enact unexpected behavior. Formal proofs
have disappeared. Ultimately, that is the next problem to solve. The Age of
Bugs is dead. Academia and other hackers have moved into the Age of Systems.
Eventually software developers will move beyond common software
vulnerabilities and utilize mechanisms that eliminate them.  Until then,
software developers have a number of patterns to recognize and formally solve.

In the coming entries, we will cover the following patterns in detail;

**_Code correctness_**  – incentives to get code right, not secure.  
**_Old code is scary_**  – threat models change after years of use  
** _Holistic security_**  – All encompassing  
** _Open source lesson_**  – many hands in the kitchen  
** _Never ending security_**  – the never ending story  
** _Today’s XSS is tomorrow’s CSRF_**  
** _Retire unused code_**  – poor financial investment  
** _Tools are tools_**  – nothing more, nothing less  

** _Lazyness_**  \- automation

​


