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

## Notational Preliminaries

For the remainder of this article, \\(ℕ\\) denotes the set of natural
numbers, that is, positive integer numbers.

We use the letter \\(A\\) to denote the area of some shape.  For
example, we use the notation \\(A_\circ(r) = \pi{}r^2\\) to denote the
area of a circle with radius \\(r\\).  The _floor_ function
\\(\lfloor{}x\rfloor\\) is used to convert real numbers into integer
numbers: it denotes the largest integer number that is not above the
argument \\(x\\).

Next, let us take a look at the real-valued annulus and then at the
discrete annulus.

## Contiguous Annulus

In contiguous or real-valued mathematics, an
[annulus](https://en.wikipedia.org/wiki/Annulus_(mathematics)) is the
difference between the area of two circles of different size, located
in the same plane and sharing the same center point.

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/contiguous-annulus.svg"
         alt="Fig. 1: Annulus Radius and Width">
    <figcaption>Fig. 1: Annulus with<br />Width w and Radius r=3w</figcaption>
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
for this specific example,

\\(A_c(3w, w) = 2\pi{}3w^2 = 6\pi{}w^2\\).

## Discrete Annulus

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/discrete-annulus.svg"
         alt="Fig. 2: Discrete Annulus Radius and Width">
    <figcaption>Fig. 2: Rasterized Annulus with<br />Width w and Radius r=3w</figcaption>
  </figure>
</div>

Now imagine we want to draw the same annulus on a rasterized
background, just like drawing on a bitmap image.  That is, we
construct an approximation of the previously contiguous annulus by
putting square tiles on the raster.  We assume that the square tiles
have exactly the same width (and also height, since we assume that
they are squares) as the stroke width that we used for the contiguous
annulus.  Given again \\(r\\) and \\(w\\), we define \\(A_d(r, w)\\)
to denote the area of the discrete annulus with radius \\(r\\) and
width \\(w\\) that best approximates its contiguous counterpart.  The
best approximation that we can find for our depicted specific example
consists of exactly \\(16\\) tiles, as you can see if you count the
tiles in the figure.

Let us now compute the area for this discrete annulus.  Since we
assumed that each tile has width and height \\(w\\), the area of a
single tile is \\(w^2\\).  Since the best approximation that we could
find for our specific example has exactly \\(16\\) tiles, the overall
area is

\\(A_d(3w, w) = 16w^2\\)

in our specific example.

## Specific Ratio \\(C_3 = A_d(3w, w) / A_c(3w, w)\\)

Naively, we would expect, that the contigous annulus and the discrete
annulus will have approximately the same area, at least on the large
scale for large radiuses.  So, let us compute the ratio between the
two areas, expecting a values close to \\(1.0\\), that converges to
exactly \\(1.0\\) for large radiuses.

Comparing the discrete annulus' area to that of the contiguous for the
same width and radius for our two specific depipted examples
(remember, both with \\(r=3w\\)), we get a ratio or correction factor
\\(C_3\\) of

\\(
\begin{array}{rcl}
C_3 & = & A_d(3w, w) / A_c(3w, w)\newline
& = & 16w^2 / (6\pi{}w^2)\newline
& = & \frac{16}{6\pi}\newline
& = & \frac{8}{3\pi}\newline
& \approx & 0.8488.
\end{array}
\\)

That is, the area of our approximated rastered annulus is more than
\\(15\%\\) smaller compared to the area of the contiguous annulus, at
least for our specific example with \\(r=3w\\).

## Counting Tiles with Bresenham

For \\(r=3w\\) we get ratio \\(C_3\approx0.8488\\).  What about larger
values of \\(r\\)?  Can we generalize ratio \\(C_n\\) for \\(r=nw\\)
for any positive integer value of \\(n\\)?  Does the ratio converge to
the value \\(1.0\\), as we would naively expect?  If not, does the
value of \\(C_n\\) at least converge to a stable correction factor for
\\(n\to\infty\\)?

Yes, we can generalize our result!  All we have to know is how many
tiles we need to rasterize an annulus with \\(r=nw\\) for any
\\(n\in{}ℕ\\).  For counting tiles, we first have to specify how a
annulus is rasterized at all.  We choose to apply [Bresenham's
algorithm](https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm)
adapted for annuli.

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/octant.svg"
         alt="Fig. 3: Raster Width of South East Octant">
    <figcaption>Fig. 3: Raster Width of<br />South East Octant</figcaption>
  </figure>
</div>

We devide the annulus into \\(8\\) octants of equal (as close as
rasterization permits) length and have a look at the octant that
starts at the bottom point of the annulus, following its contour
counterclockwise to the right until we have covered \\(1/8\\) of the
annulus.  Note that everywhere in this octant, the
[slope](https://en.wikipedia.org/wiki/Slope) is not larger than
\\(1.0\\).  That is, when we move along the octant from left to right,
raster column by raster column, height may change at most by one
raster row.  That is, there are not gaps in the raster with respect to
height, and it is sufficient (but also necessary) to plot a single
tile for each raster column that we cross from left to right in this
octant in order to draw a contour without gaps, but also without
drawing the same tile multiple times.  So, the number of tiles in the
octant that we draw equals the horizontal extent of the octant, that
is the number of raster columns that the octant covers.  The width of
an octant of an annulus with radius \\(r\\) is
\\(\frac{1}{2}\sqrt{2}r\\).  Accordingly, for an annulus' radius of
\\(n\\) raster columns, the octant horizontally covers

\\(\lfloor{}n\sin(\pi/4)\rfloor = \lfloor{}n\cos(\pi/4)\rfloor =
\lfloor{}n\frac{1}{2}\sqrt{2}\rfloor\\)

raster columns.  Actually, when rounding to the floor value, we risk a
single tile gap between two adjacent octants, while, when rounding to
the ceiling value, we risk to draw the same tile twice, once for each
of the two adjacent octants.  Therefore, in sum for all of the \\(8\\)
octants, our calculation of tiles for the rasterized annulus may be
off by at most 8 tiles.  However, when looking at the asymptotic
behavior for \\(n\to\infty\\), it does not make any difference, if we
use the floor or ceiling function for rounding.

So, we have calculated the number of tiles for a single octant.  Since
we have to consider all of the \\(8\\) octants to get a full annulus,
we have to overall draw \\(8\lfloor{}n\frac{1}{2}\sqrt{2}\rfloor\\)
tiles for an annulus with radius \\(r=nw\\).

## General Ratio \\(C_n = A_d(nw, w) / A_c(nw, w)\\)

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
      final long r = i;
      final double a1 = 2 * Math.PI * r * lp;
      final double a2 = 8 * ((long)(halfSquareRoot * r / lp)) * lp * lp;
      System.out.printf("%d %f%n", r, (a2 / a1));
    }
  }
}</textarea>

