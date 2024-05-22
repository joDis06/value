/**
  Exercise the StringLooper class
  extract limited to indexOfSubstring
 */

public class UserOfStringLooper {
    public static void main( String[] commandLine) {
        StringLooper s0 = new StringLooper();

        // indexOfSubstring
        System.out.println( System.lineSeparator()
                          + "----- indexOfSubstring -----");
        // Concept: make the "within" argument a Martin ruler!
        System.out.println( StringLooper.indexOfSubstring( "45", "012345")); // expecting 4
        System.out.println( StringLooper.indexOfSubstring( "56", "012345")); // expecting -1
        System.out.println( StringLooper.indexOfSubstring( "0123", "0123")); // expecting 0

        /* Searching within an empty string makes sense, but after
           reflection, searching FOR an empty strings seems nonsensical:
               indexOfSubstring( "", "012")
           The empty string is before position 0, so what value
           could be returned?
        */

        System.out.println( StringLooper.indexOfSubstring( "012", "")); // expecting -1
                                           // a Martin ruler here can help
                                                             //   0123456
        System.out.println( StringLooper.indexOfSubstring( "ab", "aaabab")); // expecting 2
        
        // thanks tor Brian of pd1 for spotting my error which failed for this test:
        System.out.println( StringLooper.indexOfSubstring( "cca", "cccaa")); // expecting 1
    }
}