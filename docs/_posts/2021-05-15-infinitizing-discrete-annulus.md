---
layout: post
title: "Infinitizing Discrete Annulus"
date: 2021-05-15 14:51:00 +0100
categories: misc
author: Jürgen
---

# Infinitizing Discrete Annulus

Historically, the development of
[calculus](https://en.wikipedia.org/wiki/Calculus) was accompanied
with introducing the concept of _infinitesimals_.  Nowadays, discrete
structures are often approximated by contiguous models, assuming that
-- if the discrete structure grows siffuciently large -- from a bird's
eye view, the difference between the actual discrete reality and the
contiguous approximation is neglectable.  Motivation for modelling
discrete structures with real-valued contiguous models is that many
mathematical operators are applicable in a real-valued context only.

Approximation of discrete structures by real-valued models works
surprisingly well in many cases, but fails or requires unexpected
correction factors when switching between the models.  Such correction
factors, in fact, may be highly relevant in physics when modelling
quantized properties by real-valued models on a large scale.  In the
end, such factors even may be responsible for still unexplained
phenomena such as [dark
matter](https://en.wikipedia.org/wiki/Dark_matter) (which might as
well turn out to be simply a correction factor for gravity on
large-scale objects, rather than anything really existing).
Correction factors may also play a key role for understanding
mysterious numbers like the [fine-structure
constant](https://en.wikipedia.org/wiki/Fine-structure_constant), or
even the [muon anomaly](https://en.wikipedia.org/wiki/Muon_g-2).

In this short article, we examine such an unexpected correction factor
that is required when switching from a discrete model to its
real-valued counterpart, using an annulus as a very simple example.
In summary, the example in this article demonstates the pitfalls that
you may encounter when using contiguous mathematics (or, more
specifially, the calculus) in the domain of discrete structures such
as in quantum physics.

## Preliminaries

For the remainder of this article, we use the notation \\(A_\circ(r) =
\pi{}r^2\\) to denote the area of a circle with radius \\(r\\).

Next, let us take a look at the real-valued annulus and then at the
discrete annulus.

## Contiguous Annulus

In contiguous or real-valued mathematics, an
[annulus](https://en.wikipedia.org/wiki/Annulus_(mathematics)) is the
difference between the area of two circles of different size, located
in the same plane and sharing the same center point.

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/annulus.svg"
         alt="Fig. 1: Annulus Radius and Width">
    <figcaption>Fig. 1: Annulus Radius and Width</figcaption>
  </figure>
</div>

For simplicity of our model, rather than dealing with to separate
radiuses \\(r_1\\) and \\(r_2\\) for the smaller and larger circle,
respectively, we instead define our annulus by a single radius \\(r\\)
that refers to the center line of our annulus, and the width \\(w\\),
that represents the stroke width of our annulus.  Given \\(r\\) and
\\(w\\), we define \\(A_c(r, w)\\) to denote the area of the
contiguous annulus with radius \\(r\\) and width \\(w\\).  Since
\\(r\\) refers to the center line of our annulus, we essentially have
\\(r_1 = r - \frac{1}{2}w\\) for the smaller circle, and \\(r_2 = r +
\frac{1}{2}w\\) for the larger circle.

Area \\(A_c\\) of our contiguous annulus resolves as the difference
between the larger and the smaller circle as follows:

\\(
\begin{array}{rcl}
  A_c(r, w) & = & A_\circ(r_2) - A_\circ(r_1)\newline
  & = & \pi{}r_2^2 - \pi{}r_1^2\newline
  & = & \pi((r + \frac{1}{2}w)^2 - (r - \frac{1}{2}w)^2)\newline
  & = & \pi(r^2 + rw + \frac{1}{4}w^2 - r^2 + rw - \frac{1}{4}w^2)\newline
  & = & \pi(rw + rw)\newline
  & = & 2\pi{}rw.
\end{array}
\\)

In our graphically depicted example, we chose \\(r=3w\\), such that
for this example,

\\(A_c(3w, w) = 2\pi{}3w^2 = 6\pi{}w^2\\).

## Discrete Annulus

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/discrete-annulus.svg"
         alt="Fig. 2: Discrete Annulus Radius and Width">
    <figcaption>Fig. 2: Rasterized Annulus<br />Radius and Width</figcaption>
  </figure>
</div>

Now imagine we want to draw the same annulus on a rasterized
background.  That is, we construct an approximation of the before
contiguous annulus by putting square tiles on a bitmap.  We assume
that the square tiles have exactly the same width (and also height,
since they are squares) as the width that we used for the contiguous
annulus.  Given again \\(r\\) and \\(w\\), we define \\(A_d(r, w)\\)
to denote the area of the discrete annulus with radius \\(r\\) and
width \\(w\\) that best approximates its contiguous counterpart.  The
best approximation that we can find for this examples consists of
exactly 16 tiles.

Let us now compute the area for this discrete annulus.  Since we
assumed that each tile has width and height \\(w\\), the area of a
single tile is \\(w^2\\).  Since the best approximation that we could
find has exactly 16 tiles, the overall area is \\(16w^2\\) in our
example.

Comparing the discrete annulus' area to that of the contiguous for the
same width and radius (again with \\(r=3w\\) in the depicted example),
we get a ratio or correction factor \\(C_3\\) of

\\(
\begin{array}{rcl}
C_3 & = & A_d(3w, w) / A_c(3w, w)\newline
& = & 16w^2 / (6\pi{}w^2)\newline
& = & \frac{16}{6\pi}\newline
& = & \frac{8}{3\pi}\newline
& \approx & 0.8488.
\end{array}
\\)

That is, the area of our approximated rastered annulus is roughly
\\(15%\\) smaller compared to the area of the contiguous annulus.

For \\(r=3w\\) we get \\(C_3\approx0.8488\\).  What about larger
values of \\(r\\)?  Can we generalize this result for \\(r=nw\\) for
any positive integer value of \\(n\\)?  Does the correction factor
\\(C_n\\) converge to a stable limit for \\(n\to\infty\\)?

Yes we can!  All we have to know is how many tiles we need to
rasterize a circle with \\(r=nw\\) for any \\(n\in{}ℕ\\).  For
counting tiles, we first have to specify how a circle is rasterized at
all.  We choose to apply [Bresenham's
algorithm](https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm)
adapted for circles.

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/octant.svg"
         alt="Fig. 3: Raster Width of South East Octant">
    <figcaption>Fig. 3: Raster Width of<br />South East Octant</figcaption>
  </figure>
</div>

We devide the circle into \\(8\\) octants of equal length (as close as
rasterization permits) and have a look at the octant that starts at
the bottom point of the circle, following its contour counterclockwise
to the right until we have covered \\(1/8\\) of the circle.  Note that
everywhere in this octant, the
[slope](https://en.wikipedia.org/wiki/Slope) is not larger than
\\(1.0\\).  That is, when we move along the octant from left to right,
raster column by raster column, it is sufficient (but also necessary)
to plot a single tile for each raster column that we cross in order to
draw a contour without gaps, but also without drawing the same tile
multiple times.  So, the number of tiles in the octant that we draw
equals the horizontal extent of the octant, that is the number of
raster columns that the octant covers.  For a circle's radius of
\\(n\\) raster columns, the octant horizontally covers

\\(\lfloor\sin(\pi/4)\rfloor{}n = \lfloor\cos(\pi/4)\rfloor{}n =
\lfloor\frac{1}{2}\sqrt{2}\rfloor{}n\\)

raster columns.  Actually, when rounding to the floor value, we risk a
gap between the octants, while, when rounding to the ceiling value, we
risk to draw a tile twice on the octant's edge.  However, when looking
at the asymptotic behavior for \\(n\to\infty\\), it does not make any
difference, if we use the floor or ceiling function for rounding.
Since we have to draw all of the \\(8\\) octants to get a full circle,
we have to overall draw \\(8\lfloor\frac{1}{2}\sqrt{2}\rfloor{}n\\)
tiles for a circle with radius \\(r=nw\\).

## Ratio \\(A_d / A_c\\)

Now we can implement a program that computes the ratio values for any
\\(n\\).  Starting with \\(n=2\\) and iterating until \\(n=49\\), we
see that the ration wildly jumps in the range of roughly \\(0.6366
\dots 0.8988\\).

<label for="annulus_code_linear">Java Code for Linear Scale Ratios for
\\(n\in\lbrace1 \dots 49\rbrace\\)</label>

<textarea id="annulus_code_linear"
          name="annulus_code_linear" rows="10" cols="73"
          readonly="readonly">
public class AnnulusRatioLinear
{
  private static final double lp = 1.0;
  private static final double halfSquareRoot = Math.sqrt(0.5);

  public static void main(final String argv[])
  {
    for (int i = 2; i < 50; i++) {
      final double r = i;
      final double a1 = 2 * Math.PI * r * lp;
      final double a2 = 8 * ((long)(halfSquareRoot * r / lp)) * lp * lp;
      System.out.println("ratio=" + (a2 / a1));
    }
  }
}</textarea>

It even seems unclear if the ratio converges against some limit for
large values of \\(n\\).  Therefore, we change the loop to produce
exponentially growing radiuses for the range \\(n\in\lbrace2^1, \dots,
2^{59}\rbrace\\).  We do not go beyond values of around \\(2^{60}\\),
since we will see rounding errors or even number overflows when we get
too close to the numeric resolution limit of \\(64\\) bits of double
values.

<label for="annulus_code_logarithmic">Java Code on Logarithmic Scale
Ratios for Exponential \\(n\in\lbrace2^1, \dots,
2^{59}\rbrace\\)</label>

<textarea id="annulus_code_logarithmic"
          name="annulus_code_logarithmic" rows="10" cols="73"
          readonly="readonly">
public class AnnulusRatioLogarithmic
{
  private static final double lp = 1.0;
  private static final double halfSquareRoot = Math.sqrt(0.5);

  public static void main(final String argv[])
  {
    for (int i = 1; i < 60; i++) {
      final double r = 1l << i;
      final double a1 = 2 * Math.PI * r * lp;
      final double a2 = 8 * ((long)(halfSquareRoot * r / lp)) * lp * lp;
      System.out.println("ratio=" + (a2 / a1));
    }
  }
}</textarea>

As we now can see, the computation indeed seems to converge to some
value of approximately \\(0.9003163161571062\\).  Can we provide an
analytic expression for this numeric value?

Yes we can!  The ratio \\(A_d(w, r) / A_c(w, r)\\) for \\(r=nw, w=1.0,
n\in{}ℕ\\) evaluates as:

\\(
\begin{array}{rcl}
C_\infty{} & = & \lim_{n\to\infty}A_d(w, r) / A_c(w, r)\newline
& = & \frac{8\lfloor\frac{1}{2}\sqrt{2}\rfloor{}n}{2\pi{}n}\newline
& = & \frac{4\sqrt{2}n}{2\pi{}n}\newline
& = & \frac{2\sqrt{2}}{\pi}\newline
& \approx & 0.900316316,
\end{array}
\\)

just about the value that our algorithm returned for extremely high
values of \\(n\\).

## Making Of

This is somewhat ridiculous: What I am writing in this post (including
authoring the Java code and finding the proof) took me, maybe, half an
hour of time or alike.  In contrast, expanding my notes to this
full-blown blog post, including drawing all figures, took me roughly a
full day of work.  Maybe I need a secretary write post for my ideas?
🤷