<div style="text-align:center">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/ratio-linear.svg"
         alt="Fig. 4: Ratio Convergence for Small-Scale Linear Radiuses">
    <figcaption>Fig. 4: Ratio Convergence for<br />Small-Scale Linear Radiuses</figcaption>
  </figure>
</div>

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
      final long r = 1l << i;
      final double a1 = 2 * Math.PI * r * lp;
      final double a2 = 8 * ((long)(halfSquareRoot * r / lp)) * lp * lp;
      System.out.printf("%d %f%n", r, (a2 / a1));
    }
  }
}</textarea>

<div style="text-align:center">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/ratio-logarithmic.svg"
         alt="Fig. 5: Ratio Convergence for Large-Scale Logarithmic Radiuses">
    <figcaption>Fig. 5: Ratio Convergence for<br />Large-Scale Logarithmic Radiuses</figcaption>
  </figure>
</div>

As we can see now on large scale, the computation indeed seems to
converge to some value of approximately \\(0.9003163161571062\\).  Can
we provide an analytic expression for this numeric value?

Yes we can!  Without loss of generality, we again choose \\(w=1.0\\)
and \\(r=nw, n\in{}ℕ\\).  Then the ratio \\(A_d(r, w) / A_c(r, w)\\)
evaluates as:

\\(
\begin{array}{rcl}
C_\infty{} & = & \lim_{n\to\infty}A_d(r, w) / A_c(r, w)\newline
& = & \lim_{n\to\infty}A_d(nw, w) / A_c(nw, w)\newline
& = & \lim_{n\to\infty}A_d(n, 1) / A_c(n, 1)\newline
& = & \lim_{n\to\infty}\frac{8\lfloor{}n\frac{1}{2}\sqrt{2}\rfloor}{2\pi{}n}\newline
& = & \lim_{n\to\infty}\frac{8n\frac{1}{2}\sqrt{2}}{2\pi{}n}\newline
& = & \lim_{n\to\infty}\frac{2\sqrt{2}}{\pi}\newline
& = & \frac{2\sqrt{2}}{\pi}\newline
& \approx & 0.900316316,
\end{array}
\\)

