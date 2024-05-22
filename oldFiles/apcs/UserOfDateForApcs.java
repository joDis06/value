/**
  Exercise the DateForApcs class
 */
public class UserOfDateForApcs {
    
    public static void main( String[] commandLine) {

    // iso8601 test
    System.out.println( //expect 2001-09-11
       DateForApcs.iso8601((short) 2001, (byte)8, (byte)11));
    System.out.println();
       
    // isLeapYear tests
    leapTest( 1999);
    leapTest( 2000);
    leapTest( 2004);
    leapTest( 2100);
    }
    
    /**
      Display whether the year is a leap year.
     */
    public static void leapTest( int year
                               ) {
        String notOrNothing; // string " not" or nothing
        
        if( DateForApcs.isLeapYear((short) year))
             notOrNothing = "";
        else notOrNothing = " not";
        
        System.out.println( year + " is"
                          + notOrNothing
                          + " a leap year"
                          );
    }
}



