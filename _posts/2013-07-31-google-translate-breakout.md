---
layout: post
title: Google Translate #vulnerability and #exploit
date: 2013-07-31
categories: ["Google Translate", "web vulnerability", "iframe hijacking", "redirect exploit", "HTML5 sandbox", "web security", "safe mode", "security mitigation"]
excerpt:  the translated website pops out of Google Translate's iframe and redirects the user to a website or content of their choosing
---
http://www.google.co.uk/translate?hl=en&u=+++mn6i0.tk+%0A%0A++



Background:

**"...Google Translate**  is a [free](http://en.wikipedia.org/wiki/Gratis)
[statistical](http://en.wikipedia.org/wiki/Statistical_machine_translation)
multilingual [machine-
translation](http://en.wikipedia.org/wiki/Machine_translation) service
provided by [Google Inc.](http://en.wikipedia.org/wiki/Google) to translate
written text from one language into another. .."  \- Wikipedia .

Think of Translate like Douglas Adam's
[babelfish](http://en.wikipedia.org/wiki/Babel_fish_\(The_Hitchhiker%27s_Guide_to_the_Galaxy\)#Babel_fish),
but in an online, text form.





Vulnerability:

The former vulnerability is rather simple.  After a few redirects to fool
anti-fraud mechanisms, the translated website pops out of Translate's iframe
and redirects the user to a website or content of their choosing.  





Solution:

One may use [HTML5-sandbox
iframes](http://www.html5rocks.com/en/tutorials/security/sandboxed-iframes/)
to prevent the top level hijacking.  Google engineers implemented HTML5 to
mitigate the vulnerability.  But in the interests of those web developers who
utilize Flash, Silverlight and other interesting development tools, Translate
enables translators to disable "Translated in Safe Mode."  This results in
allowing the translator to slit their throat.  To each their own.




