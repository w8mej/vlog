---
layout: post
title: Gribodemon on SpyEye 2.x - I expected better
date: 2012-05-29
categories: ["application honeypot", "SpyEye malware", "sandbox evasion", "virtualized sandbox security", "insecure coding practices", "buffer overflows", "cryptographic flaws", "command and control systems", "web application vulnerabilities", "XSS vulnerabilities", "SQL injection", "secure coding"]
excerpt: Saturday, I noticed my application honeypot collected an interesting sample. The cracker took my bait and attempt to hack the planet via a SpyEye 2.x variant. Apparently, the limit of
---
Saturday, I noticed my application honeypot collected an interesting sample.
The cracker took my bait and attempt to hack the planet via a SpyEye 2.x
variant. Apparently, the limit of its sandbox testing was to look for known
virtualized drivers, mac addresses, and other signatures typically found in /
on virtualized sandboxes. Just another arrow to the quiver of changing
everything default in a virtualized sandbox. Everything from PCI driver labels
to ethernet mac addresses.

I am utterly amazed at the kit's insecure coding. The small Windows executable
is vulnerable to numerous buffer overflows, poor error handling, and poor
cryptographic implementation. Don't even get me started on their alleged
"performance optimization." I traced the outbound calls and dummy data
exfiltration a web-based C&C system. Fortunate for me, it is a poorly coded
web application. By poorly coded, there are 300+ XSS vulnerabilities, 60+ SQL
injections, and numerous other poor secure coding practices. Gribo's response:
"run in a sefe place."

A typical example from the certificate handling code:

$id = $_GET['id'];

if (!$id) exit;

….

$dbase = db_open();

$sql = "SELECT data, bot_guid, name, date_rep FROM cert WHERE id = $id LIMIT
1";

$res = mysqli_query($dbase, $sql);

Needless to say, the C&C website was taken care of with no effort at all.
While I commend Gribodemon and team offering free support, their efforts are
better spent securing their kit from other crackers.


