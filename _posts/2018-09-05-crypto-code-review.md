---
layout: post
title: Overly Simplistic Crypto Code review
date: 2018-09-05
categories: ["Cryptography", "Secure Coding", "Data Protection", "Code Review", "Encryption", "HTTPS", "Hashing", "Security Best Practices"]
excerpt: Confidentiality is one of Information Security
---
Confidentiality is one of Information Security’s CIA tenets. Users entrust
developers with their data. To earn and maintain their trust, we must employ
security controls that protect data from unauthorized access.

Unfortunately the track record is not good. The number of user records exposed
in the United States has been in the billions in 2016 and 2017. 2018 will
likely be the same, once the final tally is calculated.

![](/images/1.jpg)

It is worth mentioning that not all of these breaches were caused by
programming flaws. Some were caused by negligence, many were caused by
phishing and malware attacks.

However at least one of the breaches of 2017 was caused by a programming flaw.
The breach at the credit rating company Equifax was responsible for almost 10%
of the damage: 146 million records. The attack leveraged a OGNL Injection
vulnerability in the Apache Struts library and the subsequent failure to patch
the affected systems. You can read about Injection flaws in one of the
previous articles in this series.

## Spotting Data Breaches During Code Review

Besides vulnerabilities in 3rd party components, there are programming flaws
that specifically involve storage and transmission of data and they may be
prevented during code review. They are as follows:

  * Cleartext Storage of Sensitive Information — CWE 312

  * Use of a One-Way Hash without a Salt — CWE 759

  * Cleartext Transmission of Sensitive Information — CWE 319

  * Use of a Broken or Risky Cryptographic Algorithm — CWE 327

We will review a few examples of these flaws and how they can be prevented
through software security best practices.

## Uniquely Identifying Data Without Knowing the Data

One of the strongest countermeasures that can be employed to prevent data
breaches is not storing the data at all.

But what if you still need to work with the data? For example, what if you
wanted to verify a user’s password without storing the actual password value?

You could transform the data in a non-reversible way. This can be done through
a cryptographic operation known as hashing.

Hashing algorithms, such as the SHA-2 class of algorithms, convert data in a
way that cannot be reversed. However this doesn’t prevent one from trying a
large amount of possible values in order to reach the same outcome. This is
known as cracking. Cracking takes a long time and requires a lot of computing
resources. Hackers maintain lists of pre-computed hashes, known as rainbow
tables, in order to avoid the computing cost.

![](/images/2.png.avif)

The defence employed against rainbow tables is to complicate the calculation
by adding a _salt_. A _salt_  is a random value that is added to the data
being transformed in order to alter the resulting hash.

    
    
    "ABCDEFG" + "-32524..." -> sha256("ABCDEFG-32524...") -> 97AF3... 

Another defence against cracking is adaptive hashing. This involves re-hashing
the data for a large amount of iterations, each iteration taking longer than
the previous. This increases the computing time. For a single hash the time is
negligible but for a cracking attack it results in millions of years. A
largely adopted adaptive hashing algorithm is PBKDF2.

Let’s take a look at the following code snippets. Can you spot the security
flaw?

![](/images/3.png.avif)

If you identified the top example as being flawed you were correct. The top
example requires the user password stored as is. The bottom application is
storing the data hashed several times to increase computing time and is also
using a salt.

Secure hashing may be employed for various other types of data. For example if
an application needs to uniquely identify users for analytics purposes, it
could construct a unique, non-reversible hash from the user name and their IP
address. This process is known as Tokenization.

If the website analytics database is breached and the only thing obtained by
the attackers are these hashes, the data is useless to them or too costly to
reverse. However if the database contains user names and IPs and if the user
names are actual e-mails (a practice employed by many sites), then e-mails
will be sold on the dark web to be used for phishing and spam campaigns.

## Securing the Transmission of Data

Hashing can be an effective way to secure the data, but what if the attacker
is able to intercept the data before it is transformed? What if they can
intercept the data even before it reaches the application?

