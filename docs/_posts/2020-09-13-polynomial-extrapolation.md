---
layout: post
title: "Polynomial Extrapolation"
date: 2020-09-13 01:36:25 +0100
categories: misc
author: Jürgen
---

# Polynomial Extrapolation

This post describes a simple and fast mathematical approach for
extrapolating polynomial functions provided some certain preconditions
apply.  I developed this method around 1984 / 1985, at a time, when I
was not even aware of terminology like “polynomial” or “extrapolation”
and did not yet know about infinitesimal calculus.  In this sense, the
following description is in terms of my today's view of what I did
roughly 35 years ago.  Essentially, I developed kind of my own, though
very limited variation of something similar to a infinitesimal
calculus, however restricted to polynomial functions and based on
differences rather than on differentials.

## Motivation

I will introduce a very specific task that serves as running example
throughout this whole article.  Here it is.

### The Problem

Consider the _series_ of values

\\(12, 22, 50, 114, 232\\).

Assuming that the series is to be interpolated by a continuous
function that is as simple as possible, what is the next value of the
series?

### A More Formal Wording

More formally, we are looking for a real-valued polynomial function

\\(f(x) = a_nx^n + \ldots + a_ix^i + \ldots + a_2x^2 + a_1x + a_0 = y,
\newline\\)
with \\(x\in{}ℝ, y\in{}ℝ, a_i\in{}ℝ, 0\leq{}i\leq{}n\newline\\)
and with lowest possible degree \\(n\in{}ℕ\\),
such that

\\(
  f(0)=12,\newline
  f(1)=22,\newline
  f(2)=50,\newline
  f(3)=114,\newline
  f(4)=232.
\\)

Then, the result in question is the value \\(y = f(5)\\).

Note that instead of \\(f(0), f(1), f(2), f(3), f(4)\\), we could
select any equidistant set of arguments, such as \\(f(-3.2), f(-1.2),
f(0.8), f(2.8), f(4.8)\\) and then expect the result in question as
the value of \\(y = f(6.8)\\).  However, for simplicity, we usually
start with \\(f(0)\\) and increment the argument by \\(1\\).

## Solution

Simply add a column of differences between the given values:

\\(
\begin{matrix}
  f(0) \newline
  & f(1) - f(0) \newline
  f(1) \newline
  & f(2) - f(1) \newline
  f(2) \newline
  & f(3) - f(2) \newline
  f(3) \newline
  & f(4) - f(3) \newline
  f(4)
\end{matrix}
\\)

Then add another column of differences of the differences:

\\(
\begin{matrix}
  f(0) \newline
  & f(1) - f(0) \newline
  f(1) & & (f(2) - f(1)) - (f(1) - f(0)) \newline
  & f(2) - f(1) \newline
  f(2) & & (f(3) - f(2)) - (f(2) - f(1)) \newline
  & f(3) - f(2) \newline
  f(3) & & (f(4) - f(3)) - (f(3) - f(2)) \newline
  & f(4) - f(3) \newline
  f(4)
\end{matrix}
\\)

And so on, until in the last column, there are no different values any
more.  In the extreme case, you continue adding columns, with each new
column containing one row less, until the lastly added column consists
of a single value.

Let us compute the differences for our running example:

\\(
\begin{matrix}
  12 \newline
  & 10 \newline
  22 & & 18 \newline
  & 28 & & 18 \newline
  50 & & 36 \newline
  & 64 & & 18 \newline
  114 & & 54 \newline
  & 118 \newline
  232
\end{matrix}
\\)

We can stop after adding three columns, since in the last column, both
values are \\(18\\).  Now, to extrapolate the next value of the
series, extend the last column by a row at the bottom by adding
another \\(18\\), and propagate it back by extending the difference
network column by column until reaching the first column:

\\(
\begin{matrix}
  12 \newline
  & 10 \newline
  22 & & 18 \newline
  & 28 & & 18 \newline
  50 & & 36 \newline
  & 64 & & 18 \newline
  114 & & 54 \newline
  & 118 & & 18 \newline
  232
\end{matrix}
\\)

and then

\\(
\begin{matrix}
  12 \newline
  & 10 \newline
  22 & & 18 \newline
  & 28 & & 18 \newline
  50 & & 36 \newline
  & 64 & & 18 \newline
  114 & & 54 \newline
  & 118 & & 18 \newline
  232 & & 72
\end{matrix}
\\)

