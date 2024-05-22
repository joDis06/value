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
    System.out.println();

    // hw018#4, from Piazza@130
    DateForApcs moonLanding = aDateForApcs( 1969, 07, 20);
    DateForApcs futureTrouble = aDateForApcs( 2038, 07, 04);
    System.out.println();

    // hw018#5 isEarlyJuly
    earlyTest( moonLanding);
    earlyTest( futureTrouble);
    
    // change futureTrouble to other dates to test
    futureTrouble.month_0_11 = 05;  // June precedes July 16
    futureTrouble.day_1_31 = 17;
    earlyTest( futureTrouble);
    
    // early November follows July 16
    futureTrouble.month_0_11 = 10;
    futureTrouble.day_1_31 = 12;
    earlyTest( futureTrouble);
    }


    /**
      Display whether a date is before July 16 in its year
     */
     private static void earlyTest( DateForApcs d) {
        String notOrNothing; // string " not" or nothing

        if( DateForApcs.isEarlyJuly( d))
             notOrNothing = "";
        else notOrNothing = " not";

        System.out.println(
            DateForApcs.iso8601( d.year
                             , d.month_0_11
                             , d.day_1_31
                             )
          + " is " + notOrNothing
          + " before July 16 in its year"
          );
     }


    /**
      Build, display, and return a DateForApcs
     */
    private static DateForApcs aDateForApcs( int yyyy
                                           , int mm
                                           , int dd
                                           ) {
        DateForApcs aDate;
        aDate = new DateForApcs();

        aDate.year = (short) yyyy;
        aDate.month_0_11 = (byte) (mm - 1);
        aDate.day_1_31 = (byte) dd;

        // check
        System.out.println(
            "built: "
          +  DateForApcs.iso8601( aDate.year
                                , aDate.month_0_11
                                , aDate.day_1_31
                                )

          + " ...expecting " + yyyy + "-" + mm + "-" + dd
          + " possibly with 0s added"
          );

        return aDate;
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



