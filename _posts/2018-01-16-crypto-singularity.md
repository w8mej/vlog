---
layout: post
title: The pending crypto singularity
date: 2018-01-16
categories: ["Cryptography", "Security Engineering", "Protocol Design", "Crypto Monoculture", "IETF", "Internet Security", "AEAD", "Curve25519", "Open Source"]
excerpt: Recently penned by Peter, it is worth a read. Especially for those who are concerned about putting all of their eggs in one basket. On the Impending Crypto Monoculture
---
Recently penned by Peter, it is worth a read.  Especially for those who are
concerned about putting all of their eggs in one basket.  
    
    
    On the Impending Crypto Monoculture
    ===================================
    
    A number of IETF standards groups are currently in the process of applying the
    second-system effect to redesigning their crypto protocols.A major feature
    of these changes includes the dropping of traditional encryption algorithms
    and mechanisms like RSA, DH, ECDH/ECDSA, SHA-2, and AES, for a completely
    different set of mechanisms, including Curve25519 (designed by Dan Bernstein
    et al), EdDSA (Bernstein and colleagues), Poly1305 (Bernstein again) and
    ChaCha20 (by, you guessed it, Bernstein).
    
    What's more, the reference implementations of these algorithms also come from
    Dan Bernstein (again with help from others), leading to a never-before-seen
    crypto monoculture in which it's possible that the entire algorithm suite used
    by a security protocol, and the entire implementation of that suite, all
    originate from one person.
    
    How on earth did it come to this?
    
    The Underlying Problem
    ----------------------
    
    It would be easy to dismiss the wholesale adoption of Bernstein algorithms and
    code as rampant fanboyism, and indeed there is some fanboyism present.An
    example of this is the interpretation of the data formats to use as "whatever
    Dan's code does" rather than the form specified in widely-adopted standards
    like X9.62 ("Additional Elliptic Curves (Curve25519 etc) for TLS ECDH key
    agreement", TLS WG discussion), something that hasn't been seen since the C
    language was defined as "whatever the pcc compiler accepts as input".
    
    The underlying problem, though, is far more complex.
    
    In adopting the Bernstein algorithm suite and its implementation, implementers
    have rejected both the highly brittle and failure-prone current algorithms and
    mechanisms and their equally brittle and failure-prone implementations.
    
    Consider the simple case of authenticated encryption as used in the major
    Internet security protocols TLS, SSH, PGP, and S/MIME (the remaining protocol
    would be IPsec, but I've never written an IPsec implementation so I don't have
    sufficient hands-on experience with it to comment on it in practice).S/MIME
    has an authenticated-encryption mode (encrypt-then-MAC or EtM) that's
    virtually never used or even implemented, PGP has a sort-of integrity-check
    mode that encrypts a hash of the plaintext in CFB mode, and both TLS and SSH
    use the endlessly failure-prone MAC-then-encrypt (MtE) mode, with an ever-
    evolving suite of increasingly creatively-named attacks stretching back 15
    years or more (TLS recently adopted, after a terrific struggle on their
    mailing list, an option to use EtM, but support in some major implementations
    is still lagging).
    
    What are the (standardised) alternatives?Looking through a recent paper from
    Real World Crypto ("The Evolution of Authenticated Encryption", Phil Rogaway),
    we see the three options GCM, CCM, and OCB.The GCM slide provides a list of
    pros and cons to using GCM, none of which seem like a terribly big deal, but
    misses out the single biggest, indeed killer failure of the whole mode, the
    fact that if you for some reason fail to increment the counter, you're sending
    what's effectively plaintext (it's recoverable with a simple XOR).It's an
    incredibly brittle mode, the equivalent of the historically frighteningly
    misuse-prone RC4, and one I won't touch with a barge pole because you're one
    single machine instruction away from a catastrophic failure of the whole
    cryptosystem, or one single IV reuse away from the same.This isn't just
    theoretical, it actually happened to Colin Percival, a very experienced crypto
    developer, in his backup program tarsnap.You can't even salvage just the
    authentication from it, that fails as well with a single IV reuse
    ("Authentication Failures in NIST version of GCM", Antoine Joux).
    
    Compare this with old-fashioned CBC+HMAC (applied in the correct EtM manner),
    in which you can arbitrarily misuse the IV (for example you can forget to
    apply it completely) and the worst that can happen is that you drop back to
    ECB mode, which isn't perfect but still a long way from the total failure that
    you get with GCM.Similarly, HMAC doesn't fail completely due to a minor
    problem with the IV.
    
    Then there's CCM, which is two-pass and therefore an instant fail for
    streaming implementations, which is all of the protocols mentioned earlier
    (since CCM was designed for use in 802.11 which has fixed maximum-size packets
    this isn't a failure of the mode itself, but does severely limit its
    applicability).
    
    The remaining mode is OCB, which I'd consider the best AEAD mode out there (it
    shares CBC's graceful-degradation property in which reuse or misuse of the IV
    doesn't lead to a total loss of security, only the authentication property
    breaks but not the confidentiality).Unfortunately it's patented, and even
    though there are fairly broad exceptions allowing it to be used in many
    situations, the legal minefield that ensues makes it untouchable for most
    potential users.For example does the prohibition on military use cover the
    situation where an open-source crypto package is used in a vendor library
    that's used in a medical insurance app that's used by the US Navy, or where
    banking transactions protected by TLS may include ones of a military nature
    (both of these are actual examples that affected decisions not to use OCB).
    Since no-one wants to call in lawyers every time a situation like this comes
    up, and indeed can't call in lawyers when the crypto is several levels away in
    the service stack, OCB won't be used even though it may be the best AEAD mode
    out there.
    
    (The background behind this problem can be found in Phil Rogaway's excellent
    essay "The Moral Character of Cryptographic Work", which discusses aligning
    crypto work with principles like the Buddhist concept of right livelihood,
    applying it in an ethical manner.Unfortunately, in the same way that the
    current misguided attempts by politicians to limit mostly non-existent use of
    crypto by terrorists and other equestrians only affects legitimate users (the
    few terrorists who may actually bother with encryption won't care), so the
    restriction of OCB, however well-intentioned, have the effect that a beautiful
    AEAD mode that should be used everywhere is instead used almost nowhere).
    
    The implementations of the algorithms aren't much better.Alongside brittle,
    failure-prone crypto modes and mechanisms, we also have brittle, failure-prone
    implementations.The most notorious of these is OpenSSL, which powers a
    significant part of the world's crypto infrastructure not only directly (as a
    TLS/SSL implementation) but also indirectly, when it's used as a component of
    other applications like OpenSSH.In fact one of the reasons given for
    OpenSSH's adoption of the chacha20-poly1305 crypto mechanisms (alongside
    Curve25519 and others) was that it finally allowed them to remove the last
    vestiges of OpenSSL from their code.
    
    The Reason for the Monoculture
    ------------------------------
    
    Anyone who works with crypto on the Internet has had to endure 15-20 years of
    constant breakage of the crypto they use, both of the algorithms and
    mechanisms and of the implementations.It's not even possible to give
    references for this because the list of breakage is so long and extensive that
    it would take pages and pages just to enumerate it all.
    
    Take for example an organisation like Google.Every single time that there's
    been some break in a crypto mechanism, Google gets hit.Again and again, year
    in, year out.So when they look to moving to ChaCha20 and Poly1305, it's not
    Bernstein fanboyism, it's an attempt to dig themselves out of the current hole
    where they get hit with a new attack every couple of months, and the breakage
    just keeps recurring, endlessly.
    
    What implementers are looking for is what Bernstein has termed boring crypto,
    "crypto that simply works, solidly resists attacks, never needs any upgrades"
    ("Boring crypto", Dan Bernstein).Bernstein and colleagues offer a silver
    bullet, something that appears better than anything else that's out there at
    the moment.
    
    In this they have no real competition.There's no AEAD mode that's usable,
    the ECC algorithms and parameters that we're supposed to use are both tainted
    due to NSA involvement and riddled with side-channels (the Bernstein
    algorithms and mechanisms have been specifically designed to deal with both of
    these issues), and so on.
    
    Consider being lost in an endless desert.If you see an oasis in the
    distance, you head towards it even if the water is brackish and has camel dung
    floating in it.Bernstein et al are the oasis (or perhaps the mirage of an
    oasis), in an endless desert of cryptosystems and implementations of
    cryptosystems that keep breaking.
    
    So the (pending) Bernstein monoculture isn't necessarily a vote for Dan, it's
    more a vote against everything else.
    
    Acknowledgements
    ----------------
    
    This essay came about as the result of a discussion at AsiaCrypt 2015, and was
    then developed with significant input from Lucky Green.Prior to publication,
    further input was provided by some of the people whose work is mentioned in
    it.
    