Up until 2018 major news outlets such as CNN or FOX NEWS were accessible over
unencrypted URLs. Those are site addresses that start with `http://` .

One of the things that may have prompted many sites to change this behaviour
was the addition of a **Not Secure**  message to the address bar of the
popular Google Chrome browser for all `http://` addresses.

![](/images/4.png.avif)

When a website uses clear text to communicate with its users, _man-in-the-
middle_  attacks are possible. These attacks are can be online or offline
attacks. Offline attacks usually target the Confidentiality of the data, for
example tracking a user’s activity online or stealing their credentials.
Online attacks can also impact the Integrity of the data, like for example
replacing the content of a trusted news outlet with malware.

Communication security protocols, indicated by `http**s** ://` URLs, prevent
_man-in-the-middle_  attacks by encrypting the transmission and verifying the
identity of the two parties involved in the communication.

There are many details to transmission security that may be better covered in
a dedicated article, but we will focus primarily on one aspect that may come
up during a code review. This is using `http**s** ://` URLs.

Let’s take a look at a code example. Can you spot the code that transmits data
insecurely?

![](/images/5.png.avif)

If you identified the bottom example as insecure you were correct. Notice that
the URL is prefixed with `http://` meaning that the data is transmitted in
clear text. Looking a bit to the right you can spot two pieces of sensitive
information being transmitted in the URL.

Note that is bad practice to store sensitive information in the URL even if
the url starts with `https://` . Thats’s because the URL may be inadvertently
bookmarked, sent to a 3rd party or stored in web server logs.

Sometimes developers change the code to ignore invalid certificates because
the test environment they are using does not have a valid web server
certificate. This is a bad practice because it practically violates the server
identity verification and allows _  man-in-the-middle _attackers to pretend
they are the target website. It is recommended to configure the development
environment to trust the test certificate instead of altering the program
behavior.

## Reversible Encryption

What if you must be able to work with the user data in clear text? For
example, you operate an online shopping or other financial site and must store
the user’s name, address and credit card information to process transactions.

First, I would like to emphasize that if this is the case, the site has a huge
target painted on it. It is likely subject to daily attacks. This is likely
the case for sites like Equifax or your banking site.

Unfortunately encryption would have not saved Equifax because the
vulnerability allowed attackers to run code on the web site. This let the
attackers make the web site do their bidding. Another thing that helped the
attackers is that the breach was not observed for a long period of time,
allowing them to exfiltrate information as users were interacting with the
website.

However let’s say the attackers don’t have this kind of access, but they have
access to the physical hard drive of the database server. A different common
attack vector could be a SQL Injection vulnerability that allows attackers to
alter the database queries in order to expose sensitive data.

In these cases encryption can be effective, provided that the attackers cannot
retrieve the encryption keys. If encryption keys are stored on a separate
server, also known as a Key Management Server or Service (KMS), then attackers
must obtain access to this server as well, which complicates the attack.
However if the encryption keys are stored in the same database, decrypting the
data is trivial. This scenario is similar to _hiding a key under the mat._

Let’s take a look at some code examples written in Node.js. Can you identify
the vulnerable snippet?

![](/images/6.png.avif)

If you identified the top example you are correct. The top example is storing
the customer personal financial information in a AWS S3 bucket. S3 buckets
have notoriously been exposed to data breaches in the past years. While S3
offers data encryption capabilities, this configuration may not be enabled and
it does not protect from all types of attacks.

## To sum it all up

Some key takeaways from this article:

  * Where possible employ secure hashing to transform the data in a way that cannot be reversed

  * Enforce secure communication between clients and servers

  * Encrypt sensitive data in databases to prevent physical data theft and mitigate SQL Injection

  * Store encryption keys in a KMS

  * Vulnerabilities that allow code execution on the server may still expose the data in spite of encryption, so all secure coding practices are data protection practices.

Due to the extensive nature of the data protection subject we are going to
stop here for now. In the next article we will cover how to keep up to date
with crypto algorithms, what are some of the government and compliance
standard requirements for data protection and how do they affect coding.


