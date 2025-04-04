---
layout: post
title: Memory Safety Code Review
date: 2018-11-30
categories: ["Memory Safety", "Buffer Overflow", "CWE 120", "CWE 131", "CWE 134", "CWE 193", "Input Validation", "Format String Injection", "Off-by-One", "Compiler Flags", "Secure Coding Practices"]
excerpt: Some of our keen readers may have noticed that if the size of userPass is less than 9, then overflow will still occur.
---
Memory related vulnerabilities are very dangerous. Essential operating system
components and programs such as system services, browsers, crypto libraries
and document readers are written in C/C++ and are particularly exposed to
these types of flaws.

There are many flavours of memory vulnerabilities but we will focus on the
most common mistakes:

  1. Buffer Copy without Checking Size of Input — [CWE 120](http://cwe.mitre.org/top25/index.html#CWE-120)

  2. Incorrect Calculation of Buffer Size — [CWE 131](http://cwe.mitre.org/top25/index.html#CWE-131)

  3. Uncontrolled Format String — [CWE 134](http://cwe.mitre.org/top25/index.html#CWE-134)

  4. Off by One — [CWE 193](https://cwe.mitre.org/data/definitions/193.html)

How do we know they are the most common? All of these mistakes are documented
by MITRE with the top 3 being included in the [MITRE Sans Top
25](http://cwe.mitre.org/top25/index.html).

They all lead to arbitrary access of memory outside the intended boundaries.
This is also known as Overflow.

# Memory Overflow Explained

Imagine the program uses two variables `a` and `b`. The contents and length of
variable `b` are controlled by the user. The variable memory locations are
represented in the simplistic example below. Each variable is intended to
store 3 characters. At first variable `a` contains the string “**Hi!”**.

![](/images/1.png.avif)

If the user enters the string `AAAAA` (5 As) for variable `b` the following
will happen.

![](/images/2.png.avif)

Variable `b` only had 3 locations reserved for its value plus one for the
string terminator `\0` . By entering 5 characters the user is now writing into
space reserved for variable `a`.

Variables are pointers to memory locations. The value of `b` will now become
_AAAAA_** _i!_**  while the value of `a` will become _Ai!_. If the program
outputs the value of `b` then the attacker will be able to know part of the
value of `a` which is known as a **memory leak**.

If the user enters a sufficiently long value, they will hit the instruction
area and alter the program code.

Overflow can be prevented by controlling the number of characters read into
the buffer. This is done using memory safe functions. It is important to note
that simply using these functions will not prevent overflow. They also must be
used correctly.

There exists several functions that allow the program to limit the size of the
value read into a buffer: `fgets`, `snprintf`, `strncpy`, `strncmp`.

If the BUFF_SIZE argument is larger than the size of the buffer, overflow will
still occur.

In the example below we have two different code snippets that both read a
password from the standard input. Can you spot the one that allows Buffer
Overflow because it does not check the size of the input?

![](/images/3.png.avif)

If you identified `bottom.cpp` as the vulnerable code you were correct. The
top example, is making use of `fgets` and it restricts the number of
characters to **9**.

# Incorrect Calculation of Buffer Size

Some of our keen readers may have noticed that if the size of `userPass` is
less than 9, then overflow will still occur.

This is an example of **Incorrect Calculation of Buffer Size**. Defining
constants for the size argument rather than using numerals and paying close
attention during code review to the code checking boundaries, can prevent this
type of flaw. Let’s take a look at the example below and see if we can spot
the vulnerable code.

![](/images/4.png.avif)

If you identified `bottom.cpp` as the vulnerable code you were correct. The
top example, is making use of the constant `BUFFER_SIZE` to ensure
consistency. Besides being a safer option the code is also easier to maintain
if the constant value must be modified in the future. Many secure coding
practices have other benefits besides security.

# Off-by-one

Off-by-one is another variation of buffer size flaw. This type of programming
mistake is introduced when employing comparison operators. A simple extra
equal sign, for example using`<=` instead of`<` can lead to the program
crashing. Let’s take a look at an example. Can you spot the vulnerable code?

![](/images/5.png.avif)

If you spotted the error in `top.cpp` you are correct.

# Memory Injection?

**Format String Injection  **is a type of vulnerability caused by
concatenating or using user input in a format parameter. Code that logs user
values using functions such as **printf  **is particularly exposed to this
type of vulnerability.

Take for example the snippets below. Can you spot which of the two snippets
allows the user to control the format string?

![](/images/6.png.avif)

If you identified `top.cpp` as the code that allows **Format String
Injection**  you were correct. If the user includes `%d` or `%p` in the
password, **printf**  will take the next value following the format string and
include it in the display. This can lead to information disclosure or program
crashes.

By the way there are a couple of bonus insecure practices in both code
snippets :) . Did you spot them? One is the use of `printf`, a dangerous
function as mentioned earlier in the article. It’s also a bad practice to
display the user password.

# Compiler Flags

This is not really a code review item but is worth mentioning because is a
countermeasure that can be applied at build time to prevent the exploitation
of memory flaws.

Compiler flags enable operating system defences such as ASLR in Windows or
PIE/SSP in Linux. They tell the operating system to employ countermeasures
such as randomizing memory, which is making it hard for attackers to insert
arbitrary code.

Even with compiler flags in place attackers can still crash the program so the
main effect of compiler flags is reducing the impact of the attack. The best
defence is to prevent the flaws in the code, from the start, by employing the
best practices discussed in this article.

# To sum it all up…

  * **Safer functions** allow limiting the number of bytes read into the buffer

  * Even with safe functions special attention should be paid to **size specified**

  * **Use constants** to prevent mistakes

  * Careful with the **< =** operator

  * Do not allow **user input in format strings**