and then

\\(
\begin{matrix}
  12 \newline
  & 10 \newline
  22 & & 18 \newline
  & 28 & & 18 \newline
  50 & & 36 \newline
  & 64 & & 18 \newline
  114 & & 54 \newline
  & 118 & & 18 \newline
  232 & & 72 \newline
  & 190
\end{matrix}
\\)

and finally

\\(
\begin{matrix}
  12 \newline
  & 10 \newline
  22 & & 18 \newline
  & 28 & & 18 \newline
  50 & & 36 \newline
  & 64 & & 18 \newline
  114 & & 54 \newline
  & 118 & & 18 \newline
  232 & & 72 \newline
  & 190 \newline
  422
\end{matrix}
\\)

That's all!  The result in question, that is, the next value in the
series \\(12, 22, 50, 114, 232\\) is the value

\\(y = f(5) = 422\\).

## Some More Background

We stopped adding columns, when all rows of the last column contained
the same value.  In other words, the values in the last column
represent a _constant_ function.  Have a look at the last but one
column (values \\(18, 36, 54, 72\\)): That is a linear function.  Of
course, it is, because in that column, the differences between two
adjacent values is always \\(18\\) (just the difference that we
calculated in the last column), thus making up a linear function as
the series of the sum of constant values.  Similarly, the last but two
columns is the series of sums of linear values, thus producing a
quadratic series of values.  Finally, the first column, containing our
original series of values, forms a series of values of a cubic
function.

Combined with a little bit knowledge of differential calculus, we can
even compute the coefficients of the cubic function.  Note that,
resembling the derivation function
\\(\frac{\mathrm{d}x^n}{\mathrm{d}x} = nx^{n-1}\\) in real-valued
analysis, the last, constant column contains the \\((n-1) \cdot \ldots
\cdot 2 \cdot 1\\) value of the actual coefficient.  For example,
think of the function \\(f(x) = x^3\\):

\\(
\begin{matrix}
  0 \newline
  & 1 \newline
  1 & & 6 \newline
  & 7 & & 6 \newline
  8 & & 12 \newline
  & 19 & & 6 \newline
  27 & & 18 \newline
  & 37 \newline
  64
\end{matrix}
\\)

Retrieving the value 6 in the constant column is similar to derivating
\\(x^3\\) three times until getting to a constant:

\\(\frac{\mathrm{d}^3x^3}{\mathrm{d}x^3} =
\frac{\mathrm{d}^23x^2}{\mathrm{d}x^2} =
\frac{\mathrm{d}6x}{\mathrm{d}x} = 6\\)

(In general, for a polynomial function of degree \\(n\in{}ℕ\\), you
will get a value of \\(n!\\).)

Accordingly, any coefficient other than \\(1\\) would result in a
corresponding constant in the last column.  For example, the function
\\(f(x) = ax^3\\) would result in the last column to contain \\(6a\\).
In effect, _any_ function \\(f(x) = ax^3+bx^2+cx+d\\) would result in
the last column containing the value \\(6a\\), since (just as with
derivation in infinitesimal calculus) the lower order \\(x\\)'s
coefficents are differenced out.

## Determining All Coefficients of the Polynomial

Given our running example, we can now compute the coefficient of the
highest term \\(x^3\\) (we know that our polynomial function has
degree \\(3\\), since we stopped after adding three columns).

Since in our example, the last column contains \\(18 = 6a\\), the
first coefficient of our polynomial function is \\(a = 3\\).  That is,
our function has the form \\(f(x) = 3x^3 + bx^2 + cx + d\\).  Given
this finding, we can now define another polynomial function \\(g(x) =
bx^2 + cx + d = f(x) - 3x^3\\) to reduce the problem to a polynomial
function with lower degree, and repeat reduction until we end with a
constant function.

Given our initial sample values for \\(f(x)\\),

\\(
  f(0)=12,\newline
  f(1)=22,\newline
  f(2)=50,\newline
  f(3)=114,\newline
  f(4)=232,
\\)

we can compute sample values for \\(g(x) = f(x) - 3x^3\\) from the
sample values of \\(f(x)\\) by subtracting \\(3x^3\\):

