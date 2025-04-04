---
layout: post
title: NodeJS vulnerabilities - it hurts to look
date: 2013-11-12
categories: ["NodeJS", "JavaScript security", "backend vulnerabilities", "vulnerability classes", "defensive coding", "third party package review", "Shodan", "open source security", "NodeJS hardening"]
excerpt: Background
---
Background:

"**Node.js**  is a server-side [software
system](http://en.wikipedia.org/wiki/Software_system) designed for writing
[scalable](http://en.wikipedia.org/wiki/Scalability) Internet applications,
notably [web
servers](http://en.wikipedia.org/wiki/Web_server).[[1]](http://en.wikipedia.org/wiki/Nodejs#cite_note-1)
Programs are written on the server side in
[JavaScript](http://en.wikipedia.org/wiki/JavaScript), using [event-
driven](http://en.wikipedia.org/wiki/Event-driven_architecture), [asynchronous
I/O](http://en.wikipedia.org/wiki/Asynchronous_I/O) to minimize
[overhead](http://en.wikipedia.org/wiki/Overhead_\(computing\)) and maximize
[scalability](http://en.wikipedia.org/wiki/Scalability).[[2]](http://en.wikipedia.org/wiki/Nodejs#cite_note-2)

Node.js contains a built-in HTTP server library, making it possible to run a
web server without the use of external software, such as
[Apache](http://en.wikipedia.org/wiki/Apache_\(web_server\))
or[Lighttpd](http://en.wikipedia.org/wiki/Lighttpd), and allowing more control
of how the web server works...." - Wikipedia .   Essentially Node.js is a
wrapper around Chrome's V8 javascript engine.   This wrapper allows a
javascript programmer to write javascript on the front-end and backend.  I am
not sure why someone would want to write javascript on the backend but ok,
sure.  





Vulnerabilities:

There are too many vulnerabilities for me to dig through and start pointing
out.  So instead of talking about each vulnerability, below is the
vulnerability class pie.



![](/images/NodeJSVulns.png.avif)

Vulnerability pie

Node.js instances publicly available and indexed by Shodan: [~550
servers](http://www.shodanhq.com/search?q=server%3Anode.js).

Node.js source code is [publicly available at
Github](https://github.com/joyent/node).

Good luck and happy vulnerability hunting.





Solutions:

Defensive coding is a must.  

Third party software packages need to be reviewed for vulnerabilities.  

Treat Node.js as if it were untrusted software handling trusted data.




