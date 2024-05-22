/**
  Loop through Strings
 */
public class StringLooper {

    public String source;

    /**
       indexOf1  (The name ends with the digit "one")
       @return the index of the first occurrence of
               the single character "seek1" 
               in "within"
               or -1 if "seek1" does not occur in "within".
       precondition: seek1 has exactly 1 character
     */
    public static int indexOf1( String seek1, String within) {
        int curPos = 0;
        while( curPos < within.length())
            if( within.substring( curPos, ++curPos).equals( seek1))
                return --curPos;
        return -1;  // seek does not appear
    }


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
            seekPos = 0;  // start each check at the beginning of "seek"
            while( seekPos < seek.length()) {
                fullMatch &= within.substring( withinPos + seekPos 
                                             , withinPos + seekPos +1).equals(
                               seek.substring( seekPos, ++seekPos));
            }
            if( fullMatch) return withinPos;
            ++withinPos;
        }
        return -1;  // seek does not appear
    }

    /*
     public static boolean isFullMatch() 
      
      
      
      
      
      
      
     */




}
