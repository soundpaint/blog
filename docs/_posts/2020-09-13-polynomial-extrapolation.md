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

12, 22, 50, 114, 232.

Assuming that the series is to be interpolated by a continuous
function that is as simple as possible, what is the next value of the
series?

### A More Formal Wording

More formally, we are looking for a real-valued polynomial function

    𝑓(𝑥)=𝑎ₙ𝑥ⁿ + … + 𝑎ᵢ𝑥ⁱ + … + 𝑎₂𝑥² + 𝑎₁𝑥 + 𝑎₀ = 𝑦,
    with 𝑥∈ℝ, 𝑦∈ℝ, 𝑎ᵢ∈ℝ, 0≤𝑖≤𝑛

with lowest possible degree 𝑛∈ℕ, such that

    𝑓(0)=12,
    𝑓(1)=22,
    𝑓(2)=50,
    𝑓(3)=114,
    𝑓(4)=232.

Then, the result in question is the value 𝑦 = 𝑓(5).

Note that instead of 𝑓(0), 𝑓(1), 𝑓(2), 𝑓(3), 𝑓(4), we could select any
equidistant set of arguments, such as 𝑓(-3.2), 𝑓(-1.2), 𝑓(0.8),
𝑓(2.8), 𝑓(4.8) and then expect the result in question as the value of
𝑦 = 𝑓(6.8).  However, for simplicity, we usually start with 𝑓(0) and
increment the argument by 1.

## Solution

Simply add a column of differences between the given values:

    𝑓(0)
         𝑓(1)-𝑓(0)
    𝑓(1)
         𝑓(2)-𝑓(1)
    𝑓(2)
         𝑓(3)-𝑓(2)
    𝑓(3)
         𝑓(4)-𝑓(3)
    𝑓(4)

Then add another column of differences of the differences:

    𝑓(0)
         𝑓(1)-𝑓(0)
    𝑓(1)           (𝑓(2)-𝑓(1)) - (𝑓(1)-𝑓(0))
         𝑓(2)-𝑓(1)
    𝑓(2)           (𝑓(3)-𝑓(2)) - (𝑓(2)-𝑓(1))
         𝑓(3)-𝑓(2)
    𝑓(3)           (𝑓(4)-𝑓(3)) - (𝑓(3)-𝑓(2))
         𝑓(4)-𝑓(3)
    𝑓(4)

And so on, until in the last column, there are no different values any
more.  In the extreme case, you continue adding columns, with each new
column containing one row less, until the lastly added column consists
of a single value.

Let us compute the differences for our running example:

     12
          10
     22       18
          28       18
     50       36
          64       18
    114       54
         118
    232

We can stop after adding three columns, since in the last column, both
values are 18.  Now, to extrapolate the next value of the series,
extend the last column by a row at the bottom by adding another 18,
and propagate it back by extending the difference network column by
column until reaching the first column:

     12
          10
     22       18
          28       18
     50       36
          64       18
    114       54
         118       18
    232

and then

     12
          10
     22       18
          28       18
     50       36
          64       18
    114       54
         118       18
    232       72

and then

     12
          10
     22       18
          28       18
     50       36
          64       18
    114       54
         118       18
    232       72
         190

and finally

     12
          10
     22       18
          28       18
     50       36
          64       18
    114       54
         118       18
    232       72
         190
    422

That's all!  The result in question, that is, the next value in the
series 12, 22, 50, 114, 232 is the value

    𝑦 = 𝑓(5) = 422.

## Some More Background

We stopped adding columns, when all rows of the last column contained
the same value.  In other words, the values in the last column
represent a _constant_ function.  Have a look at the last but one
column (values 18, 36, 54, 72): That is a linear function.  Of course,
it is, because in that column, the differences between two adjacent
values is always 18 (just the difference that we calculated in the
last column), thus making up a linear function as the series of the
sum of constant values.  Similarly, the last but two columns is the
series of sums of linear values, thus producing a quadratic series of
values.  Finally, the first column, containing our original series of
values, forms a series of values of a cubic function.

Combined with a little bit knowledge of differential calculus, we can
even compute the coefficients of the cubic function.  Note that,
resembling the derivation function 𝛿𝑥ⁿ / 𝛿𝑥 = 𝑛𝑥ⁿ⁻¹ in real-valued
analysis, the last, constant column contains the (𝑛-1) * ⋯ * 2 * 1
value of the actual coefficient.  For example, think of the function
𝑓(𝑥) = 𝑥³:

     0
          1
     1        6
          7       6
     8       12
         19       6
    27       18
         37
    64

Retrieving the value 6 in the constant column is similar to derivating
𝑥³ three times until getting to a constant:

(((𝛿𝑥³ / 𝛿𝑥) / 𝛿𝑥) / 𝛿𝑥) = ((𝛿3𝑥² / 𝛿𝑥) / 𝛿𝑥) = (𝛿6𝑥 / 𝛿𝑥) = 6

(In general, for a polynomial function of degree 𝑛∈ℕ, you will get a
value of 𝑛!.)

