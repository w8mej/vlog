---
layout: post
title: Firesale WebPanel botnet 0days
date: 2012-10-10
categories: ["Firesale WebPanel botnet", "reflected XSS", "DOM-based XSS", "SQL injection", "security vulnerabilities", "web security", "code sanitization", "mysql_escape_string", "application security"]
excerpt: Oh, Firesale WebPanel botnet. How entertaining it is to see you continue to raise your head over the years.... XSS Reflected
---
Oh, Firesale WebPanel botnet.  How entertaining it is to see you continue to
raise your head over the years....

XSS Reflected –

This is a great example of reflected XSS. Within deleteTask.php, line 5, a
malicious POST request with a tainted tasked paramenter is sent. Literally on
the same line, builtin_echo sends the non-validated / sanitized input in the
html response.

XSS DOM –

Much more subtle XSS are the DOM-based XSS features. From within index.php,
line 119, the localScope response is viewed by the server. On line 120, the
DOM is assigned to innerHTML. Ouch!

Poor SQL Injection mitigation -  

Without getting into too much detail, in handleCreateTask.php, line 24, there
is an attempt to sanitize sql via mysql_escape_string(). While great in
theory, mysql_escape_string() is easily bypassed. [See here for further
information](http://www.google.com/search?q=mysql_escape_string+sql+injection+fail).
It isn’t safe to use due to the false sense of security provided by the
function.

[Source](https://github.com/aeonsf/Application_Security/commit/bc19594341abb2ad9fc48f30e4035818da9f22a4)

[Google hack to find
instances](http://www.google.com/search?q=inurl%3Aindex.php+Gesch%26uuml%3Btzter+Bereich+-+Login)


