---
layout: post
title: Binding Parameters
date: 2018-09-07
categories: ["Injection", "SQL Injection", "Input Validation", "Parameterized Statements", "ORM", "Secure Coding", "Code Review"]
excerpt: In the previous article we reviewed **Input Validation
---
In the previous article we reviewed **Input Validation**. While **Input
Validation** is an effective deterrent to a large number of attacks, including
**Injection** , not all input can be filtered.

For example imagine someone’s name is **O’Brien**. The single quote in**
O’Brien**happens to also be part of SQL command syntax. For example a website
may perform a database record search like this:

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713206157-ENASOUHB2UCI9BMN6A3T/simple.png)

Notice that the single quote in the name O’Brien is causing a syntax error.
The SQL command processor considers the string ends with **O**  and the rest,
**BRIEN%,**  is just an unrecognized command.

In order to work around this problem one must escape the single quote with a
another single quote like in the image below.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713271897-N4TUJ60E2SEKMBD51TBG/simple2.png)

However when this query is executed by a program, things look different. The
name would be read from a variable and the database query would be constructed
dynamically.

Let’s take a look at the following code snippet.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713319230-2U5TZSVK1M80R3F9SG5Q/simple3.png)

The variable **lastName  **contains input coming from the user. It is
concatenated to a constant SQL query string and the resulting command is
passed to the database server.

There is no input validation and no input escaping whatsoever. This means that
a user entering **O’Brien**  would cause an SQL syntax error, which is a bug.
However a malicious user would take advantage of this behaviour. What would
happen if the user entered something like the string below?

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713370154-EZA9PG5Z9YC1K19QI4QX/simple4.png)

The SQL query being passed to the database would end up being two different
commands. One selects all users in the database, while the other deletes the
users table.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713411063-P6N0K8TC4SMETBTNBXX4/simple5.png)

If these concepts are new to you, now you can finally enjoy this old hacker
joke about little Bobby Tables.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713459101-GTEDVVTEAM4QK2M1346D/simple6.png)

Preventing Injection

As the old comic suggests, sanitizing the user input could have prevented the
issue. “Sanitizing” could have been done with Input Validation or escaping of
the single quote. However not all input can be validated and not all SQL
Injection is done with single quotes.

In the example below Injection takes advantage of an un-sanitized **ORDER BY**
parameter:

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713514532-SRQWCCEXX43G59OTLYW2/simple7.png)

In this case **Input Validation**  could be employed because column names
should be alphanumeric however this leads to a more complex defence strategy
where the application must employ **Input Validation**  for values going into
the **ORDER BY  **section and **Escaping**  for values going into the
**WHERE** clause.

There is however a simpler way. **Do not use concatenation at all**. This
approach also holds true for other Injection scenarios like Command Injection.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713564176-7WLY6BL1DNR3XJV94ZUX/simple8.png)

This is a scenario where we can employ [Occam’s
Razor](https://simple.wikipedia.org/wiki/Occam%27s_razor) to identify the
simplest most universal defence to Injection attacks. The solution here is
using **Parameterized Statements.**

**Parameterized Statements**  interact with the command processor to separate
the variables from the SQL query, thus effectively neutralizing characters
that may influence the query.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713628199-AH7H20IWTGOU6AHSDVL9/simple9.png)

In Java this can be achieved by using a **Prepared Statement  **as per the
example below**.  **The question mark in the query string at line 3 is a
placeholder for the parameter value.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713679249-MD9DE4N38JPDVMDYZ7MU/simple10.png)

When dealing with OS Commands, is best to avoid them completely and write the
equivalent functionality in your programming language of choice. For example
if you must read a file in Java use APIs such as **File**  and
**BufferedReader  **rather than the Linux **cat**  command. However in certain
cases there’s no choice and the code must **“Shell Out”**. For those
situations the equivalent of a **Prepared Statement  **is passing command line
arguments as a separate array, thus avoiding concatenation.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713898911-MUBVEBEDEA06X7JEKJLC/simple11.png)

# Object-Relational Mapping (ORM)

There’s an even better way to abstract SQL statements from application code.
ORM frameworks allow developers to work with objects rather than SQL queries.
Instead of working with the **users**  table developers would work with a
users collection and execute a method on that collection to return the
corresponding record.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546713986252-SJCU9D7GPOI7VOWULYNJ/simple12.png)

Under the covers the framework would perform a transformation similar to the
diagram below.

![](https://images.squarespace-
cdn.com/content/v1/515f4a80e4b0d5cb9249bcc5/1546714031507-A9ZUZI5QAOACEO788U3A/simple13.png)

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


