---
layout: post
title: For those who wonder what a Digital authentication cyber arms race looks like
date: 2018-07-11
categories: ["Authentication", "Cybersecurity", "Browser Security", "Phishing", "Digital Identity", "Hardware Tokens", "Defense Strategies"]
excerpt: It is heavy on the technical content but is entertaining if you spend the time understanding the language.
---
It is heavy on the technical content but is entertaining if you spend the time
understanding the language.

> “Defender: Users will enter a username & password, and I will give them an
> authentication cookie for me to trust in the future.  
> Attacker: I will watch your network traffic and steal the passwords as they
> come down the wire.  
> Defender: I will change the html form to submit over HTTPS, so you won’t see
> any readable passwords.  
> Attacker: I will run an active MITM attack as the user loads the login page,
> and insert Javascript that sends the password to my server in the
> background.  
> Defender: I will serve the login page itself over HTTPS too, so you won’t be
> able to read or change it.  
> Attacker: I will watch your network traffic and steal the resulting
> authentication cookies, so I can still impersonate users even without
> knowing the password.  
> Defender: I will serve the entire site over HTTPS (and mark the cookie as
> Secure), so you won’t be able to see any cookies.  
> Attacker: I will run an active MITM attack against your entire site and
> serve it over HTTP, letting me see all of your traffic (including passwords
> and cookies) again.  
> Defender: I will serve a Strict-Transport-Security header, telling the
> browser to always refuse to load my site over HTTP (assuming the user has
> already visited the site over a trusted connection to establish a trust
> anchor).  
> Attacker: I will find or compromise a shady certificate authority and get my
> own certificate for your domain name, letting me run my MITM attack and
> still serve HTTPS.  
> Defender: I will serve a Public-Key-Pins header, telling the browser to
> refuse to load my site with any certificate other than the one I specify.  
>  
> At this point, there is no reasonable way for the attacker to run an MITM
> attack without first compromising the browser.  
>  
> Attacker: I will make a fake login page and phish users for passwords.  
> Defender: I will add two-factor authentication, making your stolen passwords
> useless without the non-reusable second factor.  
> Attacker: I will change my phishing page to request a second factor as well,
> then immediately use it to log in once. (this will give the attacker a
> single login session with no way of logging in again, but that is often
> enough to cause harm)  
> Defender: I will replace my SMS or TOTP second factor with a private key on
> a tamper-resistant hardware device, rendering an MITM attack completely
> unable to use the stolen credential (the private key is used to sign a
> challenge from the server, and never leaves the device). This also prevents
> phishing attacks, since the browser will incorporate the site origin into
> the challenge signed by the private key, and will refuse to send a challenge
> signed for the defender’s server to any other origin. This is only possible
> because the browser actively cooperates, unlike purely web-based solutions
> like SQRL.  
>  
> Private keys, such as U2F devices, are unphishable credentials; it is now
> completely impossible for anyone who does not have physical posession of the
> private key to authenticate. Note that this assumes that the hardware device
> is trusted; if the attacker can swap the device for a device with a known
> private key, all bets are off. Also note that you should still use a
> password in conjuction with the hardware device, to prevent an attacker from
> simply stealing the device (if the device itself requires a password to
> operate, that’s also fine).  
>  
> Attacker: I will trick the user into installing a malicious browser
> extension or desktop application, then use it to read the authentication
> cookie from the browser’s cookie jar.  
> Defender: I will use channel-bound cookies, linking my authentication cookie
> to the private key used to generate the SSL connection. This way, the
> authentication cookie will only work in an HTTPS session backed by the same
> private key, preventing the attacker from using it on his computer.  
> Attacker: I will change my malicious code to exfiltrate the private key as
> well as the authentication cookie, allowing me to completely clone the SSL
> connection on my machine, and still use the cookie.  
> Defender: I will hope that the user’s browser signs its HTTPS connections
> with a hardware-based private key (hardware-backed token binding),
> preventing the attacker from cloning the SSL session without access to that
> private key (which never leaves the hardware device).  
> Attacker: I will change my malicious code to run a reverse proxy through the
> user’s browser, sending my arbitrary requests through the same token-bound
> SSL session as the user’s actual requests.  
> Defender: I will encourage users to use a platform & browser that does not
> allow processes or extensions to interact with security contexts for other
> origins. This way, the attacker’s malicious code will not be able to read my
> cookies or send requests to my site.  
>  
> Assuming no application-level vulnerabilities (such as XSS or CSRF), and no
> vulnerabilities in the platform itself, such a platform would be completely
> secure against any kind of attack. Unfortunately, I am not aware of any such
> platform that also supports unphishable credentials. Chrome OS supports
> unphishable credentials, but offers no way to prevent extensions from
> sending HTTP requests to your origin. Most mobile browsers (on non-rooted
> devices) do not support extensions at all, but do not currently support
> unphishable credentials.”

-- Laks


