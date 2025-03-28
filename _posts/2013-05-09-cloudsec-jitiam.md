---
layout: post
title: Security is hard.  Security Tools are harder.  Cloud Security Tools are hardest.
date: 2013-05-09
categories: ["cloud security tools", "security orchestration", "vulnerability management", "dynamic infrastructure", "cloud service APIs", "security tool interoperability", "cloud security corporations", "policy compliance", "incident response", "forensic investigations"]
excerpt: There are tools, security tools, and then there are cloud security tools. Especially in the realm of security orchestration. Many cloud snake oil tools were never designed for the cloud.
---
There are tools, security tools, and then there are cloud security tools.
Especially in the realm of security orchestration.  Many cloud snake oil tools
were never designed for the cloud.  See RSA three years ago to today when a
vendor slapped cloud on their marketing material for pre-existing on-premise
software.  Or better yet:  They took their CFEngine and applied it to all of
their customer's AWS instances.  A great example are the vulnerability
managers / scanners.   Setup a DNS hostname or IP to scan.  Then the
vulnerability "management" portion of the scanner will track the DNS / IP with
metadata about the machine.  But what about when the IP or DNS name changes to
a different IP / DNS hostname, but the machine instance stays the same? Many
service-based security tools pricing structure are based upon some idea of a
static concept (IP address, DNS entry, etc...)  So imagine an infrastructure
where new machines are created and destroyed every few minutes.  It will get
quite expensive.  Not to mention, the vulnerability / GRC management software
doesn't have the concept of a machine instance jumping around the
infrastructure with different IPs / DNS names but still representing the same
machine scanned moments earlier.  Well, their business model understands this
concept and it means more licenses and billable expenses.  This is assuming
you are able to scan instances which exist for a few minutes then are
terminated; you did solve that problem, right?  

Very few cloud snake oil tools have any type of API or programmatic interface
by which to interact with the service or tool.  Imagine if you wanted to
correlate information on everyone piggybacking into your office.  A simple
correlation involves seeing who didn't swipe into the office but logged on
locally to the office networked machine.  If you had to resort to scraping the
building access system to get your swipes, then it doesn't have an API or
programmatic interface.  One would expect to see start, stop, restart, running
status, credential management, alerting, reporting, auditing, etc....  

One's mileage on the time it will take to construct / destroy the cloud
security orchestration tool.  For many software-based tools, it will require a
complex host or network agent.  Look at the build complexity required to run
Chef: MongoDB, Solr, Rails, Ruby, etc...  Best case, the tool will require
credentials or be at some trusted point in the architecture.  This is where
orchestration tools will succeed.  Once you can do it for another environment,
it is simple to transition the orchestration to the new environment.  Assuming
one is building a mirror of their other environment.

While interoperability will always be an issue with security tools,
orchestration is another beast.  Rarely, one will find one tool to natively
interoperate with others.  Hence the business need for Bromium, Cloud Passage,
High Cloud Security, HyTrust, and other cloud security corporations.  Ask
yourself does your cloud security tool have the ability to push / pull
information from your Arc Sight instance, correlate with Splunk's output, push
into your GRC tool, pull the latest scan from Qualys, maintain policy
compliance, and push out signatures to your Imperva instances?  How about a
simpler question:  How will you pull your puppet / chef logs from Splunk or
OSSEC and correlate with one's security checklist automation documentation to
verify what one is seeing is a policy violation or an intrusion?  By the way,
the asset which caused the violation is now destroyed by your orchestration
software.  I hope your incident response team understands how to investigate
cloud instances and be able to perform forensic investigations.




