/**
 Jo Disomma
 hw015
 worked with:
 advised by: 
  
 Exercise tolerance, truncation, rounding
 */

public class Nearness {

    public static void main( String[] commandLine) {

        oneTest( 13.0001, 0.001, 13);  // approximation is slightly too large
        oneTest( 12.9999, 0.001, 13);  // sim., but too small
        oneTest( 13.2, 0.001, 13);     // way off
        oneTest( 12.8, 0.001, 13);     // way off
        oneTest( 13.2, 0.3, 13);       // increased tolerance for error
        oneTest( 2.999999, 0.001, 3);  // verify values other than 13, too
        oneTest( 3.000002, 0.001, 3);

        /* Negative numbers require different rounding. Start with the
            naive (and wrong) calculation, as the assignment says.
        */
        oneTest( -8.00019, 0.001, -8);
        oneTest( -7.99999, 0.001, -8);

        // outside the tolerance, with negative numbers
        oneTest( -8.2, 0.001, -8);
        oneTest( -7.8, 0.001, -8);
    }

    /**
     Compare one approximate value with manipulations on that value.
     */
    private static void oneTest( double approx
                               , double tolerance
                               , int want
                               ) {
        System.out.println(
            "wanted: " + want
          + "  approx " + approx
          + "  w/i tolerance: " + withinTolerance( approx, tolerance, want)
          + "  truncated: " + "stub"
          + "  rounded: " + "invoke round()"
          );
    }

    /* Before programming, record the values you expect in the
       following table. That advance thinking will allow you to
       compare your expectations to results. Errors aid learning.

       wanted  approx   w/i tolerance  truncated  rounded naively
       ------  ------   -------------  ---------  ---------------
       13      13.0001  
       13      12.9999  
       13      13.2     
       13      12.8     
       13      13.2     
       3       2.999999 
       3       3.000002 
       -8      -8.00019 
       -8      -7.99999 
       -8      -8.2     
       -8      -7.8     
    */

    private static boolean withinTolerance( double approx
                                          , double tolerance
                                          , int want
                                          ) {
        return false;  // stub value
    }

}