Note that we can drop the floor function
\\(\lfloor{}\centerdot{}\rfloor\\) for the real-value to integer
conversion when considering \\(n\to\infty\\), since the
off-by-less-than-one becomes neglectable for large values of \\(n\\).
The result that we get is just about the value that our algorithm
returned for extremely high values of \\(n\\).  In other words, our
initial problem of determining

\\(C_\infty = \lim_{n\to\infty}A_d(r=nw, w) / A_c(r=nw, w)\\)

resolves to the expression

\\(C_\infty = \frac{2\sqrt{2}}{\pi}\\).

## Variation of \\(w\\)

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/var-discrete-annulus.svg"
         alt="Fig. 6: Discrete Annulus Radius and Width">
    <figcaption>Fig. 6: Alternately Rasterized Annulus<br />with Width w and Radius r=2w</figcaption>
  </figure>
</div>

So far, we assumed that our tiles have width and height \\(w\\), which
is also the stroke width of the annulus.  This assumption was
reasonable in that tiles with width and height \\(w\\) are the best
possible match at the topmost, bottommost, leftmost and rightmost
place of the annulus.

Alternative, one may seek for a bestmost match on the diagonal
positions on the annulus.  This approach leads to tiles with diagonal
diameter of \\(w\\).  How does this change affect or modify our
previous results?

* For simplicity, we keep the tiling of our example with \\(16\\)
  tiles exactly the same, with still \\(16\\) tiles.
* Our new \\(w\\) is now the diagonal diameter of the tiles.
  Consequently, the new width and height of our tiles is now
  \\(\frac{1}{2}\sqrt2w\\), and the new area of our tiles is the
  square of the width or height, that is \\(\frac{1}{2}w^2\\).
* The total area of our varied discrete annulus with still \\(16\\)
  tiles is now \\(A_d(r, w) = 16\frac{1}{2}w^2 = 8w^2\\).
  Effectively, in terms of \\(w\\), the area of each tile, and thus
  the area of our complete discrete annulus has been halved.
* If it does not make any sense for you that the area has been halved,
  since on figure, the area looks still the same, then rather think of
  changing the unit, just as if you had been measuring your garden so
  far in square meters, and now you switch to square inches.  The area
  as drawn on paper is still the same, but its value changes due to
  changing the unit (the \\(w\\) is the unit that we changed).
* For our contiguous annulus, the area is still \\(2\pi{}rw\\), since
  this is true for any contiguous annulus with radius \\(r\\) and
  stroke width \\(w\\).  However, note that the radius (in terms of
  \\(w\\)) has been changed by our modification: The inner circle has
  been slightly moved towards the center, such that the tiles'
  diagonal diameter completely fits into the annulus.  Initially, our
  example was constructed with \\(r=3w\\).  With our change, we now
  have \\(r=2w\\), as the light blue tiles indicate (even if there
  placement is off by exactly half a column and row of the raster).
  That is, the area of the contiguous annulus in our alternate
  scenario now is \\(A_c(r, w) = 2\pi{}rw = 2\pi{}2w^2 = 4\pi{}w^2\\).

In summary, we get:

\\(
\begin{array}{rcl}
C_2 & = & A_d(r, w) / A_c(r, w)\newline
& = & A_d(2w, w) / A_c(2w, w)\newline
& = & 8w^2 / (4\pi{}w^2)\newline
& = & \frac{8}{4\pi}\newline
& = & \frac{2}{\pi}\newline
& \approx & 0.6366.
\end{array}
\\)

This result seems to be even lower than our previous \\(C_3\\), but is
not directly comparable, as we have seen that convergence for low
radiuses looks rather chaotic, and we now have the case \\(r=2w\\)
instead of the original \\(r=3w\\).  Hence, we need again to look at
Bresenham.

So, once again, without loss of generality, we choose \\(w=1.0\\) and
\\(r=nw, n\in{}ℕ\\).  Since \\(w\\) now designates the diameter of our
tiles, its width and height is each \\(\frac{1}{2}\sqrt2w\\), and its
area \\(\frac{1}{2}w^2\\).  Then the ratio \\(A_d(r, w) / A_c(r, w)\\)
evaluates similar to above, but with the tiles having half the size,
as:

\\(
\begin{array}{rcl}
C_\infty{} & = & \lim_{n\to\infty}A_d(r, w) / A_c(r, w)\newline
& = & \lim_{n\to\infty}A_d(nw, w) / A_c(nw, w)\newline
& = & \lim_{n\to\infty}A_d(n, 1) / A_c(n, 1)\newline
& = & \lim_{n\to\infty}\frac{\frac{1}{2}8\lfloor{}n\frac{1}{2}\sqrt{2}\rfloor}{2\pi{}n}\newline
& = & \lim_{n\to\infty}\frac{4n\frac{1}{2}\sqrt{2}}{2\pi{}n}\newline
& = & \lim_{n\to\infty}\frac{\sqrt{2}}{\pi}\newline
& = & \frac{\sqrt{2}}{\pi}\newline
& \approx & 0.450158158,
\end{array}
\\)

which is, now that the tiles have half of their original size, not
surprisingly also half of the above value.

## Smooth Contour

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/tile-sections.svg"
         alt="Fig. 7: Adding Additional Tiles">
    <figcaption>Fig. 7: Adding Additional<br />Tiles</figcaption>
  </figure>
</div>

Following Bresenham's algorithm, our rastered annulus so far was drawn
with the minimal number of tiles needed such that there are no gaps
between the tiles.  However, this method has the effect that
horizontally adjacent tiles on different rows will touch only in a
single corner point, creating hard edges in the contour, rather than
touching the next tile with always a full adjacent edge.  To achieve
the latter, one needs to add additional tiles that, in effect, make
the stroke of the annulus somewhat thicker and result in a larger
area.  How many additional tiles will this approach produce, and what
is the effect on our correction factor?

<div style="text-align:center; float:right">
  <figure class="image">
    <img src="{{site.baseurl}}/assets/images/2021-05-15/octant-dimensions.svg"
         alt="Fig. 8: Octant Width and Height">
    <figcaption>Fig. 8: Octant Width and Height</figcaption>
  </figure>
</div>

Remember that we are looking at an octant with slope not more than
\\(1.0\\).  The width of the octant is \\(\sqrt\frac{1}{2}r\\), and
its height is \\((1 - \sqrt\frac{1}{2})r\\).  Again following the
contour of the octant counterclockwise, we draw a a sequence of
sections of horizontally connected tiles, and every next section
starts one row above.  Therefore, additionally to the
\\(\lfloor\sqrt\frac{1}{2}r\rfloor\\) tiles, one for each column that
we pass, we additionally have to insert \\(\lfloor(1 -
\sqrt\frac{1}{2})r\rfloor\\) tiles, one tile for each change of row.
In summary, this makes \\(\lfloor{}r\rfloor\\) tiles for
\\(r\to\infty\\).

This affects the ratio as follows:

\\(
\begin{array}{rcl}
C_\infty{} & = & \lim_{n\to\infty}A_d(r, w) / A_c(r, w)\newline
& = & \lim_{n\to\infty}A_d(nw, w) / A_c(nw, w)\newline
& = & \lim_{n\to\infty}A_d(n, 1) / A_c(n, 1)\newline
& = & \lim_{n\to\infty}\frac{8\lfloor{}n\rfloor}{2\pi{}n}\newline
& = & \lim_{n\to\infty}\frac{8n}{2\pi{}n}\newline
& = & \lim_{n\to\infty}\frac{4}{\pi}\newline
& = & \frac{4}{\pi}\newline
& \approx & 1.273239545,
\end{array}
\\)

## Smooth Contour and Variation of \\(w\\)

For smooth contour, we get \\(C_\infty{} = \frac{4}{\pi}\\).  The
variation of \\(w\\) as discussed above, in effect halves the
correction factor.  That is, when applying both, smooth contour and
variation of \\(w\\), we get a correction factor of

\\(C_\infty{} = \frac{2}{\pi} \approx 0.636619772\\).

## Summary

When approximating an annulus of width \\(w\\) on a raster (like a
bitmap) with tiles, the area of the original annulus and the
approximation differ by a factor (that we denote as _correction
factor_) that converges for large radiuses to some value other than
\\(1.0\\).  The exact value depends on whether the raster tiles have
either width and height \\(w\\) or diameter \\(w\\), but also on the
exact method of tiling (either minimal number of tiles without
producing any gaps, or minimal number of tiles that always face a
complete edge to its neighbour, rather that just touching it just with
one of its corners).  For the different modus operandi, we get the
following correction factors:

| Square Tiles with | Width and Height \\(w\\) | Diameter \\(w\\) |
|---|---|---|
| Touching Corners Sufficient | \\(C_\infty{} = \frac{2\sqrt{2}}{\pi} \approx 0.900316316\\) | \\(C_\infty{} = \frac{\sqrt{2}}{\pi} \approx 0.450158158\\) |
|---|---|---|
| Touching Edges Required     | \\(C_\infty{} = \frac{4}{\pi} \approx 1.273239545\\) | \\(C_\infty{} = \frac{2}{\pi} \approx 0.636619772\\) |
|---|---|---|

## Future Work

Of course, further variations are imaginable, for example tiles that
are not square-shaped, or variations of the algorithm that selects the
tiles on the raster for approximating the contiguous annulus.

## Conclusion

We don't solve the problem of dark matter, nor do we directly
contribute to solve the mysteries of the fine structure constant or
muon anomaly.

However, this article shows on a very specific example that, when
using real-valued maths in the context of quantized (rasterized)
structures, we may need to apply a correction factor to compute valid
results -- even and in particular on the large scale, where you
naively would expect that you can neglect quantization.  Generally,
you can't neglect quantization even on the large scale, as the example
in this article shows!

## Making Of

This is somewhat ridiculous: Drawing a sketch of what I am writing in
this post (including authoring the Java code and compile all equations
and derivations) took me, maybe, half an hour of work time or alike.
In contrast, expanding my sparse notes and elaborating them into this
full-blown blog post, including drawing all figures, took me almost a
whole weekend of work, and I still see text passages that would
deserve more elaboration and explanation and that show up major flaws
with respect to consistency in notation especially for unexperienced
readers.  Maybe I need a secretary with sufficient mathematical
background for blowing up my sparse notes to full-blown blog posts and
for proof-reading?  🤷

Note that this article contains maths that you _should_ be familiar
with if you have visited an ordinary middle school, or in Germany
something like _gymnasiale Mittelstufe_ (actually, we do not even
require any knowledge on infinitesimal calculus throughout this whole
article).  All of the maths in this article were also well known at
least to the ancient Greeks, if not already to the ancient Egypts.
There is not at all any new or rocket science in this article.  Still,
all of these trivial facts presented in this article seem to be
unknown to many (hobby) physicists that put their heart and soul into
discussion on topics like dark matter or alike.  Actually, such
discussions where motivation and inspiration for me to write this
article, such that, in the future, I just can post a link to this
article, rather than to have to explain over and over again the most
trivial stuff to people that want to discuss physics but do not seem
to be aware of the most basic facts.  🙂
