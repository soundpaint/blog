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
}
