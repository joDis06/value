/**
  Represent a date
 */
public class DateForApcs {


    // instance fields
    public short year;
    public byte  month_0_11;
    public byte  day_1_31;

    /**
      @return an ISO-8601 format of the date
      Processing courtesy of Intia
     */
    public static String iso8601( short year
                                , byte month_0_11
                                , byte day_1_31
                                ){
        String afterYear = "-"; 
        String afterMonth = "-"; 
        if( month_0_11 <= 8) afterYear =  "-0";
        if( day_1_31 <= 9)   afterMonth = "-0";
        return year + afterYear 
             + (month_0_11 + 1) + afterMonth
             + day_1_31;
    }

    public static boolean isLeapYear( short year) {
        return    year % 400 == 0
               ||    year % 4 == 0
                  && year % 100 != 0
               ;
    }


    public static boolean isEarlyJuly( DateForApcs d) {
        return    d.month_0_11 < 6     // before July
               || d.month_0_11 == 6    // in July, so...
                  && d.day_1_31 < 16;  // check the day
    }
}
