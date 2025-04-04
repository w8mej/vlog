---
layout: post
title: Binding Parameters
date: 2018-09-07
categories: ["Injection", "SQL Injection", "Input Validation", "Parameterized Statements", "ORM", "Secure Coding", "Code Review"]
excerpt: Notice that the single quote in the name O’Brien is causing a syntax error. The SQL command processor considers the string ends
---
In the previous article we reviewed **Input Validation**. While **Input
Validation** is an effective deterrent to a large number of attacks, including
**Injection** , not all input can be filtered.

For example imagine someone’s name is **O’Brien**. The single quote in**
O’Brien**happens to also be part of SQL command syntax. For example a website
may perform a database record search like this:

![](/images/simple.png.avif)

Notice that the single quote in the name O’Brien is causing a syntax error.
The SQL command processor considers the string ends with **O**  and the rest,
**BRIEN%,**  is just an unrecognized command.

In order to work around this problem one must escape the single quote with a
another single quote like in the image below.

![](/images/simple2.png.avif)

However when this query is executed by a program, things look different. The
name would be read from a variable and the database query would be constructed
dynamically.

Let’s take a look at the following code snippet.

![](/images/simple3.png.avif)

The variable **lastName  **contains input coming from the user. It is
concatenated to a constant SQL query string and the resulting command is
passed to the database server.

There is no input validation and no input escaping whatsoever. This means that
a user entering **O’Brien**  would cause an SQL syntax error, which is a bug.
However a malicious user would take advantage of this behaviour. What would
happen if the user entered something like the string below?

![](/images/simple4.png.avif)

The SQL query being passed to the database would end up being two different
commands. One selects all users in the database, while the other deletes the
users table.

![](/images/simple5.png.avif)

If these concepts are new to you, now you can finally enjoy this old hacker
joke about little Bobby Tables.

![](/images/simple6.png.avif)

Preventing Injection

As the old comic suggests, sanitizing the user input could have prevented the
issue. “Sanitizing” could have been done with Input Validation or escaping of
the single quote. However not all input can be validated and not all SQL
Injection is done with single quotes.

In the example below Injection takes advantage of an un-sanitized **ORDER BY**
parameter:

![](/images/simple7.png.avif)

In this case **Input Validation**  could be employed because column names
should be alphanumeric however this leads to a more complex defence strategy
where the application must employ **Input Validation**  for values going into
the **ORDER BY  **section and **Escaping**  for values going into the
**WHERE** clause.

There is however a simpler way. **Do not use concatenation at all**. This
approach also holds true for other Injection scenarios like Command Injection.

![](/images/simple8.png.avif)

This is a scenario where we can employ [Occam’s
Razor](https://simple.wikipedia.org/wiki/Occam%27s_razor) to identify the
simplest most universal defence to Injection attacks. The solution here is
using **Parameterized Statements.**

**Parameterized Statements**  interact with the command processor to separate
the variables from the SQL query, thus effectively neutralizing characters
that may influence the query.

![](/images/simple9.png.avif)

In Java this can be achieved by using a **Prepared Statement  **as per the
example below**.  **The question mark in the query string at line 3 is a
placeholder for the parameter value.

![](/images/simple10.png.avif)

When dealing with OS Commands, is best to avoid them completely and write the
equivalent functionality in your programming language of choice. For example
if you must read a file in Java use APIs such as **File**  and
**BufferedReader  **rather than the Linux **cat**  command. However in certain
cases there’s no choice and the code must **“Shell Out”**. For those
situations the equivalent of a **Prepared Statement  **is passing command line
arguments as a separate array, thus avoiding concatenation.

![](/images/simple11.png.avif)

# Object-Relational Mapping (ORM)

There’s an even better way to abstract SQL statements from application code.
ORM frameworks allow developers to work with objects rather than SQL queries.
Instead of working with the **users**  table developers would work with a
users collection and execute a method on that collection to return the
corresponding record.

![](/images/simple12.png.avif)

Under the covers the framework would perform a transformation similar to the
diagram below.

![](/images/simple13.png.avif)

# Caution

There are cases where **Injection**  will still occur in spite of
**Parameterized Statements**  being used. For example when the injection
occurs in a database stored procedure or the OS shell script being executed

In order to reduce the likelihood of such scenarios occurring, **Input
Validation**  should still be used as much as possible.

# To sum it all up

When reviewing a code change that involves a command processor look for the
following:

  * **Input Validation**  for known alphanumeric values

  * Employing **Parameterized Statements**

  * Using a **ORM framework**  where applicable


