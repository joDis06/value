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
        return true;   // stub for larger boolean expression
    }
}
