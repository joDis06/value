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
