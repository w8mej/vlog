---
layout: post
title: #Carberp vulnerabilities - Overview and poor cryptography
date: 2013-06-27
categories: ["Carberp", "malware analysis", "cryptographic vulnerabilities", "RC4 encryption", "md5 weaknesses", "openssl misuse", "application security", "botnet source code", "secure coding", "PHP security"]
excerpt: I logged into Reddit this morning and observed Carberp
---
I logged into Reddit this morning and observed Carberp’s source code was
released into the public domain.  Awesome.  Time to break “new” software and
responsibly handle the botnets.  Last week, the 2.4+ GB svn repository was
placed into a password protected zip file.  [Earlier this week, someone shared
the zip file’s password.](https://threatpost.com/carberp-source-code-leaked/)

After acquiring the zip file and credential, I unpacked the zip file in a
clean VM and started to poke around in the repository.  The project is an
interesting read.  The project and related code is full fledged, feature rich
with sizeable complexity and interdependencies.  With the immature svn
commits, and lacking defensive, rugged coding techiniques, it is clear their
internal SDL is lacking.  As typical, complexity is the enemy of security.
When secure coding practices aren’t followed,  underground crackers are just
as affected as professional programmers.  The code looks like a typical
software project with paying customers, regular updates, new features, and
competitor espionage.   I was astonished by the sheer numbers and severity of
the application security vulnerabilities I discovered in the software.   As I
dig deeper into the source code and various comments, I will write additional
blog posts on each area.

To wet your appetite, let’s look at the project’s encryption implementations.

The secret sauce for zombies and C&C encryption algorithm is PHP’s
[openssl_seal](http://php.net/manual/en/function.openssl-seal.php) and
[openssl_private_encrypt](http://php.net/manual/en/function.openssl-private-
encrypt.php) .  PHP’s openssl_seal utilizes RC4.  While specific RC4
implementations are considered by some to be “good enough,” I will point out
this observation: NIST SP 800-52 doesn’t allow RC4 nor MD5 because they are
not FIPS-approved algorithms.  Auditing Carberp’s implementation doesn’t lead
credence to RC4 being setup securely.

      $publickey = openssl_get_publickey(is_file(OPEN_SSL_PUBKEY_PATH)? file_get_contents(OPEN_SSL_PUBKEY_PATH) : OPEN_SSL_PUBKEY_PATH);

      // Encrypt

      openssl_seal($plain, $crypttext, $ekey, array($publickey));

      openssl_free_key($publickey);



Where RSA is utilized, there is inadequate padding involved.  Hence weakening
the encryption.  In this specific case, the RSA algorithm is used by PHP’s
openssl_private_encrypt function but doesn’t use OAEP padding.  Implementation
fail.

openssl_private_encrypt($_POST['domains'], $hosts, $keys['priv']);



Development's favorite hash is md5.  I have found over 130 md5 uses through
various components.  FYI: md5 is a weak cryptographic hash known to not
guarantee integrity and should not be used in security critical contexts.
Malware is used in security critical contexts.  Enough said.  

Malicious executables are a simple md5 hash with a random number added to it.

$fname = md5($md5 . time() . mt_rand()) . '.exe';

Not computationally hard to reverse engineer and write signatures to detect
carberp executables.

In the jabber communication channels, cnonces are generated with a base 64
encoded, unique md5 hash of a random number.  Complexity is the enemy here.
The weakest chain is that the system relies on md5.  Effectively rendering the
magical base 64 encoding and randon number generation nonce no better than a
typical md5 hash generated with a weak random number generator.

// better generate a cnonce, maybe it's needed

                $decoded['cnonce'] = bas

base64_encode(md5(uniqid(mt_rand(), true)));



The control panel user’s credentials are stored in a md5 hash.  It is worth
mentioning it is plausible to take down a command center by submitting POSTs
with computationally complex passwords which forces needless and expensive cpu
calculations.  One’s mileage may vary.  I suspect one will suck up all
available web server threads long before php’s md5 hash function will clobber
the cpu.

$pass = md5($_POST['pass']);



I understand implementing cryptography is hard but it isn’t this hard.  I
can’t wait to dive deep into the code.