Accordingly, any coefficient other than 1 would result in a
corresponding constant in the last column.  For example, the function
𝑓(𝑥) = 𝑎𝑥³ would result in the last column to contain 6𝑎.  In effect,
_any_ function 𝑓(𝑥) = 𝑎𝑥³+𝑏𝑥²+𝑐𝑥+𝑑 would result in the last column
containing the value 6𝑎, since (just as with derivation in
infinitesimal calculus) the lower order 𝑥's coefficents are
differenced out.

## Determining All Coefficients of the Polynomial

Given our running example, we can now compute the coefficient of the
highest term 𝑥³ (we know that our polynomial function has degree 3,
since we stopped after adding three columns).

Since in our example, the last column contains 18 = 6𝑎, the first
coefficient of our polynomial function is 𝑎 = 3.  That is, our
function has the form 𝑓(𝑥) = 3𝑥³ + 𝑏𝑥² + 𝑐𝑥 + 𝑑.  Given this finding,
we can now define another polynomial function 𝑔(𝑥) = 𝑏𝑥² + 𝑐𝑥 + 𝑑 =
𝑓(𝑥) - 3𝑥³ to reduce the problem to a polynomial function with lower
degree, and repeat reduction until we end with a constant function.

Given our initial sample values for 𝑓(𝑥),

    𝑓(0)=12,
    𝑓(1)=22,
    𝑓(2)=50,
    𝑓(3)=114,
    𝑓(4)=232,

we can compute sample values for 𝑔(𝑥) = 𝑓(𝑥) - 3𝑥³ from the sample
values of 𝑓(𝑥) by subtracting 3𝑥³:

    𝑔(0) = 𝑓(0) - 3*0³ = 12  -   0 = 12,
    𝑔(1) = 𝑓(1) - 3*1³ = 22  -   3 = 19,
    𝑔(2) = 𝑓(2) - 3*2³ = 50  -  24 = 26,
    𝑔(3) = 𝑓(3) - 3*3³ = 114 -  81 = 33,
    𝑔(4) = 𝑓(4) - 3*4³ = 232 - 192 = 40.

Now, we can again build the difference triangle, just like we did for
𝑓(𝑥), but now for 𝑔(𝑥):

    12
        7
    19
        7
    26
        7
    33
        7
    40

Since we get constant values already in the first column that we add,
our polynomial function 𝑔(𝑥) is obviously a linear function, that is,
it has no quadratic term, but only a linear term (and, of course,
possibly a constant offset 𝑑).  For this linear term, again similar to
(𝛿𝑥¹ / 𝛿𝑥) = 1 in the infinitesimal calculus, we would expect 1 as
coefficent 𝑐 in the term 𝑐𝑥, but get 7.  Hence, the linear term in our
polynomial is 7𝑥.  That is, we have 𝑔(𝑥) = 7𝑥 + 𝑑 with 𝑑=12, since 12
= 𝑔(0) = 0𝑥 + 𝑑 = 𝑑.  That is, we have 𝑔(𝑥) = 7𝑥 + 12, and 𝑓(𝑥) =
3𝑥³ + 𝑔(𝑥), that is we get

    𝑓(𝑥) = 3𝑥³ + 7𝑥 + 12.

Given our initial values

    𝑓(0)=12,
    𝑓(1)=22,
    𝑓(2)=50,
    𝑓(3)=114,
    𝑓(4)=232,

we can double-check that the coefficients of our function 𝑓(𝑥) as well
as the next value in the series that we found to be

    𝑓(5)=422

are correct and we did not make a mistake, for example:

    𝑓(4) = 3*4³ + 7*4 + 12 = 232.

## Trivia

Before I developed the approach described in this article, I had
already solved the task of finding a way to convert temperature values
between Celsius (C°) and Fahrenheit (F°) (I stumbled around 1982 upon
this task in a school book for learning the English language, though
only with example conversions of specific values, but with this book
the general formula; so I tried to find out the conversion rule by
myself).  At that time, I already got the concept of a linear function
(though without knowing this term), and assumed it to apply onto this
problem.  Given the two specific function samples of 0°C = 32°F and
100°C = 212°F, and, for double checking, another sample of 50°C =
122°F, that is, in terms of the difference triangle in our polynomial
extrapolation method,

    𝑓(0)   = 32
                   90
    𝑓(50)  = 122
                   90
    𝑓(100) = 212


I quickly found out the general formula

    𝑦 = 𝑓(𝑥) = 1.8𝑥 + 32

by retrieving the value 1.8 = 90 / 50 from scaling down the 90 by 50,
according to the difference of 50 in the function arguments, and using
𝑓(0) = 32 as constant offset for converting from °C to °F.  The
reverse function resolves to

    𝑥 = 𝑔(𝑦) = 𝑓⁻¹(𝑦) = (𝑦 - 32) / 1.8

for converting from °F to °C.

That is, the temperature conversion problem can be viewed as a special
case of our polynomial extrapolation for the case of linear functions,
i.e. for polynomials of degree 1.  The polynomial extrapolation is a
generalization to all polynomial functions with any degree 𝑛∈ℕ.