\\(
\begin{matrix}
  g(0) & = & f(0) - 3 \cdot 0^3 & = & 12 & - & 0 & = & 12,\newline
  g(1) & = & f(1) - 3 \cdot 1^3 & = & 22 & - & 3 & = & 19,\newline
  g(2) & = & f(2) - 3 \cdot 2^3 & = & 50 & - & 24 & = & 26,\newline
  g(3) & = & f(3) - 3 \cdot 3^3 & = & 114 & - & 81 & = & 33,\newline
  g(4) & = & f(4) - 3 \cdot 4^3 & = & 232 & - & 192 & = & 40.
\end{matrix}
\\)

Now, we can again build the difference triangle, just like we did for
\\(f(x)\\), but now for \\(g(x)\\):

\\(
\begin{matrix}
  12 \newline
  & 7 \newline
  19 \newline
  & 7 \newline
  26 \newline
  & 7 \newline
  33 \newline
  & 7 \newline
  40
\end{matrix}
\\)

Since we get constant values already in the first column that we add,
our polynomial function \\(g(x)\\) is obviously a linear function,
that is, it has no quadratic term, but only a linear term (and, of
course, possibly a constant offset \\(d\\)).  For this linear term,
again similar to \\(\frac{\mathrm{d}x^1}{\mathrm{d}x} = 1\\) in the
infinitesimal calculus, we would expect \\(1\\) as coefficent \\(c\\)
in the term \\(cx\\), but get \\(7\\).  Hence, the linear term in our
polynomial is \\(7𝑥\\).  That is, we have \\(g(x) = 7x + d\\) with
\\(d=12\\), since \\(12 = g(0) = 0x + d = d\\).  That is, we have
\\(g(x) = 7x + 12\\), and \\(f(x) = 3x^3 + g(x)\\), that is we get

\\(f(x) = 3x^3 + 7x + 12\\).

Given our initial values

\\(
  f(0)=12,\newline
  f(1)=22,\newline
  f(2)=50,\newline
  f(3)=114,\newline
  f(4)=232,
\\)

we can double-check that the coefficients of our function \\(f(x)\\)
as well as the next value in the series that we found to be

\\(
  f(5)=422
\\)

are correct and we did not make a mistake, for example:

\\(
  f(4) = 3 \cdot 4^3 + 7 \cdot 4 + 12 = 232.
\\)

## Trivia

Before I developed the approach described in this article, I had
already solved the task of finding a way to convert temperature values
between Celsius (\\(°\mathrm{C}\\)) and Fahrenheit (\\(°\mathrm{F}\\))
(I stumbled around 1982 upon this task in a school book for learning
the English language, though only with example conversions of specific
values, but with this book the general formula; so I tried to find out
the conversion rule by myself).  At that time, I already got the
concept of a linear function (though without knowing this term), and
assumed it to apply onto this problem.  Given the two specific
function samples of \\(0°\mathrm{C} = 32°\mathrm{F}\\) and
\\(100°\mathrm{C} = 212°\mathrm{F}\\), and, for double checking,
another sample of \\(50°\mathrm{C} = 122°\mathrm{F}\\), that is, in
terms of the difference triangle in our polynomial extrapolation
method,

\\(
\begin{matrix}
  f(0) & = & 32 \newline
  & & & & 90 \newline
  f(50) & = & 122 \newline
  & & & & 90 \newline
  f(100) & = & 212
\end{matrix}
\\)

I quickly found out the general formula

\\(
  y = f(x) = 1.8x + 32
\\)

by retrieving the value \\(1.8 = \frac{90}{50}\\) from scaling down
the \\(90\\) by \\(50\\), according to the difference of \\(50\\) in
the function arguments, and using \\(f(0) = 32\\) as constant offset
for converting from \\(°\mathrm{C}\\) to \\(°\mathrm{F}\\).  The
reverse function resolves to

\\(
  x = g(y) = f^{-1}(y) = \frac{y - 32}{1.8}
\\)

for converting from \\(°\mathrm{F}\\) to \\(°\mathrm{C}\\).

That is, the temperature conversion problem can be viewed as a special
case of our polynomial extrapolation for the case of linear functions,
i.e. for polynomials of degree \\(1\\).  The polynomial extrapolation
is a generalization to all polynomial functions with any degree
\\(n\inℕ\\).
