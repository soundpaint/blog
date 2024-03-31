---
layout: post
title: "Discrete Low Pass"
date: 2024-03-30 12:00:00 +0100
categories: misc
author: Jürgen
---

# Discrete Low Pass

There are lots of textbooks about analog filters.  There are fewer
textbooks about discrete filters.  There are only a few textbooks
about discrete filters that contain working sample code (besides the
well-written [English Wikipedia article _Low-pass
filter_](https://en.wikipedia.org/wiki/Low-pass_filter), I do not know
of any similarly useful discussion of the topic).  But I have not seen
any textbook about discrete filters with working sample code that gets
by without the theories of Laplace and Z transformation that, to my
observation, only very few people understand well.  So, let's design
an algorithm that works.

## The Maybe Most Often Used Discrete Low Pass Filter

Given an input signal as a series of input values, e.g. as an array
<code>double[] in</code>, in lots of existing software, you will find
code producing a filtered series of ouput values, e.g. again as an
array <code>double[] out</code>, to create an output signal, with some
constant coefficients <code>𝛼</code> and <code>𝛽</code>:

```
out[t] = 𝛼 * out[t-1] + 𝛽 * in[t];
```

Effectively, this is a weighted sum for mixing some previous output
value with the current input value to create the next output value.
The coefficients <code>𝛼</code> and <code>𝛽</code> usually are in the
range from <code>0.0</code> to <code>1.0</code> and sum up to
<code>1.0</code> to preserve the overall gain of the input signal.
Intuitively, continuously mixing the current output with the input
will blur the input signal, thus low-pass filtering the input signal.
(Actually, I intuitively used this formula myself when I was not older
than 14 years old.)  But what values to choose for coefficients
<code>𝛼</code> and <code>𝛽</code>?  Obviously, a value of
<code>𝛼</code> close to <code>0.0</code> will let the input signal
pass through almost unchanged, while a value near <code>1.0</code>
will make the input signal change the output only marginally, such
that short-lived changes in the input will have almost no effect,
while long-living changes in the input signal will slowly cause the
output to follow with some delay.

We suspect that the overall behavior is that of a simple low-pass
filter.  But what are the characteristics of this filter?  What is the
overall frequency response?  And how to choose coefficients
<code>𝛼</code> and <code>𝛽</code>?  We will see that the above
expression represents a discrete approximation of a simple RC low pass
filter, thus inheriting the characteristics of this filter.  We will
see how the coefficients <code>𝛼</code> and <code>𝛽</code> relate to
the cutoff frequency of the filter.

## Analog RC Filter

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2024-03-30/rc-low-pass.svg"
         alt="Fig. 1: RC Low Pass Analog Filter">
    <figcaption>Fig. 1: RC Low Pass<br />Analog Filter</figcaption>
  </figure>
</div>

We start with a short analysis of a simple RC filter with resistor
\\(R\\) and capacitor \\(C\\) (Fig. 1).  This filter is well-known to
have a cutoff frequency of \\(f_c=\frac{1}{2\pi\tau}\\) with
\\(\tau=RC\\), and steepness of 6dB per Octave above the cutoff
frequency, as e.g. discussed in the above mentioned Wikipedia article.
Many textbooks analyse the time response e.g. with Kirchhoff's rules,
and then directly dive into the Laplace transformtion and, for
discretization, the Z tranformation, expecting the reader to be
familiar with details of this theory.  For discretization, we go a
different path by directly solving the filter response for a given
input signal.  This path requires somewhat more work with solving
infinitesimal expressions, but frees us from dealing with Laplace and
Z transformation.

So, what is the RC low pass filter's output signal \\(U_{out}(t)\\) in
terms of its input signal \\(U_{in}(t)\\)?

### Preconditions

First of all, we denote \\(\tau = RC\\), as it will turn out that only
the product of the resistor's and capacitor's values is relevant for
the filter characteristics, but not their individual values (as long
as we do choose sane values for \\(R\\) and \\(C\\), such that
e.g. line drops do not start getting relevant).

Next, we assume that the incoming signal \\(U_{in}(t)\\) has
negligible low impedance, such that the current that flows into the
filter will have no significant impact on the input voltage.
Similarly, we assume that the load connected to the output of the
filter has negligible high impedance, such that there is no
significant flow through the output of the filter that could affect
the characteristics of the filter.  In a real-world analog filter
implementation, these two assumptions can be satisfied by adding a
unity gain amplifier immediately before and immediately after the
filter.

### Filter Response

Now, we derive an equation that expresses the filter response, that
is, its output signal in terms of its input signal.  Most textbooks
analyse the frequency response in the frequency domain.  This approach
is handy in combination with the Laplace transformation and for
immediately retrieving the frequency characteristics of the filter.
The downside of this approach is that you have to be familiar with the
theory of these non-trivial tools.  Therefore, we use a more low-level
approach for analysis: We try to express the filter's signal output
directly in terms of its signal input.

From looking at the circuit (Fig. 1), we immediately see that
\\(U_{out}(t) = U_{in}(t) - U_R(t)\\), with \\(U_R(t) = RI_R(t)\\)
according to Ohm's law \\(U=RI\\).  However, we also have \\(I_R(t) =
I_C(t)\\) since above we assumed that there is no significant flow
through the output of the filter.  The current through a capacitor
equals the change of its electrical charge over time, that is
\\(I_C(t) = \mathrm{d}Q_C(t)\mathrm{d}t\\).  And finally, the voltage
of a capacitor is its current electrical charge divided by its
capacity, that is \\(U_C(t) = Q_C(t) / C\\) or \\(Q_C(t) = CU_C(t)\\).
The output voltage of the filter is just the voltage of the capacitor,
that is \\(U_C(t) = U_{out}(t)\\).  In summary, with \\(\tau = RC\\)
as defined above, we get \\(U_{out}(t) = U_{in}(t) - \tau
\frac{\mathrm{d}U_{out}(t)}{\mathrm{d}t}\\), or

