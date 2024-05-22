/**
  Loop through Strings
  extract limited to indexOfSubstring
 */
public class StringLooper {

    public String source;

    /**
       indexOfSubstring
       @return the index of the first occurrence of
               "seek"  (which can have any number of characters)
               in "within"
               or -1 if "seek" does not occur in "within".
     */
    public static int indexOfSubstring( String seek, String within) {
        int seekPos;  // position with "seek"
        boolean fullMatch; // value of "full sequence from 'seek' found in 'within'"

        // iterate through every possible starting position in "within"
        int withinPos = 0;
        while( withinPos < within.length() - seek.length() + 1) {
            fullMatch = true;  // assumption updated below
            
            // Compare each character in "seek" to the corresponding
            // character in "within"
            seekPos = 0;  // start each check at the beginning of "seek"
            while( seekPos < seek.length())
                fullMatch &= within.substring( withinPos + seekPos 
                                             , withinPos + seekPos + 1).equals(
                               seek.substring( seekPos, ++seekPos));
            if( fullMatch) return withinPos;
            ++withinPos;
        }
        return -1;  // seek does not appear
    }


    // /**
       // isFullMatch
       // @return
     // */
    // private? static? ReturnType isFullMatch( params here
                                           // , 
                                           // , 
                                           // , 
                                           // , 
                                           // ) {
        // code here
    // }


    /**
       Test methods in this class, especially private methods
       like isAllUpper
     */
    public static void main( String[] commandLine) {

        // test isFullMatch
        System.out.println( System.lineSeparator()
                          + "----- test isFullMatch -----");
        // System.out.println( isFullMatch( ?? );  // expecting ??
    }
}
