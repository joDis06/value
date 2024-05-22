/**
  Represent a date
 */

 /*
  Jo Disomma 
  hw020
worked with
advised by 

  */





public class DateForApcs {


    // instance fields
    public short year;
    public byte  month_0_11;
    public byte  day_1_31;

    // hw 20

 public static short yearStart = 1600;
 public static short yearEnd = 2501;
 public static short CurrentYear = 2022;
 public static short weekdayAtCurrentYearStart = 6;

    //

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


    public boolean isEarlyJuly() {
        return    month_0_11 < 6     // before July
               ||
                     month_0_11 == 6    // in July, so...
                  && day_1_31 < 16;   // check the day
         /* If neither of those is true, the date must
            be in a month after July.
         */
    }

    public static String advanceCurrentYear() {
      return CurrentYear += 1;
      return weekdayAtCurrentYearStart += 1;
    }

}