<span style="position:relative;">
\\(U_{out}^'(t) = \frac{1}{\tau}(U_{in}(t) - U_{out}(t)).\\)
<span style="position:absolute;width:195%;text-align:right;">(1)</span>
</span>

This equation is an ordinary linear differential equation of first
order.  A solution for this equation can be found in standard
textbooks on differential equations.  Assuming that there is some
initial value \\(U_{out}(t_0), t_0 \leq t_1\\) given (i.e. the
capacitor's charge at some earlier point of time \\(t_0\\)), the
equation has according to textbooks on differential equations the only
solution

<span style="position:relative;">
\\(
U_{out}(t_1) = e^\frac{t_0-t_1}{\tau} U_{out}(t_0) +
\frac{1}{\tau}\int_{t_0}^{t_1}U_{in}(t)e^\frac{t-t_1}{\tau}
\mathrm{d}t.
\\)
<span style="position:absolute;width:95%;text-align:right;">(2)</span>
</span>

For understanding the filter, we do not need to understand how this
solution is derived, but for us it is sufficient to just check that
the solution (2) indeed solves the differential equation (1) [TODO,
for now left as an exercise to the reader].

## Discretization

We assume that, in a time discrete system, the signal is sampled in
regular intervals of duration \\(T\\), also known as _sample period
time_, and giving a series of input signal samples

\\(
U_{in}(t_0), U_{in}(t_0 + T), U_{in}(t_0 + 2T), \ldots, U_{in}(t_0 + nT),
\\)

and so on.  Since we do not know the actual values in between, for
simplicity, we assume them to keep constant between two adjacent
samples: \\(U_{in}(t_0 + nT + t) \equiv U_{in}(t_0 + nT + T), \forall
0 < t \leq T\\).  Of course, we also could do linear or more complex
interpolation between the two samples, but to keep our equations
simple, we choose for the simplest case of a piecewise constant
function.  Next, we try to look at the output signal at time \\(t_0 +
T\\) and try to express it as simple as possible in terms of the input
and output signal for earlier samples.  Since the above solution of
the differential equation already introduces \\(t_0\\) and \\(t_1\\)
as points of time with freely choosable \\(t_0\\) as initial condition
\\(U_{out}(t_0)\\), we choose \\(t_0\\) and \\(t_1\\) without loss of
generality such that \\(T = t_1 - t_0\\) or, respectively, \\(t_1 =
t_0 + T\\).  Then, we get

\\(
U_{out}(t_0 + T) =\newline
U_{out}(t_1) =\newline
e^\frac{t_0-t_1}{\tau}U_{out}(t_0) +
\frac{1}{\tau}\int_{t_0}^{t_1}U_{in}(t)e^\frac{t-t_1}{\tau}
\mathrm{d}t=\\) (piecewise constancy \\(t\equiv{}t_1\\))

\\(e^\frac{-T}{\tau}U_{out}(t_0) +
\frac{1}{\tau}\int_{t_0}^{t_1}U_{in}(t_1)e^\frac{t-t_1}{\tau}
\mathrm{d}t=\newline
e^\frac{-T}{\tau}U_{out}(t_0) +
\frac{1}{\tau}U_{in}(t_1)e^\frac{-t_1}{\tau}\int_{t_0}^{t_1}e^\frac{t}{\tau}
\mathrm{d}t=\newline
e^\frac{-T}{\tau}U_{out}(t_0) +
\frac{1}{\tau}U_{in}(t_1)e^\frac{-t_1}{\tau}\[\tau{}e^\frac{t}{\tau}
\]_{t_0}^{t_1}=\\)

\\(
e^\frac{-T}{\tau}U_{out}(t_0) +
e^\frac{-t_1}{\tau}U_{in}(t_1)\[e^\frac{t}{\tau}
\]_{t_0}^{t_1}=\newline
\\)

\\(
e^\frac{-T}{\tau}U_{out}(t_0) +
e^\frac{-t_1}{\tau}U_{in}(t_1)(e^\frac{t_1}{\tau}-e^\frac{t_0}{\tau})=\newline
\\)

\\(
e^\frac{-T}{\tau}U_{out}(t_0) +
(1-e^\frac{t_0-t_1}{\tau})U_{in}(t_1)=\newline
\\)

\\(
e^\frac{-T}{\tau}U_{out}(t_0) +
(1-e^\frac{-T}{\tau})U_{in}(t_1)=\newline
\\)

\\(
\alpha{}U_{out}(t_0) + (1-\alpha)U_{in}(t_1)
\\)

for \\(\alpha=e^\frac{-T}{\tau}\\) and \\(\beta=1-\alpha\\), with
\\(\tau=RC\\) and \\(T\\) representing the sample period time.

That is, given the cutoff frequency \\(f_c=\frac{1}{2\pi\tau}\\) or
\\(\tau=\frac{1}{2\pi{}f_c}\\), we get

\\(\alpha=e^{-2\pi{}f_cT}\\) and \\(\beta=1-\alpha\\)

as coefficients <code>𝛼</code> and <code>𝛽</code> in our initial
simple low-pass filter algorithm with cutoff frequency \\(f_c\\) and
sample period time \\(T\\).

## Summary

We derived the response function (in the time domain) of an RC
low-pass filter and showed that the widespread, simple and naive
digital low pass filter algorithm indeed is an approximation for a
simple RC filter, assuming a piecewise constant sample function.  For
our analysis, we did not require knowledge about the Laplace or Z
transformation, but directly derived all equations from the
differential equation of the electrical circuit.  As a result, we
showed how to choose the coefficients <code>𝛼</code> and
<code>𝛽</code> in our simple algorithm for approximating an RC
low-pass filter with cutoff frequency \\(f_c\\).


<!--
## Future Work

TODO

## Conclusion

TODO
-->

## References

* For a general overview of the RC filter, the [English Wikipedia
  article _Low-pass
  filter_](https://en.wikipedia.org/wiki/Low-pass_filter) should be a
  good starting point, as already mentioned above.

* In 2009, I published [a conference paper on the Linux Audio
  Conference](https://lac.linuxaudio.org/2009/cdm/Saturday/15_Reuter/15.pdf)
  that in Sect. 3 contains even more thoughts on this topic.
